set(CMAKE_SYSTEM_NAME "Linux")

if("${CROSS}" STREQUAL "")
  set(CROSS /srv/projects/orpaltech/armlinux/toolchains/linaro/13/aarch64-linux-gnu/bin/aarch64-linux-gnu-)
endif()

set(CMAKE_C_COMPILER ${CROSS}gcc)
set(CMAKE_CXX_COMPILER ${CROSS}g++)
set(CMAKE_CXX_FLAGS_INIT "-march=armv8-a")
set(CMAKE_SYSTEM_PROCESSOR "aarch64")

# where is the target environment located
set(CMAKE_FIND_ROOT_PATH /srv/projects/orpaltech/boards/nanopi-a64/sysroot)

# search programs in the host environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# search headers and libraries in the target environment
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
