//
// Copyright (C) 2023 The LineageOS Project
//
// SPDX-License-Identifier: Apache-2.0
//

#include <fstream>
#include <tuple>
#include <android-base/logging.h>

#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

#include "vendor_init.h"

#define PROC_OPERATOR "/proc/oppoVersion/operatorName"

#include <sys/sysinfo.h>

#include <android-base/file.h>
#include <android-base/properties.h>
#include <android-base/strings.h>
#include "property_service.h"
using android::base::ReadFileToString;
using std::string;

void property_override(std::string prop, std::string value, bool add = true) {
    auto pi = (prop_info *)__system_property_find(prop.c_str());

    if (pi != nullptr) {
        __system_property_update(pi, value.c_str(), value.size());
    } else if (add) {
        __system_property_add(prop.c_str(), prop.size(), value.c_str(),
                              value.size());
    }
}

void set_ro_build_prop(const std::string &prop, const std::string &value,
                       bool product = true) {
    std::string prop_name;
    std::string prop_types[] = {
        "",
        "bootimage.",
        "odm.",
        "odm_dlkm.",
        "product.",
        "system.",
        "system_ext.",
        "vendor.",
        "vendor_dlkm.",
    };

    for (const std::string &source : prop_types) {
        if (product) {
            prop_name = "ro.product." + source + prop;
        } else {
            prop_name = "ro." + source + "build." + prop;
        }

        property_override(prop_name, value, false);
    }
}

std::tuple<std::string, std::string> get_device() {
    std::string device, model, line;
    std::ifstream operator_file(PROC_OPERATOR);
    operator_file.good();
    getline(operator_file, line);

    int operatorName = stoi(line);

    switch (operatorName) {
    /*
     * Variants of Realme 3 and Realme 3i can be distinguished
     * by the value of /proc/oppoVersion/operatorName
     *
     * 131 -> Realme 3  RMX1821
     * 133 -> Realme 3  RMX1825
     * 137 -> Realme 3i RMX1827
     * ?   -> Realme 3  RMX1822
     * ?   -> Realme 3i RMX1823
     * TODO: Find the values for RMX1822 and RMX1823
     */
        // realme 3
        case 130:
        case 131:
            device = "RMX1821";
            model = "RMX1821";
            break;
        case 133:
            device = "RMX1825";
            model = "RMX1825";
            break;
        // realme 3i
        case 137:
            device = "RMX1827";
            model = "RMX1827";
            break;
        default:
            LOG(ERROR) << "Unable to read operator from " << PROC_OPERATOR;
    }
    return {device, model};
}

void init_fp_properties()
{
    char const *fp_name_file = "/proc/fp_id";
    std::string fp_name;

    if (ReadFileToString(fp_name_file, &fp_name)) {
        if (fp_name == "E_520") {
            property_override("persist.vendor.fingerprint.fp_id", "E_520");
        }
    }
}

void set_avoid_gfxaccel_config() {
    struct sysinfo sys;
    sysinfo(&sys);

    if (sys.totalram <= 3072ull * 1024 * 1024) {
        // Reduce memory footprint
        property_override("ro.config.avoid_gfx_accel", "true");
    }
}

void vendor_load_properties() {
#ifndef __ANDROID_RECOVERY__
    auto [device, model] = get_device();

    set_ro_build_prop("device", device);
    set_ro_build_prop("model", model);
    set_ro_build_prop("name", model);
    set_ro_build_prop("product", model, false);

    // Fingerprint
    init_fp_properties();

    // config_avoidGfxAccel
    set_avoid_gfxaccel_config();
#endif
}
