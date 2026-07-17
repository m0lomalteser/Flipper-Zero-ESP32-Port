/**
 * @file target_input.c
 * Input driver for Heltec WiFi LoRa 32 V3: PRG button only
 *
 * Single-button navigation:
 *   Short press  -> InputKeyDown  (next item in menu)
 *   Long press   -> InputKeyOk    (select current item)
 *   Double click -> InputKeyBack  (go back / exit)
 */

#include "target_input.h"

#include <furi_hal_resources.h>
#include <driver/gpio.h>
#include <esp_err.h>

#define TAG "InputPRG"

/* Timing constants (milliseconds) */
#define INPUT_DEBOUNCE_POLLS        2U
#define INPUT_SHORT_PRESS_MAX_MS    300U
#define INPUT_LONG_PRESS_MS         700U
#define INPUT_DOUBLE_CLICK_MS       350U

typedef enum {
    PrgIdle,
    PrgPressed,
    PrgWaitSecond,
    PrgWaitDoubleClickExpire,
} PrgState;

typedef struct {
    bool raw_pressed;
    bool debounced_pressed;
    uint8_t debounce_polls;

    PrgState state;
    uint32_t press_started_at;
    uint32_t release_at;
    bool long_press_fired;
} PrgButtonState;

static PrgButtonState prg_state;

/* --- helpers --- */

static void input_publish(FuriPubSub* pubsub, InputKey key, InputType type, uint32_t sequence) {
    InputEvent event = {
        .sequence_source = INPUT_SEQUENCE_SOURCE_HARDWARE,
        .sequence_counter = sequence,
        .key = key,
        .type = type,
    };
    furi_pubsub_publish(pubsub, &event);
}

static void input_emit_short(FuriPubSub* pubsub, InputKey key, uint32_t sequence) {
    input_publish(pubsub, key, InputTypePress, sequence);
    input_publish(pubsub, key, InputTypeShort, sequence);
    input_publish(pubsub, key, InputTypeRelease, sequence);
}

static bool input_prg_is_pressed(void) {
    return gpio_get_level((gpio_num_t)gpio_button_boot.pin) == 0;
}

static void input_prg_init_gpio(void) {
    gpio_config_t config = {
        .pin_bit_mask = (1ULL << gpio_button_boot.pin),
        .mode = GPIO_MODE_INPUT,
        .pull_up_en = GPIO_PULLUP_ENABLE,
        .pull_down_en = GPIO_PULLDOWN_DISABLE,
        .intr_type = GPIO_INTR_DISABLE,
    };
    esp_err_t err = gpio_config(&config);
    if(err != ESP_OK) {
        FURI_LOG_E(TAG, "PRG button gpio_config failed: %s", esp_err_to_name(err));
    }
}

static void input_prg_init_state(PrgButtonState* state) {
    state->raw_pressed = input_prg_is_pressed();
    state->debounced_pressed = state->raw_pressed;
    state->debounce_polls = INPUT_DEBOUNCE_POLLS;
    state->state = PrgIdle;
    state->press_started_at = 0;
    state->release_at = 0;
    state->long_press_fired = false;
}

/* --- target_input interface --- */

void target_input_init(void) {
    input_prg_init_gpio();
    input_prg_init_state(&prg_state);
    FURI_LOG_I(TAG, "PRG button input initialized (single-button navigation)");
}

void target_input_poll(FuriPubSub* pubsub, uint32_t* sequence_counter) {
    uint32_t now = furi_get_tick();
    uint32_t short_max_ticks = furi_ms_to_ticks(INPUT_SHORT_PRESS_MAX_MS);
    uint32_t long_press_ticks = furi_ms_to_ticks(INPUT_LONG_PRESS_MS);
    uint32_t double_click_ticks = furi_ms_to_ticks(INPUT_DOUBLE_CLICK_MS);

    /* --- Debounce --- */
    bool raw = input_prg_is_pressed();
    if(raw == prg_state.raw_pressed) {
        if(prg_state.debounce_polls < INPUT_DEBOUNCE_POLLS) {
            prg_state.debounce_polls++;
        }
    } else {
        prg_state.raw_pressed = raw;
        prg_state.debounce_polls = 1;
    }

    bool pressed = (prg_state.debounce_polls >= INPUT_DEBOUNCE_POLLS) &&
                   (prg_state.debounced_pressed != prg_state.raw_pressed);
    if(pressed) {
        prg_state.debounced_pressed = prg_state.raw_pressed;
    }

    /* --- State machine --- */
    switch(prg_state.state) {
    case PrgIdle:
        if(pressed && prg_state.debounced_pressed) {
            prg_state.state = PrgPressed;
            prg_state.press_started_at = now;
            prg_state.long_press_fired = false;
        }
        break;

    case PrgPressed:
        if(prg_state.debounced_pressed) {
            /* Still held — check for long press */
            uint32_t held = now - prg_state.press_started_at;
            if(!prg_state.long_press_fired && held >= long_press_ticks) {
                prg_state.long_press_fired = true;
                input_emit_short(pubsub, InputKeyOk, ++(*sequence_counter));
            }
        } else {
            /* Released */
            uint32_t held = now - prg_state.press_started_at;
            if(held < long_press_ticks) {
                /* Short press detected — wait for possible second click */
                prg_state.state = PrgWaitSecond;
                prg_state.release_at = now;
            } else {
                /* Long press already fired, just go idle */
                prg_state.state = PrgIdle;
            }
        }
        break;

    case PrgWaitSecond:
        if(pressed && prg_state.debounced_pressed) {
            /* Second press detected within window → Back */
            input_emit_short(pubsub, InputKeyBack, ++(*sequence_counter));
            prg_state.state = PrgIdle;
            prg_state.long_press_fired = false;
        } else if(now - prg_state.release_at > double_click_ticks) {
            /* Double click window expired → emit Down (next) */
            input_emit_short(pubsub, InputKeyDown, ++(*sequence_counter));
            prg_state.state = PrgIdle;
        }
        break;

    default:
        prg_state.state = PrgIdle;
        break;
    }
}
