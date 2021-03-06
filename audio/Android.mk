# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := audio.primary.tuna
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_SRC_FILES := audio_hw.c ril_interface.c
LOCAL_C_INCLUDES += \
	external/tinyalsa/include \
	$(call include-path-for, audio-utils) \
	$(call include-path-for, audio-effects)
LOCAL_SHARED_LIBRARIES := liblog libcutils libtinyalsa libaudioutils libdl

# Open-source secril-client allows us to directly hook into the RIL audio stuff
# rather than using hackish symbol lookups like the prebuilt one required.
LOCAL_SHARED_LIBRARIES += libsecril-client
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../ril/

LOCAL_MODULE_TAGS := optional

# A lot of audio-related things use ARM over Thumb, let's do the same here.
LOCAL_ARM_MODE := arm

ifeq ($(TARGET_TUNA_AUDIO_FORCE_SAMPLE_RATE),)
LOCAL_CFLAGS += -DUSE_VARIABLE_SAMPLING_RATE
else
LOCAL_CFLAGS += -DFORCE_OUT_SAMPLING_RATE=$(TARGET_TUNA_AUDIO_FORCE_SAMPLE_RATE)
endif

ifeq ($(TARGET_TUNA_AUDIO_HDMI),true)
LOCAL_CFLAGS += -DUSE_HDMI_AUDIO
endif

include $(BUILD_SHARED_LIBRARY)
