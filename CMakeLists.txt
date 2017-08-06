cmake_minimum_required(VERSION 2.8.8)

LIST(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
include(LinuxCrossCompile)

project(mtk-wifi-userspace C)

include_directories(include/)

add_executable(6620_launcher combo_tool/src/stp_uart_launcher.c)
target_link_libraries(6620_launcher pthread)

add_executable(wifi_loader combo_tool/combo_loader/loader.c)


install(TARGETS wifi_loader 6620_launcher DESTINATION sbin)

# These cause UMI-X2 to reboot
#file(GLOB_RECURSE WLAN_FW ./wlan/firmware/* )
#file(GLOB_RECURSE PATCH_FL ./combo_tool/patch_folder/*)

file(GLOB_RECURSE FW_FILES ./firmware-umi-x8/* )
file(GLOB_RECURSE UNITS ./scripts/*.service)
file(GLOB_RECURSE SCRIPTS ./scripts/*.sh)

install(FILES ${FW_FILES} DESTINATION /lib/firmware)
install(FILES ${SCRIPTS} DESTINATION sbin)
install(FILES ${UNITS} DESTINATION /etc/systemd/system)
