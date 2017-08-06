cmake_minimum_required(VERSION 2.8.8)

LIST(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
include(LinuxCrossCompile)

project(mtk-wifi-userspace C)

include_directories(include/)

add_executable(6620_launcher combo_tool/src/stp_uart_launcher.c)
target_link_libraries(6620_launcher pthread)

add_executable(wifi_loader combo_tool/combo_loader/loader.c)


install(TARGETS wifi_loader 6620_launcher DESTINATION sbin)

file(GLOB_RECURSE WLAN_FW ./wlan/firmware/* )
file(GLOB_RECURSE PATCH_FL ./combo_tool/patch_folder/*)
file(GLOB_RECURSE UNITS ./scripts/*.service)


install(FILES ${WLAN_FW} ${PATCH_FL} DESTINATION /lib/firmware)
install(FILES scripts/mt6620_start_wireless.sh DESTINATION sbin)
install(FILES ${UNITS} DESTINATION /etc/systemd/system)
