# Binary file name 
TARGET = avrdreamstalkerpro

# Path to the GCC directory
AVRDIR = /opt/avr-gcc/avr-gcc-11.1.0-x64-linux/
AVRBINDIR = $(AVRDIR)bin/

# Compiler name, in case it changes one day
CC = avr-gcc
OBJCOPY = avr-objcopy
SIZE = avr-size

AVRCC = $(AVRBINDIR)$(CC)
AVRSIZE = $(AVRBINDIR)$(SIZE)
AVROBJCOPY = $(AVRBINDIR)$(OBJCOPY)
AVRDUDE = avrdude

# MCU name for the compiler
MCU ?= atmega1281

# Check if MCU is supported
SUPPORTED_MCU = atmega128 atmega1281
ifneq ($(filter-out $(SUPPORTED_MCU),$(MCU)),)
$(error Not recognized MCU. Supported options: $(SUPPORTED_MCU))
endif

# Output build directory
BUILD_DIR = build/$(MCU)

TARGET_ARCH = -mmcu=$(MCU)

# The compiler flags
C_OPTS = -Os
C_FLAGS = -Wall -g2 -gstabs $(C_OPTS) -std=c11 -funsigned-char -funsigned-bitfields -v

# FIXME: bootloader section according to fuse values (atmega128 datasheet, page 284)
BOOTLOAD_START=0xFE00

# linker flags
LDFLAGS = -Wl,-u,vfprintf -Wl,--section-start=.bootloader=$(BOOTLOAD_START)

# Options for AVRDUDE
ifeq ($(MCU), atmega128)
DUDE_MCU = m128
DUDE_LFUSE = 0xE4
DUDE_HFUSE = 0x1F
DUDE_EFUSE = 0xFF
else ifeq ($(MCU), atmega1281)
DUDE_MCU = m1281
DUDE_LFUSE = 0xC2
DUDE_HFUSE = 0x1F
DUDE_EFUSE = 0xFF
endif
DUDE_PROG = jtag2
#jtag2isp
DUDE_SPEED = 125000

# Common defines
C_DEFINES = -DF_CPU=8000000UL -DDRV_MMC=0 -D_USE_WRITE=1 -DDEBUG_LEVEL=0 -DDS_CONFIG_STORAGE=2
# Target arch define
ifeq ($(MCU), atmega128)
C_DEFINES += -D__AVR_ATmega128__
else ifeq ($(MCU), atmega1281)
C_DEFINES += -D__AVR_ATmega1281__
endif
# UART defines
C_DEFINES += -DUART_RX0_BUFFER_SIZE=8 -DUART_TX0_BUFFER_SIZE=8
C_DEFINES += -DVS_XTAL_FREQ=12288000

# Paths to header files
C_INCLUDES =  \
-I$(AVRDIR)avr/include \
-Iinc \
-Iinc/core \
-Iinc/display \
-Iinc/fatfs \
-Iinc/input \
-Iinc/sound

# Program files
C_SOURCES = \
src/ds_util.c \
src/ds_batmon.c \
src/ds_config.c \
src/ds_leds.c \
src/ds_menu.c \
src/ds_rtclk.c \
src/ds_deferred.c \
src/ds_strobe.c \
src/main.c \
src/ds_remd.c \
src/ds_sdcard.c \
src/shared_file.c \
src/ds_vibro.c \
src/core/adc_avr.c \
src/core/spi_avr.c \
src/core/uart_avr.c \
src/core/dbg_avr.c \
src/display/ds_display.c \
src/fatfs/diskio.c \
src/fatfs/ff.c \
src/fatfs/ffunicode_avr.c \
src/fatfs/mmc_avr_spi.c \
src/input/inputevent.c \
src/input/ds_keybrd.c \
src/sound/ds_codec.c \
src/sound/ds_sound.c \
src/sound/ds_tonegen.c \
src/sound/vs10xx.c \
src/sound/vs1002.c \
src/sound/vs1003.c \
src/sound/vs1053.c

# Service variables
OBJ_FILES = $(C_SOURCES:.c=.o)
ASM_FILES = $(C_SOURCES:.c=.s)
OUT_OBJ = $(addprefix $(BUILD_DIR)/, $(notdir $(OBJ_FILES)))

#
# Build rules
#
.PHONY: all
all: $(TARGET).hex

$(TARGET).hex: $(TARGET).elf
	$(AVROBJCOPY) -j .text -j .data -O ihex $(BUILD_DIR)/$< $(BUILD_DIR)/$@

$(TARGET).elf: make_dir $(OBJ_FILES) $(ASM_FILES)
	$(AVRCC) $(TARGET_ARCH) $(LDFLAGS) $(OUT_OBJ) -o $(BUILD_DIR)/$@
	$(AVRSIZE) -A $(BUILD_DIR)/$@

%.o: %.c
	echo $^
	$(AVRCC) -c $(TARGET_ARCH) $(C_FLAGS) $(C_DEFINES) $(C_INCLUDES) $< -o $(BUILD_DIR)/$(@F)

%.s: %.c
	echo $^
	$(AVRCC) -S -g3 $(TARGET_ARCH) $(C_FLAGS) $(C_DEFINES) $(C_INCLUDES) $< -o $(BUILD_DIR)/$(@F)

.PHONY: clean
clean:
	rm -rfv $(BUILD_DIR)/*

make_dir:
	mkdir -p $(BUILD_DIR)

prog: $(TARGET).hex
	$(AVRDUDE) -v -p$(DUDE_MCU) -c$(DUDE_PROG) -b$(DUDE_SPEED) -u -Uflash:w:$(BUILD_DIR)/$(TARGET).hex:a -Ulfuse:w:$(DUDE_LFUSE):m -Uhfuse:w:$(DUDE_HFUSE):m -Uefuse:w:$(DUDE_EFUSE):m

read_eeprom:
	$(AVRDUDE) -v -p$(DUDE_MCU) -c$(DUDE_PROG) -b$(DUDE_SPEED) -Ueeprom:r:$(BUILD_DIR)/eeprom.hex:i

write_eeprom: eeprom.hex
	$(AVRDUDE) -v -p$(DUDE_MCU) -c$(DUDE_PROG) -b$(DUDE_SPEED) -Ueeprom:w:$(BUILD_DIR)/eeprom.hex

chip_erase:
	$(AVRDUDE) -v -p$(DUDE_MCU) -c$(DUDE_PROG) -b$(DUDE_SPEED) -e
