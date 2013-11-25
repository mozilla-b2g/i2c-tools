LOCAL_PATH:= $(call my-dir)

local_c_includes := \
	external/i2c-tools/include

libi2c_src_files := \
	smbus.c

local_cflags := \
	-Wstrict-prototypes -Wshadow -Wpointer-arith -Wcast-qual \
	-Wcast-align -Wwrite-strings -Wnested-externs -Winline \
	-W -Wundef -Wmissing-prototypes

#######################################
# build libi2c.a
include $(CLEAR_VARS)

ifneq ($(TARGET_ARCH),x86)
LOCAL_NDK_VERSION := 5
LOCAL_SDK_VERSION := 9
endif
LOCAL_SRC_FILES += $(libi2c_src_files)
LOCAL_C_INCLUDES += $(local_c_includes)
LOCAL_CFLAGS += $(local_cflags)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE:= libi2c
include $(BUILD_STATIC_LIBRARY)

