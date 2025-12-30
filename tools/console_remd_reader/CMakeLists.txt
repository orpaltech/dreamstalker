cmake_minimum_required(VERSION 3.12)
project(console_remd_reader VERSION 0.1.0 LANGUAGES C)

add_executable(console_remd_reader main.c uart.c)

set(VERSION_MAJOR 1)
set(VERSION_MINOR 0)
set(VERSION_PATCH 0)
