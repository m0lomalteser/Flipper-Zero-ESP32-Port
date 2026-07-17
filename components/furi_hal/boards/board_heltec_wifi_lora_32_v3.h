/**
 * @file board_heltec_wifi_lora_32_v3.h
 * Board definition: Heltec WiFi LoRa 32 V3
 *
 * MCU:      ESP32-S3 (dual-core Xtensa LX7)
 * Display:  SSD1306 128x64 OLED via I2C
 * Input:    PRG button (GPIO0) — single button navigation
 * LoRa:     SX1262 via SPI
 * LED:      Built-in LED (GPIO35)
 */

#pragma once

/* ---- Board metadata ---- */
#define BOARD_NAME        "Heltec WiFi LoRa 32 V3"
#define BOARD_TARGET      "esp32s3"

/* ---- Hardware Button Pins ---- */
#define BOARD_PIN_BUTTON_BOOT   0   /* PRG button (active low) */
#define BOARD_PIN_BATTERY_ADC   UINT16_MAX  /* No battery ADC */

/* ---- No Encoder ---- */
#define BOARD_PIN_ENCODER_A     UINT16_MAX
#define BOARD_PIN_ENCODER_B     UINT16_MAX
#define BOARD_PIN_ENCODER_BTN   UINT16_MAX

/* ---- Display Pins (SSD1306 OLED I2C) ---- */
/* For I2C displays, these SPI pins are unused but must be defined.
 * The display driver uses BOARD_PIN_LCD_I2C_SDA/SCL instead. */
#define BOARD_PIN_LCD_MOSI      UINT16_MAX
#define BOARD_PIN_LCD_SCLK      UINT16_MAX
#define BOARD_PIN_LCD_DC        UINT16_MAX
#define BOARD_PIN_LCD_CS        UINT16_MAX
#define BOARD_PIN_LCD_RST       21  /* OLED reset pin */
#define BOARD_PIN_LCD_BL        UINT16_MAX  /* No backlight (self-emissive OLED) */

/* ---- I2C Display Configuration ---- */
#define BOARD_LCD_I2C_SDA       17
#define BOARD_LCD_I2C_SCL       18
#define BOARD_LCD_I2C_ADDR      0x3C  /* SSD1306 default I2C address */
#define BOARD_LCD_I2C_FREQ_HZ   400000

/* ---- LCD Display Configuration (virtual, for u8g2 compat) ---- */
#define BOARD_LCD_H_RES         128
#define BOARD_LCD_V_RES         64
#define BOARD_LCD_SPI_HOST      SPI2_HOST  /* unused for I2C, but needed for compile */
#define BOARD_LCD_SPI_FREQ_HZ   (4000000)
#define BOARD_LCD_CMD_BITS      0
#define BOARD_LCD_PARAM_BITS    0
#define BOARD_LCD_SWAP_XY       false
#define BOARD_LCD_MIRROR_X      false
#define BOARD_LCD_MIRROR_Y      false
#define BOARD_LCD_INVERT_COLOR  false
#define BOARD_LCD_GAP_X         0
#define BOARD_LCD_GAP_Y         0
#define BOARD_LCD_BL_ACTIVE_LOW false
#define BOARD_LCD_COLOR_ORDER_BGR false
#define BOARD_LCD_SIDE_MARGIN   0

/* SSD1306 is natively 128x64 mono — no color mapping needed */
#define BOARD_LCD_FG_COLOR      0x0000  /* Black (background) */
#define BOARD_LCD_BG_COLOR      0xFFFF  /* White (foreground/UI elements) */

/* ---- Feature: SSD1306 OLED I2C display ---- */
#define BOARD_HAS_SSD1306_I2C   1

/* ---- SD Card — NOT PRESENT ---- */
#define BOARD_PIN_SD_CS         UINT16_MAX
#define BOARD_PIN_SD_MISO       UINT16_MAX

/* ---- Touch — NOT PRESENT ---- */
#define BOARD_PIN_TOUCH_SCL     UINT16_MAX
#define BOARD_PIN_TOUCH_SDA     UINT16_MAX
#define BOARD_PIN_TOUCH_RST     UINT16_MAX
#define BOARD_PIN_TOUCH_INT     UINT16_MAX
#define BOARD_TOUCH_I2C_ADDR    0x00
#define BOARD_TOUCH_I2C_PORT    I2C_NUM_0
#define BOARD_TOUCH_I2C_FREQ_HZ 0
#define BOARD_TOUCH_I2C_TIMEOUT 0

/* ---- SubGHz / CC1101 — NOT PRESENT ---- */
#define BOARD_PIN_CC1101_SCK    UINT16_MAX
#define BOARD_PIN_CC1101_CSN    UINT16_MAX
#define BOARD_PIN_CC1101_MISO   UINT16_MAX
#define BOARD_PIN_CC1101_MOSI   UINT16_MAX
#define BOARD_PIN_CC1101_GDO0   UINT16_MAX
#define BOARD_PIN_CC1101_GDO2   UINT16_MAX
#define BOARD_PIN_CC1101_SW1    UINT16_MAX
#define BOARD_PIN_CC1101_SW0    UINT16_MAX
#define BOARD_CC1101_SPI_SHARED 0

/* ---- NRF24 — NOT PRESENT ---- */
#define BOARD_HAS_NRF24         0

/* ---- Power Enable — NOT PRESENT ---- */
#define BOARD_PIN_PWR_EN        UINT16_MAX

/* ---- IR — NOT PRESENT ---- */
#define BOARD_PIN_IR_TX         UINT16_MAX
#define BOARD_PIN_IR_RX         UINT16_MAX

/* ---- NFC — NOT PRESENT ---- */
#define BOARD_PIN_NFC_SCL       UINT16_MAX
#define BOARD_PIN_NFC_SDA       UINT16_MAX
#define BOARD_PIN_NFC_IRQ       UINT16_MAX
#define BOARD_PIN_NFC_RST       UINT16_MAX
#define BOARD_NFC_I2C_PORT      I2C_NUM_0

/* ---- Speaker — NOT PRESENT ---- */
#define BOARD_PIN_SPEAKER_BCLK  UINT16_MAX
#define BOARD_PIN_SPEAKER_WCLK  UINT16_MAX
#define BOARD_PIN_SPEAKER_DOUT  UINT16_MAX

/* ---- WS2812 RGB LED — NOT PRESENT ---- */
#define BOARD_PIN_WS2812_DATA   UINT16_MAX
#define BOARD_WS2812_LED_COUNT  0

/* ---- Microphone — NOT PRESENT ---- */
#define BOARD_PIN_MIC_DATA      UINT16_MAX
#define BOARD_PIN_MIC_CLK       UINT16_MAX

/* ---- Qwiic / External I2C ---- */
/* Heltec V3 has no Qwiic connector and no BQ25896/BQ27220 power ICs.
 * Do NOT define BOARD_PIN_QWIIC_SDA/SCL — the display already uses the
 * new-gen I2C driver on I2C_NUM_0; defining these would cause the power
 * driver to install the legacy I2C driver on the same port → crash. */

/* ---- Built-in LED ---- */
#define BOARD_PIN_LED           35

/* ---- LoRa SX1262 pins (informational, not used by Flipper HAL) ---- */
/* SPI: SCK=9, MISO=11, MOSI=10, NSS=8 */
/* Control: RESET=12, DIO1=14, BUSY=13, VREG_EN=36, DIO2_AS_RF_SW=34 */

/* ---- Features ---- */
#define BOARD_HAS_TOUCH         0
#define BOARD_HAS_ENCODER       0
#define BOARD_HAS_SD_CARD       0
#define BOARD_HAS_BLE           1
#define BOARD_HAS_RGB_LED       0
#define BOARD_HAS_VIBRO         0
#define BOARD_HAS_SPEAKER       0
#define BOARD_HAS_IR            0
#define BOARD_HAS_IBUTTON       0
#define BOARD_HAS_RFID          0
#define BOARD_HAS_NFC           0
#define BOARD_HAS_SUBGHZ        0
#define BOARD_HAS_MIC           0
#define BOARD_HAS_SINGLE_BUTTON 1  /* PRG-only navigation */

/* Battery (virtual — no real fuel gauge) */
#define FURI_HAL_POWER_VIRTUAL_CAPACITY_MAH (1000U)

/* Stub BQ27220 fuel gauge / BQ25896 charger definitions (not present on board).
 * These are required by furi_hal_bq27220.c and furi_hal_bq25896.c which are
 * compiled unconditionally. The drivers probe for the IC and fail gracefully. */
#define BQ27220_ADDR       0x55
#define BQ_I2C_PORT        I2C_NUM_0
#define BQ_I2C_TIMEOUT     pdMS_TO_TICKS(100)
#define BQ25896_CHARGE_LIMIT 0
