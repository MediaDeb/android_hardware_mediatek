cmake_minimum_required(VERSION 2.8.8)

LIST(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
include(LinuxCrossCompile)

project(mtk-wifi-userspace C)

include_directories(include/)

add_executable(6620_launcher combo_tool/src/stp_uart_launcher.c)
target_link_libraries(6620_launcher pthread)

add_executable(wifi_loader combo_tool/combo_loader/loader.c)


install(TARGETS wifi_loader 6620_launcher DESTINATION sbin)

#Scripts'n'units
file(GLOB_RECURSE UNITS ./scripts/*.service)
file(GLOB_RECURSE SCRIPTS ./scripts/*.sh)

install(FILES ${SCRIPTS} DESTINATION sbin)
install(FILES ${UNITS} DESTINATION /etc/systemd/system)

#Install UMI-X2 firmware and nvram
install(DIRECTORY nvram-umi-x2/ DESTINATION /data/nvram)
install(DIRECTORY firmware-umi-x8/ DESTINATION /lib/firmware)
