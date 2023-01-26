/*
   Copyright (c) 2023, The LineageOS Project
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.
   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>

#include <android-base/file.h>
#include <android-base/logging.h>
#include <android-base/properties.h>
#include <android-base/strings.h>

#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

#include "vendor_init.h"
#include "property_service.h"

using android::base::ReadFileToString;
using android::base::Trim;
using std::string;

std::vector<std::string> ro_props_default_source_order = {
    "",
    "odm.",
    "product.",
    "system.",
    "system_ext.",
    "vendor.",
};

void property_override(char const prop[], char const value[], bool add = true) {
    prop_info *pi;

    pi = (prop_info*) __system_property_find(prop);
    if (pi)
        __system_property_update(pi, value, strlen(value));
    else if (add)
        __system_property_add(prop, strlen(prop), value, strlen(value));
}

void set_ro_build_prop(const std::string &prop, const std::string &value, bool product = true) {
    string prop_name;

    for (const auto &source : ro_props_default_source_order) {
        if (product)
            prop_name = "ro.product." + source + prop;
        else
            prop_name = "ro." + source + "build." + prop;

        property_override(prop_name.c_str(), value.c_str());
    }
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

void vendor_load_properties() {
    char const *operator_file = "/proc/oppoVersion/operatorName";
    string operator_name;
    string device;
    string model;
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
    if (ReadFileToString(operator_file, &operator_name)) {
        // Realme 3
        if (Trim(operator_name) == "133") {
            device = "RMX1825";
            model = "RMX1825";
        }
        // Realme 3i
        else if (Trim(operator_name) == "137") {
            device = "RMX1827";
            model = "RMX1827";
        }
    }
    else {
        LOG(ERROR) << "Unable to read operator from " << operator_file;
    }
    set_ro_build_prop("device", device);
    set_ro_build_prop("model", model);
    set_ro_build_prop("name", model);
    set_ro_build_prop("product", model, false);

    // Fingerprint 
    init_fp_properties();
}
