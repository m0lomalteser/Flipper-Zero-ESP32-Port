/**
 * @file u8g2_ssd1306_i2c.c
 * SSD1306 128x64 I2C display driver for u8g2 on ESP32.
 *
 * Provides:
 *   - u8x8_hw_i2c_esp32: u8x8 byte-level I2C callback for ESP32
 *   - u8g2_Setup_ssd1306_i2c_128x64_noname_f: full-buffer setup for SSD1306
 */

#include "u8g2_glue.h"
#include <furi.h>
#include <driver/i2c_master.h>
#include <driver/gpio.h>
#include <esp_log.h>
#include <boards/board.h>

#if BOARD_HAS_SSD1306_I2C

#define SSD1306_I2C_ADDR_CMD  ((BOARD_LCD_I2C_ADDR << 1) | 0)  /* Co=0, D/C#=0 */
#define SSD1306_I2C_ADDR_DATA ((BOARD_LCD_I2C_ADDR << 1) | 1)  /* Co=0, D/C#=1 */

static i2c_master_bus_handle_t s_i2c_bus = NULL;
static i2c_master_dev_handle_t s_ssd1306_dev = NULL;

/* ---- ESP32 I2C initialization ---- */

static void ssd1306_i2c_init(void) {
    if(s_i2c_bus) return;  /* already initialized */

    i2c_master_bus_config_t bus_cfg = {
        .i2c_port = I2C_NUM_0,
        .sda_io_num = BOARD_LCD_I2C_SDA,
        .scl_io_num = BOARD_LCD_I2C_SCL,
        .clk_source = I2C_CLK_SRC_DEFAULT,
        .glitch_ignore_cnt = 7,
        .flags.enable_internal_pullup = true,
    };
    ESP_ERROR_CHECK(i2c_new_master_bus(&bus_cfg, &s_i2c_bus));

    i2c_device_config_t dev_cfg = {
        .dev_addr_length = I2C_ADDR_BIT_LEN_7,
        .device_address = BOARD_LCD_I2C_ADDR,
        .scl_speed_hz = BOARD_LCD_I2C_FREQ_HZ,
    };
    ESP_ERROR_CHECK(i2c_master_bus_add_device(s_i2c_bus, &dev_cfg, &s_ssd1306_dev));

    ESP_LOGI("SSD1306", "I2C initialized (SDA=%d, SCL=%d, addr=0x%02X, freq=%d Hz)",
             BOARD_LCD_I2C_SDA, BOARD_LCD_I2C_SCL, BOARD_LCD_I2C_ADDR, BOARD_LCD_I2C_FREQ_HZ);
}

void ssd1306_i2c_send_cmd(uint8_t cmd) {
    if(!s_ssd1306_dev) return;
    uint8_t buf[2] = {0x00, cmd};  /* Co=0, D/C#=0, then command byte */
    i2c_master_transmit(s_ssd1306_dev, buf, 2, 100);
}

void ssd1306_i2c_send_data(const uint8_t* data, size_t len) {
    if(!s_ssd1306_dev || len == 0) return;
    /* I2C buffer is limited; send in chunks */
    const size_t chunk_size = 128;  /* safe chunk for ESP32 I2C */
    for(size_t i = 0; i < len; i += chunk_size) {
        size_t n = (len - i > chunk_size) ? chunk_size : (len - i);
        /* Prefix with data marker byte (Co=0, D/C#=1) */
        uint8_t buf[1 + 128];
        buf[0] = 0x40;  /* data mode */
        memcpy(buf + 1, data + i, n);
        i2c_master_transmit(s_ssd1306_dev, buf, n + 1, 100);
    }
}

/* ---- SSD1306 initialization sequence ---- */

static void ssd1306_init_display(void) {
    ssd1306_i2c_send_cmd(0xAE);  /* Display OFF */
    ssd1306_i2c_send_cmd(0xD5);  /* Set display clock div */
    ssd1306_i2c_send_cmd(0x80);
    ssd1306_i2c_send_cmd(0xA8);  /* Set multiplex ratio */
    ssd1306_i2c_send_cmd(0x3F);  /* 1/64 duty (0x3F = 64-1) */
    ssd1306_i2c_send_cmd(0xD3);  /* Set display offset */
    ssd1306_i2c_send_cmd(0x00);  /* No offset */
    ssd1306_i2c_send_cmd(0x40);  /* Set start line = 0 */
    ssd1306_i2c_send_cmd(0x8D);  /* Charge pump */
    ssd1306_i2c_send_cmd(0x14);  /* Enable charge pump (internal VCC) */
    ssd1306_i2c_send_cmd(0x20);  /* Memory addressing mode */
    ssd1306_i2c_send_cmd(0x00);  /* Horizontal addressing mode */
    ssd1306_i2c_send_cmd(0xA1);  /* Segment remap (column 127 = SEG0) */
    ssd1306_i2c_send_cmd(0xC8);  /* COM scan direction (remapped) */
    ssd1306_i2c_send_cmd(0xDA);  /* COM pins hardware config */
    ssd1306_i2c_send_cmd(0x12);  /* Alternative COM config, no COM disable */
    ssd1306_i2c_send_cmd(0x81);  /* Set contrast */
    ssd1306_i2c_send_cmd(0xCF);
    ssd1306_i2c_send_cmd(0xD9);  /* Pre-charge period */
    ssd1306_i2c_send_cmd(0xF1);
    ssd1306_i2c_send_cmd(0xDB);  /* VCOMH deselect level */
    ssd1306_i2c_send_cmd(0x40);
    ssd1306_i2c_send_cmd(0xA4);  /* Display from RAM */
    ssd1306_i2c_send_cmd(0xA6);  /* Normal display (not inverted) */
    ssd1306_i2c_send_cmd(0xAF);  /* Display ON */

    /* Set column address range (0-127) */
    ssd1306_i2c_send_cmd(0x21);  /* Column address */
    ssd1306_i2c_send_cmd(0x00);  /* Start = 0 */
    ssd1306_i2c_send_cmd(0x7F);  /* End = 127 */

    /* Set page address range (0-7) */
    ssd1306_i2c_send_cmd(0x22);  /* Page address */
    ssd1306_i2c_send_cmd(0x00);  /* Start = 0 */
    ssd1306_i2c_send_cmd(0x07);  /* End = 7 */
}

/* ---- u8x8 I2C byte callback ---- */

uint8_t u8x8_hw_i2c_esp32(u8x8_t* u8x8, uint8_t msg, uint8_t arg_int, void* arg_ptr) {
    UNUSED(u8x8);

    switch(msg) {
    case U8X8_MSG_BYTE_SEND: {
        /* For I2C mode, u8g2 sends commands and data through this.
         * The D/C# state is tracked by u8x8->i2c_address. */
        uint8_t* data = (uint8_t*)arg_ptr;
        uint8_t dc = u8x8->i2c_address & 1;

        if(dc == 0) {
            /* Command bytes */
            for(uint8_t i = 0; i < arg_int; i++) {
                ssd1306_i2c_send_cmd(data[i]);
            }
        } else {
            /* Data bytes */
            ssd1306_i2c_send_data(data, arg_int);
        }
        break;
    }
    case U8X8_MSG_BYTE_SET_DC:
        /* I2C: D/C# is encoded in i2c_address bit 0 */
        if(arg_int)
            u8x8->i2c_address = SSD1306_I2C_ADDR_DATA;
        else
            u8x8->i2c_address = SSD1306_I2C_ADDR_CMD;
        break;

    case U8X8_MSG_BYTE_INIT:
        ssd1306_i2c_init();
        break;

    case U8X8_MSG_BYTE_START_TRANSFER:
        /* I2C: no explicit CS; the address is sent with the first byte */
        break;

    case U8X8_MSG_BYTE_END_TRANSFER:
        /* I2C: transfer is complete after SEND */
        break;

    default:
        return 0;
    }

    return 1;
}

/* ---- SSD1306 display driver (u8x8 callback) ---- */

static const u8x8_display_info_t u8x8_ssd1306_128x64_display_info = {
    .chip_enable_level = 0,
    .chip_disable_level = 1,
    .post_chip_enable_wait_ns = 100,
    .pre_chip_disable_wait_ns = 100,
    .reset_pulse_width_ms = 1,
    .post_reset_wait_ms = 100,
    .sda_setup_time_ns = 50,
    .sck_pulse_width_ns = 100,
    .sck_clock_hz = 4000000UL,
    .spi_mode = 0,
    .i2c_bus_clock_100kHz = 4,
    .data_setup_time_ns = 30,
    .write_pulse_width_ns = 60,
    .tile_width = 16,
    .tile_height = 8,
    .default_x_offset = 0,
    .flipmode_x_offset = 0,
    .pixel_width = 128,
    .pixel_height = 64,
};

static uint8_t u8x8_d_ssd1306_128x64_common(u8x8_t* u8x8, uint8_t msg, uint8_t arg_int, void* arg_ptr) {
    uint8_t* ptr;
    uint8_t x, y, c;

    switch(msg) {
    case U8X8_MSG_DISPLAY_DRAW_TILE: {
        u8x8_tile_t* tile = (u8x8_tile_t*)arg_ptr;
        x = tile->x_pos * 8;
        y = tile->y_pos;
        c = tile->cnt * 8;
        ptr = tile->tile_ptr;

        /* Set column address */
        u8x8_cad_StartTransfer(u8x8);
        u8x8_cad_SendCmd(u8x8, 0x21);  /* Column addr */
        u8x8_cad_SendCmd(u8x8, x);
        u8x8_cad_SendCmd(u8x8, x + c - 1);
        u8x8_cad_SendCmd(u8x8, 0x22);  /* Page addr */
        u8x8_cad_SendCmd(u8x8, y);
        u8x8_cad_SendCmd(u8x8, y);
        u8x8_cad_EndTransfer(u8x8);

        /* Send pixel data */
        u8x8_cad_StartTransfer(u8x8);
        u8x8->i2c_address = SSD1306_I2C_ADDR_DATA;
        u8x8_cad_SendData(u8x8, c, ptr);
        u8x8_cad_EndTransfer(u8x8);
        break;
    }
    case U8X8_MSG_DISPLAY_SET_POWER_SAVE:
        u8x8_cad_StartTransfer(u8x8);
        u8x8_cad_SendCmd(u8x8, arg_int ? 0xAE : 0xAF);
        u8x8_cad_EndTransfer(u8x8);
        break;
    case U8X8_MSG_DISPLAY_SET_FLIP_MODE:
        u8x8_cad_StartTransfer(u8x8);
        if(arg_int) {
            u8x8_cad_SendCmd(u8x8, 0xA0);  /* Segment remap normal */
            u8x8_cad_SendCmd(u8x8, 0xC0);  /* COM scan normal */
        } else {
            u8x8_cad_SendCmd(u8x8, 0xA1);  /* Segment remap flipped */
            u8x8_cad_SendCmd(u8x8, 0xC8);  /* COM scan flipped */
        }
        u8x8_cad_EndTransfer(u8x8);
        break;
    case U8X8_MSG_DISPLAY_SETUP_MEMORY:
        u8x8_d_helper_display_setup_memory(u8x8, &u8x8_ssd1306_128x64_display_info);
        break;
    case U8X8_MSG_DISPLAY_INIT:
        u8x8_d_helper_display_init(u8x8);
        ssd1306_init_display();
        break;
    default:
        return 0;
    }
    return 1;
}

/* ---- Public setup function ---- */

void u8g2_Setup_ssd1306_i2c_128x64_noname_f(
    u8g2_t* u8g2,
    const u8g2_cb_t* rotation,
    u8x8_msg_cb byte_cb,
    u8x8_msg_cb gpio_and_delay_cb) {
    uint8_t tile_buf_height;
    uint8_t* buf;

    u8g2_SetupDisplay(u8g2, u8x8_d_ssd1306_128x64_common, u8x8_cad_001, byte_cb, gpio_and_delay_cb);
    buf = u8g2_m_16_8_f(&tile_buf_height);
    u8g2_SetupBuffer(u8g2, buf, tile_buf_height, u8g2_ll_hvline_vertical_top_lsb, rotation);
}

/* ---- Reset pin control (called from furi_hal_display_init) ---- */

void ssd1306_hw_reset(void) {
    if(BOARD_PIN_LCD_RST == UINT16_MAX) return;

    gpio_config_t rst_cfg = {
        .mode = GPIO_MODE_OUTPUT,
        .pin_bit_mask = 1ULL << BOARD_PIN_LCD_RST,
    };
    gpio_config(&rst_cfg);
    gpio_set_level((gpio_num_t)BOARD_PIN_LCD_RST, 1);
    vTaskDelay(pdMS_TO_TICKS(10));
    gpio_set_level((gpio_num_t)BOARD_PIN_LCD_RST, 0);
    vTaskDelay(pdMS_TO_TICKS(20));
    gpio_set_level((gpio_num_t)BOARD_PIN_LCD_RST, 1);
    vTaskDelay(pdMS_TO_TICKS(100));
}

#endif /* BOARD_HAS_SSD1306_I2C */
