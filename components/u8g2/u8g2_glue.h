#pragma once

#include "u8g2.h"
#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

uint8_t u8g2_gpio_and_delay_esp32(u8x8_t* u8x8, uint8_t msg, uint8_t arg_int, void* arg_ptr);

uint8_t u8x8_hw_spi_esp32(u8x8_t* u8x8, uint8_t msg, uint8_t arg_int, void* arg_ptr);

void u8g2_Setup_st756x_flipper(
    u8g2_t* u8g2,
    const u8g2_cb_t* rotation,
    u8x8_msg_cb byte_cb,
    u8x8_msg_cb gpio_and_delay_cb);

void u8x8_d_st756x_init(u8x8_t* u8x8, uint8_t contrast, uint8_t regulation_ratio, bool bias);

void u8x8_d_st756x_set_contrast(u8x8_t* u8x8, int8_t contrast_offset);

void u8x8_d_st756x_set_inversion(u8x8_t* u8x8, bool arg);

/* SSD1306 I2C support (Heltec WiFi LoRa 32 V3) */
uint8_t u8x8_hw_i2c_esp32(u8x8_t* u8x8, uint8_t msg, uint8_t arg_int, void* arg_ptr);

void u8g2_Setup_ssd1306_i2c_128x64_noname_f(
    u8g2_t* u8g2,
    const u8g2_cb_t* rotation,
    u8x8_msg_cb byte_cb,
    u8x8_msg_cb gpio_and_delay_cb);

void ssd1306_hw_reset(void);

/* SSD1306 I2C low-level send (used by furi_hal_display.c) */
void ssd1306_i2c_send_cmd(uint8_t cmd);
void ssd1306_i2c_send_data(const uint8_t* data, size_t len);

#ifdef __cplusplus
}
#endif
