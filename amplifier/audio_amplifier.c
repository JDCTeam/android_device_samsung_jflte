/*
 * Copyright (C) 2015-2016 The CyanogenMod Open Source Project
 *               2017-2018 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "audio_amplifier"
//#define LOG_NDEBUG 0

#include <fcntl.h>
#include <stdlib.h>

#include <log/log.h>

#include <hardware/audio_amplifier.h>
#include <msm8960/platform.h>
#include <sound/a2220.h>

int mA2220Fd;
int mA2220Mode;
pthread_mutex_t mA2220Lock;

int setA2220Mode(int mode) {
    int rc = -1;
    if (mA2220Mode != mode) {
        pthread_mutex_lock(&mA2220Lock);
        if (mA2220Fd < 0) {
            mA2220Fd = open("/dev/audience_a2220", O_RDWR);
            if (!mA2220Fd) {
                ALOGE("%s: unable to open a2220 device!", __func__);
                return rc;
            } else {
                ALOGI("%s: device opened, fd=%d", __func__, mA2220Fd);
            }
        }
        rc = ioctl(mA2220Fd, A2220_SET_CONFIG, mode);
        if (rc < 0) {
            ALOGE("%s: ioctl failed, errno=%d", __func__, errno);
        } else {
            mA2220Mode = mode;
            ALOGD("%s: Audience A2220 mode is set to %d.", __func__, mode);
        }
        pthread_mutex_unlock(&mA2220Lock);
    }
    return rc;
}

static int amp_set_input_devices(amplifier_device_t* device, uint32_t devices) {
    return 0;
}

static int amp_set_output_devices(amplifier_device_t* device, uint32_t devices) {
    return 0;
}

static int amp_enable_output_devices(amplifier_device_t* device, uint32_t devices, bool enable) {
    ALOGD("%s: %u %d\n", __func__, devices, enable);
    if (devices && devices == SND_DEVICE_OUT_VOICE_HANDSET) {
        if (enable) {
            setA2220Mode(A2220_PATH_INCALL_RECEIVER_NSON);
        } else {
            setA2220Mode(A2220_PATH_INCALL_RECEIVER_NSOFF);
        }
    }
    return 0;
}

static int amp_enable_input_devices(amplifier_device_t* device, uint32_t devices, bool enable) {
    return 0;
}

static int amp_set_mode(amplifier_device_t* device, audio_mode_t mode) {
    ALOGD("%s: %u\n", __func__, mode);
    if (mode && mode == AUDIO_MODE_IN_CALL) {
        ALOGI("%s: Audio mode is IN CALL", __func__);
    }
    return 0;
}

static int amp_output_stream_start(amplifier_device_t* device, struct audio_stream_out* stream,
                                   bool offload) {
    return 0;
}

static int amp_input_stream_start(amplifier_device_t* device, struct audio_stream_in* stream) {
    return 0;
}

static int amp_output_stream_standby(amplifier_device_t* device, struct audio_stream_out* stream) {
    return 0;
}

static int amp_input_stream_standby(amplifier_device_t* device, struct audio_stream_in* stream) {
    return 0;
}

static int amp_set_parameters(struct amplifier_device* device, struct str_parms* parms) {
    return 0;
}

static int amp_dev_close(hw_device_t* device) {
    if (device) free(device);

    return 0;
}

static int amp_module_open(const hw_module_t* module, const char* name, hw_device_t** device) {
    if (strcmp(name, AMPLIFIER_HARDWARE_INTERFACE)) {
        ALOGE("%s:%d: %s does not match amplifier hardware interface name\n", __func__, __LINE__,
              name);
        return -ENODEV;
    }

    amplifier_device_t* amp_dev = calloc(1, sizeof(amplifier_device_t));
    if (!amp_dev) {
        ALOGE("%s:%d: Unable to allocate memory for amplifier device\n", __func__, __LINE__);
        return -ENOMEM;
    }

    amp_dev->common.tag = HARDWARE_DEVICE_TAG;
    amp_dev->common.module = (hw_module_t*)module;
    amp_dev->common.version = HARDWARE_DEVICE_API_VERSION(1, 0);
    amp_dev->common.close = amp_dev_close;

    amp_dev->set_input_devices = amp_set_input_devices;
    amp_dev->set_output_devices = amp_set_output_devices;
    amp_dev->enable_output_devices = amp_enable_output_devices;
    amp_dev->enable_input_devices = amp_enable_input_devices;
    amp_dev->set_mode = amp_set_mode;
    amp_dev->output_stream_start = amp_output_stream_start;
    amp_dev->input_stream_start = amp_input_stream_start;
    amp_dev->output_stream_standby = amp_output_stream_standby;
    amp_dev->input_stream_standby = amp_input_stream_standby;
    amp_dev->set_parameters = amp_set_parameters;

    *device = (hw_device_t*)amp_dev;

    ALOGI("%s: Initialize Audience A2220 globals, assuming it is off", __func__);
    mA2220Fd = -1;
    mA2220Mode = A2220_PATH_INCALL_RECEIVER_NSOFF;

    return 0;
}

static struct hw_module_methods_t hal_module_methods = {
    .open = amp_module_open,
};

amplifier_module_t HAL_MODULE_INFO_SYM = {
    .common =
        {
            .tag = HARDWARE_MODULE_TAG,
            .module_api_version = AMPLIFIER_MODULE_API_VERSION_0_1,
            .hal_api_version = HARDWARE_HAL_API_VERSION,
            .id = AMPLIFIER_HARDWARE_MODULE_ID,
            .name = "Audience A2220 audio amplifier HAL",
            .author = "The LineageOS Open Source Project",
            .methods = &hal_module_methods,
        },
};
