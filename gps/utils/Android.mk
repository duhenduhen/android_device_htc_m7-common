ifneq ($(BUILD_TINY_ANDROID),true)
#Compile this library only for builds with the latest modem image

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

## Libs
LOCAL_SHARED_LIBRARIES := \
    libutils \
    libcutils \
    liblog \
    libprocessgroup

LOCAL_SRC_FILES += \
    loc_log.cpp \
    loc_cfg.cpp \
    msg_q.c \
    linked_list.c

LOCAL_CFLAGS += \
     -fno-short-enums \
     -D_ANDROID_

LOCAL_LDFLAGS += -Wl,--export-dynamic


LOCAL_HEADER_LIBRARIES := \
    libgps.utils_headers

LOCAL_MODULE := libgps.utils

LOCAL_MODULE_TAGS := optional

LOCAL_PRELINK_MODULE := false

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libgps.utils_headers
LOCAL_EXPORT_C_INCLUDE_DIRS := \
    $(LOCAL_PATH)
include $(BUILD_HEADER_LIBRARY)
endif # not BUILD_TINY_ANDROID

