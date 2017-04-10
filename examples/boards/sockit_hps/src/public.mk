
DEFAULT_CROSS_COMPILE := arm-altera-eabi-

ALT_INCLUDE_DIRS += $(dir $(lastword $(MAKEFILE_LIST)))
#THESE SHOULD BE PREDEFINED IN TOPLEVEL MAKEFILE
ALT_INCLUDE_DIRS += $(VBXAPI_DIR)
ALT_INCLUDE_DIRS += $(VBXWARE_DIR)

ALT_INCLUDE_DIRS += $(QUARTUS_ROOTDIR)/../embedded/ip/altera/hps/altera_hps/hwlib/include/
ALT_INCLUDE_DIRS += $(QUARTUS_ROOTDIR)/../embedded/ip/altera/hps/altera_hps/hwlib/include/soc_cv_av
ALT_CFLAGS += -mcpu=cortex-a9 -mfloat-abi=softfp -mfpu=neon -DARM_ALT_STANDALONE -std=gnu99
ALT_CXXFLAGS += -std=gnu++11
AVOID_NIOS2_GCC3_OPTIONS := true

BSP_LINKER_SCRIPT := $(dir $(lastword $(MAKEFILE_LIST)))/link.ld

INCLUDE_VBXAPI := true

HWLIB_PATH = $(QUARTUS_ROOTDIR)/../embedded/ip/altera/hps/altera_hps/hwlib/src/hwmgr/
HWLIB_FILES = alt_timers.c alt_globaltmr.c alt_cache.c alt_mmu.c alt_clock_manager.c alt_watchdog.c

HWLIB_SRCS += $(realpath $(dir $(lastword $(MAKEFILE_LIST)))/io.c)
#these could be in different subdirectories depending on quartus version
HWLIB_SRCS += $(shell find $(HWLIB_PATH) -name alt_timers.c)
HWLIB_SRCS += $(shell find $(HWLIB_PATH) -name alt_globaltmr.c)
HWLIB_SRCS += $(shell find $(HWLIB_PATH) -name alt_cache.c)
HWLIB_SRCS += $(shell find $(HWLIB_PATH) -name alt_mmu.c)
HWLIB_SRCS += $(shell find $(HWLIB_PATH) -name alt_clock_manager.c)
HWLIB_SRCS += $(shell find $(HWLIB_PATH) -name alt_watchdog.c)

HPS=true
