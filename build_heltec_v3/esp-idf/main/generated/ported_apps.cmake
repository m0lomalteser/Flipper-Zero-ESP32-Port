set(ESP32_FAM_PORTED_OBJECT_TARGETS)

set(ESP32_FAM_ASSETS_SCRIPT "/Users/marlin/Flipper-Zero-ESP32-Port/tools/fam/compile_icons.py")
set(ESP32_FAM_RUNTIME_ROOT "${ESP32_FAM_GENERATED_DIR}/fam_runtime_root")
set(ESP32_FAM_RUNTIME_EXT_ROOT "${ESP32_FAM_RUNTIME_ROOT}/ext")
set(ESP32_FAM_STAGE_ASSETS_STAMP "${ESP32_FAM_RUNTIME_ROOT}/.assets.stamp")

add_library(esp32_fam_app_cli OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/cli/cli_main_commands.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/cli/cli_main_shell.c"
)
target_include_directories(esp32_fam_app_cli PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/cli"
)
target_compile_definitions(esp32_fam_app_cli PRIVATE SRV_CLI)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_cli)

add_library(esp32_fam_app_example_apps_assets OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/examples/example_apps_assets/example_apps_assets.c"
)
target_include_directories(esp32_fam_app_example_apps_assets PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/examples/example_apps_assets"
)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_example_apps_assets)

add_library(esp32_fam_app_example_apps_data OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/examples/example_apps_data/example_apps_data.c"
)
target_include_directories(esp32_fam_app_example_apps_data PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/examples/example_apps_data"
)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_example_apps_data)

add_library(esp32_fam_app_example_number_input OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/examples/example_number_input/example_number_input.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/examples/example_number_input/scenes/example_number_input_scene.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/examples/example_number_input/scenes/example_number_input_scene_input_max.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/examples/example_number_input/scenes/example_number_input_scene_input_min.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/examples/example_number_input/scenes/example_number_input_scene_input_number.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/examples/example_number_input/scenes/example_number_input_scene_show_number.c"
)
target_include_directories(esp32_fam_app_example_number_input PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/examples/example_number_input"
)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_example_number_input)

add_library(esp32_fam_app_js_blebeacon OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/modules/js_blebeacon.c"
)
target_include_directories(esp32_fam_app_js_blebeacon PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app"
)
target_compile_options(esp32_fam_app_js_blebeacon PRIVATE -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_js_blebeacon)

add_library(esp32_fam_app_js_event_loop OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/modules/js_event_loop/js_event_loop.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/modules/js_event_loop/js_event_loop_api_table.cpp"
)
target_include_directories(esp32_fam_app_js_event_loop PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app"
)
target_compile_options(esp32_fam_app_js_event_loop PRIVATE -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_js_event_loop)

add_library(esp32_fam_app_js_gui OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/modules/js_gui/js_gui.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/modules/js_gui/js_gui_api_table.cpp"
)
target_include_directories(esp32_fam_app_js_gui PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app"
)
target_compile_options(esp32_fam_app_js_gui PRIVATE -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_js_gui)

add_library(esp32_fam_app_js_gui__button_menu OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/modules/js_gui/button_menu.c"
)
target_include_directories(esp32_fam_app_js_gui__button_menu PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app"
)
target_compile_options(esp32_fam_app_js_gui__button_menu PRIVATE -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_js_gui__button_menu)

add_library(esp32_fam_app_js_gui__button_panel OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/modules/js_gui/button_panel.c"
)
target_include_directories(esp32_fam_app_js_gui__button_panel PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app"
)
target_compile_options(esp32_fam_app_js_gui__button_panel PRIVATE -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_js_gui__button_panel)

add_library(esp32_fam_app_js_gui__byte_input OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/modules/js_gui/byte_input.c"
)
target_include_directories(esp32_fam_app_js_gui__byte_input PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app"
)
target_compile_options(esp32_fam_app_js_gui__byte_input PRIVATE -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_js_gui__byte_input)

add_library(esp32_fam_app_js_gui__dialog OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/modules/js_gui/dialog.c"
)
target_include_directories(esp32_fam_app_js_gui__dialog PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app"
)
target_compile_options(esp32_fam_app_js_gui__dialog PRIVATE -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_js_gui__dialog)

add_library(esp32_fam_app_js_gui__empty_screen OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/modules/js_gui/empty_screen.c"
)
target_include_directories(esp32_fam_app_js_gui__empty_screen PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app"
)
target_compile_options(esp32_fam_app_js_gui__empty_screen PRIVATE -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_js_gui__empty_screen)

add_library(esp32_fam_app_js_gui__file_picker OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/modules/js_gui/file_picker.c"
)
target_include_directories(esp32_fam_app_js_gui__file_picker PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app"
)
target_compile_options(esp32_fam_app_js_gui__file_picker PRIVATE -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_js_gui__file_picker)

add_library(esp32_fam_app_js_gui__icon OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/modules/js_gui/icon.c"
)
target_include_directories(esp32_fam_app_js_gui__icon PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app"
)
target_compile_options(esp32_fam_app_js_gui__icon PRIVATE -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_js_gui__icon)

add_library(esp32_fam_app_js_gui__loading OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/modules/js_gui/loading.c"
)
target_include_directories(esp32_fam_app_js_gui__loading PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app"
)
target_compile_options(esp32_fam_app_js_gui__loading PRIVATE -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_js_gui__loading)

add_library(esp32_fam_app_js_gui__menu OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/modules/js_gui/menu.c"
)
target_include_directories(esp32_fam_app_js_gui__menu PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app"
)
target_compile_options(esp32_fam_app_js_gui__menu PRIVATE -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_js_gui__menu)

add_library(esp32_fam_app_js_gui__number_input OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/modules/js_gui/number_input.c"
)
target_include_directories(esp32_fam_app_js_gui__number_input PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app"
)
target_compile_options(esp32_fam_app_js_gui__number_input PRIVATE -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_js_gui__number_input)

add_library(esp32_fam_app_js_gui__popup OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/modules/js_gui/popup.c"
)
target_include_directories(esp32_fam_app_js_gui__popup PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app"
)
target_compile_options(esp32_fam_app_js_gui__popup PRIVATE -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_js_gui__popup)

add_library(esp32_fam_app_js_gui__submenu OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/modules/js_gui/submenu.c"
)
target_include_directories(esp32_fam_app_js_gui__submenu PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app"
)
target_compile_options(esp32_fam_app_js_gui__submenu PRIVATE -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_js_gui__submenu)

add_library(esp32_fam_app_js_gui__text_box OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/modules/js_gui/text_box.c"
)
target_include_directories(esp32_fam_app_js_gui__text_box PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app"
)
target_compile_options(esp32_fam_app_js_gui__text_box PRIVATE -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_js_gui__text_box)

add_library(esp32_fam_app_js_gui__text_input OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/modules/js_gui/text_input.c"
)
target_include_directories(esp32_fam_app_js_gui__text_input PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app"
)
target_compile_options(esp32_fam_app_js_gui__text_input PRIVATE -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_js_gui__text_input)

add_library(esp32_fam_app_js_gui__vi_list OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/modules/js_gui/vi_list.c"
)
target_include_directories(esp32_fam_app_js_gui__vi_list PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app"
)
target_compile_options(esp32_fam_app_js_gui__vi_list PRIVATE -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_js_gui__vi_list)

add_library(esp32_fam_app_js_gui__widget OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/modules/js_gui/widget.c"
)
target_include_directories(esp32_fam_app_js_gui__widget PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app"
)
target_compile_options(esp32_fam_app_js_gui__widget PRIVATE -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_js_gui__widget)

add_library(esp32_fam_app_js_math OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/modules/js_math.c"
)
target_include_directories(esp32_fam_app_js_math PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app"
)
target_compile_options(esp32_fam_app_js_math PRIVATE -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_js_math)

add_library(esp32_fam_app_js_notification OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/modules/js_notification.c"
)
target_include_directories(esp32_fam_app_js_notification PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app"
)
target_compile_options(esp32_fam_app_js_notification PRIVATE -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_js_notification)

add_library(esp32_fam_app_js_storage OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/modules/js_storage.c"
)
target_include_directories(esp32_fam_app_js_storage PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app"
)
target_compile_options(esp32_fam_app_js_storage PRIVATE -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_js_storage)

add_library(esp32_fam_app_cli_vcp OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/cli/cli_vcp.c"
)
target_include_directories(esp32_fam_app_cli_vcp PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/cli"
)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_cli_vcp)

add_library(esp32_fam_app_js_app OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/js_app.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/js_modules.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/js_thread.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/js_value.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/modules/js_flipper.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/modules/js_tests.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/plugin_api/app_api_table.cpp"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/views/console_view.c"
)
target_include_directories(esp32_fam_app_js_app PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app"
)
target_compile_options(esp32_fam_app_js_app PRIVATE -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_js_app)

add_library(esp32_fam_app_power_settings OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/settings/power_settings_app/power_settings_app.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/settings/power_settings_app/scenes/power_settings_scene.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/settings/power_settings_app/scenes/power_settings_scene_battery_info.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/settings/power_settings_app/scenes/power_settings_scene_power_off.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/settings/power_settings_app/scenes/power_settings_scene_reboot.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/settings/power_settings_app/scenes/power_settings_scene_reboot_confirm.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/settings/power_settings_app/scenes/power_settings_scene_start.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/settings/power_settings_app/views/battery_info.c"
)
target_include_directories(esp32_fam_app_power_settings PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/settings/power_settings_app"
)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_power_settings)

add_library(esp32_fam_app_storage_settings OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/settings/storage_settings/scenes/storage_settings_scene.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/settings/storage_settings/scenes/storage_settings_scene_benchmark.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/settings/storage_settings/scenes/storage_settings_scene_benchmark_confirm.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/settings/storage_settings/scenes/storage_settings_scene_factory_reset.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/settings/storage_settings/scenes/storage_settings_scene_format_confirm.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/settings/storage_settings/scenes/storage_settings_scene_formatting.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/settings/storage_settings/scenes/storage_settings_scene_internal_info.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/settings/storage_settings/scenes/storage_settings_scene_sd_info.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/settings/storage_settings/scenes/storage_settings_scene_start.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/settings/storage_settings/scenes/storage_settings_scene_unmount_confirm.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/settings/storage_settings/scenes/storage_settings_scene_unmounted.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/settings/storage_settings/storage_settings.c"
)
target_include_directories(esp32_fam_app_storage_settings PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/settings/storage_settings"
)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_storage_settings)

add_library(esp32_fam_app_dolphin OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/dolphin/dolphin.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/dolphin/helpers/dolphin_deed.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/dolphin/helpers/dolphin_state.c"
)
target_include_directories(esp32_fam_app_dolphin PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/dolphin"
)
target_compile_definitions(esp32_fam_app_dolphin PRIVATE SRV_DOLPHIN)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_dolphin)

add_library(esp32_fam_app_power_start OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/power/power_cli.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/power/power_service/power.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/power/power_service/power_api.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/power/power_service/power_settings.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/power/power_service/views/power_off.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/power/power_service/views/power_unplug_usb.c"
)
target_include_directories(esp32_fam_app_power_start PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/power"
)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_power_start)

add_library(esp32_fam_app_ble_spam OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/ble_spam/ble_auto_walk_log.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/ble_spam/ble_spam_app.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/ble_spam/ble_spam_hal.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/ble_spam/ble_tracker_hal.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/ble_spam/ble_uuid_db.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/ble_spam/ble_walk_hal.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/ble_spam/scenes/scene_auto_walk.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/ble_spam/scenes/scene_main.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/ble_spam/scenes/scene_pair_spam_custom.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/ble_spam/scenes/scene_race_detector.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/ble_spam/scenes/scene_running.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/ble_spam/scenes/scene_spam_menu.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/ble_spam/scenes/scene_tracker_geiger.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/ble_spam/scenes/scene_tracker_scan.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/ble_spam/scenes/scene_walk_char_detail.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/ble_spam/scenes/scene_walk_chars.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/ble_spam/scenes/scene_walk_scan.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/ble_spam/scenes/scene_walk_services.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/ble_spam/scenes/scenes.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/ble_spam/views/ble_auto_walk_view.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/ble_spam/views/ble_spam_view.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/ble_spam/views/ble_walk_detail_view.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/ble_spam/views/ble_walk_scan_view.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/ble_spam/views/race_detector_view.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/ble_spam/views/tracker_geiger_view.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/ble_spam/views/tracker_list_view.c"
)
target_include_directories(esp32_fam_app_ble_spam PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/ble_spam"
)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_ble_spam)

add_library(esp32_fam_app_wlan OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/scenes/scene_attack_targets.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/scenes/scene_client_picker.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/scenes/scene_connect.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/scenes/scene_evil_portal.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/scenes/scene_evil_portal_bridge_pwd.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/scenes/scene_evil_portal_bridge_ssid.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/scenes/scene_evil_portal_captured.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/scenes/scene_evil_portal_menu.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/scenes/scene_evil_portal_ssid.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/scenes/scene_handshake.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/scenes/scene_handshake_save_path.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/scenes/scene_handshake_settings.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/scenes/scene_lan.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/scenes/scene_live_creds.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/scenes/scene_main.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/scenes/scene_mitm_inject_code.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/scenes/scene_mitm_menu.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/scenes/scene_network_actions.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/scenes/scene_network_deauth.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/scenes/scene_network_scanning.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/scenes/scene_package_sniffer.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/scenes/scene_port_scanner.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/scenes/scene_ssid_connect.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/scenes/scene_ssid_screen.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/scenes/scene_ssid_spam.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/scenes/scene_ssid_spam_custom.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/scenes/scene_ssid_spam_run.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/scenes/scene_update_sd.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/scenes/scenes.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/views/wlan_connect_view.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/views/wlan_deauther_view.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/views/wlan_evil_portal_captured_view.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/views/wlan_evil_portal_view.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/views/wlan_handshake_channel_view.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/views/wlan_handshake_view.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/views/wlan_lan_view.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/views/wlan_live_creds_view.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/views/wlan_portscan_view.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/views/wlan_sd_update_view.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/views/wlan_sniffer_view.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/views/wlan_view_common.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/wlan_app.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/wlan_client_scanner.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/wlan_cred_sniff.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/wlan_evil_portal.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/wlan_evil_portal_bridge.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/wlan_evil_portal_html.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/wlan_evil_portal_templates.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/wlan_hal.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/wlan_handshake_parser.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/wlan_handshake_settings.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/wlan_html_inject.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/wlan_lan_cache.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/wlan_mitm_payloads.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/wlan_mitm_server.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/wlan_netcut.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/wlan_netscan.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/wlan_oui.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/wlan_passwords.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/wlan_pcap.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app/wlan_sd_update.c"
)
target_include_directories(esp32_fam_app_wlan PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/wlan_app"
)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_wlan)

add_library(esp32_fam_app_bad_usb OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/bad_usb_app.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/helpers/bad_usb_hid.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/helpers/ble_hid_ext_profile.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/helpers/ducky_script.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/helpers/ducky_script_commands.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/helpers/ducky_script_keycodes.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/scenes/bad_usb_scene.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/scenes/bad_usb_scene_config.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/scenes/bad_usb_scene_config_ble_mac.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/scenes/bad_usb_scene_config_ble_name.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/scenes/bad_usb_scene_config_layout.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/scenes/bad_usb_scene_config_usb_name.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/scenes/bad_usb_scene_config_usb_vidpid.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/scenes/bad_usb_scene_confirm_unpair.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/scenes/bad_usb_scene_done.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/scenes/bad_usb_scene_error.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/scenes/bad_usb_scene_file_select.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/scenes/bad_usb_scene_work.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/views/bad_usb_view.c"
)
target_include_directories(esp32_fam_app_bad_usb PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb"
)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_bad_usb)

add_library(esp32_fam_app_notification_settings OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/settings/notification_settings/notification_settings_app.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/settings/notification_settings/notification_settings_color_picker.c"
)
target_include_directories(esp32_fam_app_notification_settings PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/settings/notification_settings"
)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_notification_settings)

add_library(esp32_fam_app_passport OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/settings/dolphin_passport/passport.c"
)
target_include_directories(esp32_fam_app_passport PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/settings/dolphin_passport"
)
target_compile_definitions(esp32_fam_app_passport PRIVATE APP_PASSPORT)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_passport)

add_library(esp32_fam_app_clock OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/clock_app/clock_app.c"
)
target_include_directories(esp32_fam_app_clock PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/clock_app"
)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_clock)

add_library(esp32_fam_app_js_app_start OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/js_app.c"
)
target_include_directories(esp32_fam_app_js_app_start PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app"
)
target_compile_options(esp32_fam_app_js_app_start PRIVATE -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_js_app_start)

add_library(esp32_fam_app_power OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/power/power_cli.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/power/power_service/power.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/power/power_service/power_api.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/power/power_service/power_settings.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/power/power_service/views/power_off.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/power/power_service/views/power_unplug_usb.c"
)
target_include_directories(esp32_fam_app_power PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/power"
)
target_compile_definitions(esp32_fam_app_power PRIVATE SRV_POWER)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_power)

add_library(esp32_fam_app_storage OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/storage/filesystem_api.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/storage/storage.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/storage/storage_cli.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/storage/storage_external_api.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/storage/storage_glue.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/storage/storage_internal_api.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/storage/storage_processing.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/storage/storage_sd_api.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/storage/storages/sd_notify.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/storage/storages/storage_ext.c"
)
target_include_directories(esp32_fam_app_storage PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/storage"
)
target_compile_definitions(esp32_fam_app_storage PRIVATE SRV_STORAGE)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_storage)

add_library(esp32_fam_app_desktop OBJECT
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/animations/animation_manager.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/animations/animation_storage.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/animations/views/bubble_animation_view.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/animations/views/one_shot_animation_view.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/desktop.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/desktop_settings.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/helpers/mesh_capture.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/helpers/mesh_config.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/helpers/mesh_service.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/helpers/pin_code.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/helpers/qflipper_bridge.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/helpers/slideshow.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/scenes/desktop_scene.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/scenes/desktop_scene_debug.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/scenes/desktop_scene_fault.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/scenes/desktop_scene_hw_mismatch.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/scenes/desktop_scene_lock_menu.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/scenes/desktop_scene_locked.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/scenes/desktop_scene_main.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/scenes/desktop_scene_mesh_action.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/scenes/desktop_scene_mesh_clients.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/scenes/desktop_scene_mesh_device.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/scenes/desktop_scene_mesh_handshake.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/scenes/desktop_scene_mesh_pair.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/scenes/desktop_scene_mesh_wifi.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/scenes/desktop_scene_pin_input.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/scenes/desktop_scene_pin_timeout.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/scenes/desktop_scene_secure_enclave.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/scenes/desktop_scene_slideshow.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/scenes/desktop_scene_usb_storage.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/views/desktop_view_debug.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/views/desktop_view_lock_menu.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/views/desktop_view_locked.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/views/desktop_view_main.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/views/desktop_view_mesh_action.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/views/desktop_view_mesh_clients.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/views/desktop_view_mesh_device.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/views/desktop_view_mesh_handshake.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/views/desktop_view_mesh_wifi.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/views/desktop_view_pin_input.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/views/desktop_view_pin_timeout.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/views/desktop_view_slideshow.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/views/desktop_view_usb_storage.c"
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop/views/mesh_view_common.c"
)
target_include_directories(esp32_fam_app_desktop PRIVATE
    "/Users/marlin/Flipper-Zero-ESP32-Port/applications/services/desktop"
)
target_compile_definitions(esp32_fam_app_desktop PRIVATE SRV_DESKTOP)
list(APPEND ESP32_FAM_PORTED_OBJECT_TARGETS esp32_fam_app_desktop)

add_custom_command(
    OUTPUT "${ESP32_FAM_STAGE_ASSETS_STAMP}"
    COMMAND ${CMAKE_COMMAND} -E remove_directory "${ESP32_FAM_RUNTIME_ROOT}"
    COMMAND ${CMAKE_COMMAND} -E make_directory "${ESP32_FAM_RUNTIME_EXT_ROOT}/apps_assets"
    COMMAND ${CMAKE_COMMAND} -E make_directory "${ESP32_FAM_RUNTIME_EXT_ROOT}/apps_assets/example_apps_assets"
    COMMAND ${CMAKE_COMMAND} -E copy_directory "/Users/marlin/Flipper-Zero-ESP32-Port/applications/examples/example_apps_assets/files" "${ESP32_FAM_RUNTIME_EXT_ROOT}/apps_assets/example_apps_assets"
    COMMAND ${CMAKE_COMMAND} -E make_directory "${ESP32_FAM_RUNTIME_EXT_ROOT}/apps_assets/js_app"
    COMMAND ${CMAKE_COMMAND} -E copy_directory "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/examples" "${ESP32_FAM_RUNTIME_EXT_ROOT}/apps_assets/js_app"
    COMMAND ${CMAKE_COMMAND} -E make_directory "${ESP32_FAM_RUNTIME_EXT_ROOT}/apps_assets/bad_usb"
    COMMAND ${CMAKE_COMMAND} -E copy_directory "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources" "${ESP32_FAM_RUNTIME_EXT_ROOT}/apps_assets/bad_usb"
    COMMAND ${CMAKE_COMMAND} -E make_directory "${ESP32_FAM_RUNTIME_EXT_ROOT}/apps_assets/clock"
    COMMAND ${CMAKE_COMMAND} -E copy_directory "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/clock_app/resources" "${ESP32_FAM_RUNTIME_EXT_ROOT}/apps_assets/clock"
    COMMAND ${CMAKE_COMMAND} -E touch "${ESP32_FAM_STAGE_ASSETS_STAMP}"
    DEPENDS
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/examples/example_apps_assets/files/poems/a jelly-fish.txt"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/examples/example_apps_assets/files/poems/my shadow.txt"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/examples/example_apps_assets/files/poems/theme in yellow.txt"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/examples/example_apps_assets/files/test_asset.txt"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/Install_qFlipper_gnome.txt"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/Install_qFlipper_macOS.txt"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/Install_qFlipper_windows.txt"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/assets/layouts/ba-BA.kl"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/assets/layouts/colemak.kl"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/assets/layouts/cz_CS.kl"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/assets/layouts/da-DA.kl"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/assets/layouts/de-CH.kl"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/assets/layouts/de-DE-mac.kl"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/assets/layouts/de-DE.kl"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/assets/layouts/dvorak.kl"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/assets/layouts/en-UK.kl"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/assets/layouts/en-US.kl"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/assets/layouts/es-ES.kl"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/assets/layouts/es-LA.kl"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/assets/layouts/fi-FI.kl"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/assets/layouts/fr-BE.kl"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/assets/layouts/fr-CA.kl"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/assets/layouts/fr-CH.kl"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/assets/layouts/fr-FR-mac.kl"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/assets/layouts/fr-FR.kl"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/assets/layouts/hr-HR.kl"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/assets/layouts/hu-HU.kl"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/assets/layouts/it-IT-mac.kl"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/assets/layouts/it-IT.kl"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/assets/layouts/nb-NO.kl"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/assets/layouts/nl-NL.kl"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/assets/layouts/pt-BR.kl"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/assets/layouts/pt-PT.kl"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/assets/layouts/si-SI.kl"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/assets/layouts/sk-SK.kl"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/assets/layouts/sv-SE.kl"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/assets/layouts/tr-TR.kl"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/demo_chromeos.txt"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/demo_gnome.txt"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/demo_macos.txt"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/demo_windows.txt"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/bad_usb/resources/badusb/test_mouse.txt"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/clock_app/resources/ibtnfuzzer/example_uids_cyfral.txt"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/clock_app/resources/ibtnfuzzer/example_uids_ds1990.txt"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/clock_app/resources/ibtnfuzzer/example_uids_metakom.txt"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/clock_app/resources/music_player/Marble_Machine.fmf"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/clock_app/resources/rfidfuzzer/example_uids_em4100.txt"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/clock_app/resources/rfidfuzzer/example_uids_h10301.txt"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/clock_app/resources/rfidfuzzer/example_uids_hidprox.txt"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/clock_app/resources/rfidfuzzer/example_uids_pac.txt"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/clock_app/resources/subplaylist/example_playlist.txt"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/clock_app/resources/swd_scripts/100us.swd"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/clock_app/resources/swd_scripts/call_test_1.swd"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/clock_app/resources/swd_scripts/call_test_2.swd"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/clock_app/resources/swd_scripts/dump_0x00000000_1k.swd"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/clock_app/resources/swd_scripts/dump_0x00000000_4b.swd"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/clock_app/resources/swd_scripts/dump_STM32.swd"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/clock_app/resources/swd_scripts/goto_test.swd"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/clock_app/resources/swd_scripts/halt.swd"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/clock_app/resources/swd_scripts/reset.swd"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/main/clock_app/resources/swd_scripts/test_write.swd"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/examples/apps/Scripts/js_examples/array_buf_test.js"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/examples/apps/Scripts/js_examples/bad_uart.js"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/examples/apps/Scripts/js_examples/badusb_demo.js"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/examples/apps/Scripts/js_examples/blebeacon.js"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/examples/apps/Scripts/js_examples/console.js"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/examples/apps/Scripts/js_examples/delay.js"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/examples/apps/Scripts/js_examples/event_loop.js"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/examples/apps/Scripts/js_examples/gpio.js"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/examples/apps/Scripts/js_examples/gui.js"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/examples/apps/Scripts/js_examples/i2c.js"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/examples/apps/Scripts/js_examples/infrared-send.js"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/examples/apps/Scripts/js_examples/interactive.js"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/examples/apps/Scripts/js_examples/load.js"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/examples/apps/Scripts/js_examples/load_api.js"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/examples/apps/Scripts/js_examples/math.js"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/examples/apps/Scripts/js_examples/notify.js"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/examples/apps/Scripts/js_examples/path.js"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/examples/apps/Scripts/js_examples/spi.js"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/examples/apps/Scripts/js_examples/storage.js"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/examples/apps/Scripts/js_examples/stringutils.js"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/examples/apps/Scripts/js_examples/subghz.js"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/examples/apps/Scripts/js_examples/uart_echo.js"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/examples/apps/Scripts/js_examples/uart_echo_8e1.js"
        "/Users/marlin/Flipper-Zero-ESP32-Port/applications/system/js_app/examples/apps/Scripts/js_examples/usbdisk.js"
    VERBATIM
)
add_custom_target(esp32_fam_stage_assets DEPENDS "${ESP32_FAM_STAGE_ASSETS_STAMP}")
