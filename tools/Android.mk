LOCAL_PATH:= $(call my-dir)

local_c_includes := \
	external/i2c-tools/include \
	external/i2c-tools/lib

i2cdetect_src_files := \
	i2cdetect.c \
	i2cbusses.c

i2cdump_src_files := \
	i2cdump.c \
	i2cbusses.c \
	util.c

i2cset_src_files := \
	i2cset.c \
	i2cbusses.c \
	util.c

i2cget_src_files := \
	i2cget.c \
	i2cbusses.c \
	util.c

local_cflags := \
	-Wstrict-prototypes -Wshadow -Wpointer-arith -Wcast-qual \
	-Wcast-align -Wwrite-strings -Wnested-externs -Winline \
	-W -Wundef -Wmissing-prototypes

local_static_libraries := \
	libi2c

#######################################
# build i2cdetect
include $(CLEAR_VARS)
LOCAL_MODULE:= i2cdetect
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(i2cdetect_src_files)
LOCAL_STATIC_LIBRARIES := $(local_static_libraries)
LOCAL_C_INCLUDES := $(local_c_includes)
LOCAL_CFLAGS := $(local_cflags)
include $(BUILD_EXECUTABLE)

#######################################
# build i2cdump
include $(CLEAR_VARS)
LOCAL_MODULE:= i2cdump
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(i2cdump_src_files)
LOCAL_STATIC_LIBRARIES := $(local_static_libraries)
LOCAL_C_INCLUDES := $(local_c_includes)
LOCAL_CFLAGS := $(local_cflags)
include $(BUILD_EXECUTABLE)

#######################################
# build i2cset
include $(CLEAR_VARS)
LOCAL_MODULE:= i2cset
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(i2cset_src_files)
LOCAL_STATIC_LIBRARIES := $(local_static_libraries)
LOCAL_C_INCLUDES := $(local_c_includes)
LOCAL_CFLAGS := $(local_cflags)
include $(BUILD_EXECUTABLE)

#######################################
# build i2cget
include $(CLEAR_VARS)
LOCAL_MODULE:= i2cget
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(i2cget_src_files)
LOCAL_STATIC_LIBRARIES := $(local_static_libraries)
LOCAL_C_INCLUDES := $(local_c_includes)
LOCAL_CFLAGS := $(local_cflags)
include $(BUILD_EXECUTABLE)


