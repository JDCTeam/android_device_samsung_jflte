/*
   Copyright (C) 2015-2016 The JDCTeam

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

#include <stdlib.h>
#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>
#include <android-base/properties.h>
#include <android-base/strings.h>	
#include <android-base/file.h>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
//#include "util.h"
#include <string>

#define SERIAL_NUMBER_FILE "/efs/FactoryApp/serial_no"

void gsm_properties();
void cdma_properties(int sub);
void r970_properties();

using android::base::GetProperty;
using android::base::ReadFileToString;
using android::base::Trim;

void property_override(char const prop[], char const value[])
{
    prop_info *pi;

    pi = (prop_info*) __system_property_find(prop);
    if (pi)
        __system_property_update(pi, value, strlen(value));
    else
        __system_property_add(prop, strlen(prop), value, strlen(value));
}

void property_override_dual(char const system_prop[], char const vendor_prop[], char const value[])
{
    property_override(system_prop, value);
    property_override(vendor_prop, value);
}

void vendor_load_properties()
{
    std::string platform;
    std::string bootloader;

    platform = GetProperty("ro.board.platform", "");

    if (platform == "")
        return;

    bootloader = GetProperty("ro.bootloader", "");

    if (bootloader.find("I337M") != std::string::npos) {
        /* jfltecan */
        gsm_properties();
        property_override_dual("ro.product.model","ro.product.vendor.model","SGH-I337M");
        property_override_dual("ro.product.device","ro.product.vendor.device", "jfltecan");
        property_override_dual("ro.build.product","ro.lineage.device","jfltecan");
    } else if (bootloader.find("I337") != std::string::npos)  {
        /* jflteatt */
        gsm_properties();
        property_override_dual("ro.product.model","ro.product.vendor.model", "SGH-I337");
        property_override_dual("ro.product.device","ro.product.vendor.device",  "jflteatt");
        property_override_dual("ro.build.product","ro.lineage.device","jflteatt");
    } else if (bootloader.find("R970C") != std::string::npos)  {
        /* jfltecri */
        cdma_properties(0);
        r970_properties();
        property_override_dual("ro.product.model","ro.product.vendor.model", "SCH-R970C");
        property_override_dual("ro.product.device","ro.product.vendor.device",  "jfltecri");
        android::init::property_set("ro.cdma.home.operator.alpha", "Cricket");
        android::init::property_set("ro.cdma.home.operator.numeric", "310090");
        property_override_dual("ro.build.product","ro.lineage.device","jfltecri");
    } else if (bootloader.find("R970X") != std::string::npos) {
        /* jfltecsp */
        cdma_properties(0);
        r970_properties();
        property_override_dual("ro.product.model","ro.product.vendor.model", "SCH-R970X");
        property_override_dual("ro.product.device","ro.product.vendor.device",  "jfltecsp");
        property_override_dual("ro.build.product","ro.lineage.device","jfltecsp");
        android::init::property_set("telephony.sms.pseudo_multipart", "1");
    } else if (bootloader.find("L720") != std::string::npos) {
        /* jfltespr */
        cdma_properties(1);
        property_override_dual("ro.product.model","ro.product.vendor.model", "SPH-L720");
        property_override_dual("ro.product.device","ro.product.vendor.device",  "jfltespr");
        property_override_dual("ro.build.product","ro.lineage.device","jfltespr");
        android::init::property_set("ro.cdma.home.operator.numeric", "310120");
        android::init::property_set("ro.cdma.home.operator.alpha", "Sprint");
        android::init::property_set("ro.telephony.default_network", "8");
        android::init::property_set("ro.telephony.get_imsi_from_sim", "true");
        android::init::property_set("telephony.sms.pseudo_multipart", "1");
    } else if (bootloader.find("M919") != std::string::npos) {
        /* jfltetmo */
        gsm_properties();
        property_override_dual("ro.product.model","ro.product.vendor.model", "SGH-M919");
        property_override_dual("ro.product.device","ro.product.vendor.device",  "jfltetmo");
        property_override_dual("ro.build.product","ro.lineage.device","jfltetmo");
    } else if (bootloader.find("S970") != std::string::npos)  {
		/* jfltetfntmo */
		gsm_properties();
        property_override_dual("ro.product.model","ro.product.vendor.model", "SGH-S970G");
        property_override_dual("ro.product.device","ro.product.vendor.device",  "jfltetfntmo");
        property_override_dual("ro.build.product","ro.lineage.device","jfltetfntmo");
        android::init::property_set("ril.subscription.types", "NV,RUIM");
        android::init::property_set("DEVICE_PROVISIONED", "1");
    } else if (bootloader.find("S975") != std::string::npos) {
		/* jfltetfnatt */
		gsm_properties();
        property_override_dual("ro.product.model","ro.product.vendor.model", "SM-S975L");
        property_override_dual("ro.product.device","ro.product.vendor.device", "jfltetfnatt");
        property_override_dual("ro.build.product","ro.lineage.device","jfltetfnatt");
        android::init::property_set("ril.subscription.types", "NV,RUIM");
        android::init::property_set("DEVICE_PROVISIONED", "1");
    } else if (bootloader.find("R970") != std::string::npos) {
        /* jflteusc */
        cdma_properties(0);
        r970_properties();
        property_override_dual("ro.product.model","ro.product.vendor.model", "SCH-R970");
        property_override_dual("ro.product.device","ro.product.vendor.device",  "jflteusc");
        property_override_dual("ro.build.product","ro.lineage.device","jflteusc");
        android::init::property_set("ro.cdma.home.operator.alpha", "U.S.Cellular");
        android::init::property_set("ro.cdma.home.operator.numeric", "311580");
    } else if (bootloader.find("I545") != std::string::npos) {
        /* jfltevzw */
        cdma_properties(0);
        property_override_dual("ro.product.model","ro.product.vendor.model", "SCH-I545");
        property_override_dual("ro.product.device","ro.product.vendor.device", "jfltevzw");
        property_override_dual("ro.build.product","ro.lineage.device","jfltevzw");
        android::init::property_set("ro.cdma.home.operator.alpha", "Verizon");
        android::init::property_set("ro.cdma.home.operator.numeric", "311480");
        android::init::property_set("ro.telephony.default_network", "10");
        android::init::property_set("ro.telephony.get_imsi_from_sim", "true");
        android::init::property_set("ro.config.multimode_cdma", "1");
        android::init::property_set("ro.config.combined_signal", "true");
        android::init::property_set("ro.gsm.data_retry_config", "max_retries=infinite,5000,5000,60000,120000,480000,900000");
        android::init::property_set("DEVICE_PROVISIONED", "1");
        android::init::property_set("ro.com.google.clientidbase", "android-verizon");
    } else if (bootloader.find("I9505G") != std::string::npos) {
        /* jgedlte */
        gsm_properties();
        property_override_dual("ro.product.model","ro.product.vendor.model", "GT-I9505G");
        property_override_dual("ro.product.device","ro.product.vendor.device", "jgedlte");
        property_override_dual("ro.build.product","ro.lineage.device","jgedlte");
        android::init::property_set("ril.subscription.types", "NV,RUIM");
        android::init::property_set("DEVICE_PROVISIONED", "1");
    } else if (bootloader.find("I9505") != std::string::npos) {
        /* jfltexx */
        gsm_properties();
        property_override_dual("ro.product.model","ro.product.vendor.model", "GT-I9505");
        property_override_dual("ro.product.device","ro.product.vendor.device", "jfltexx");
        property_override_dual("ro.build.product","ro.lineage.device","jfltexx");
    } else if (bootloader.find("I9507") != std::string::npos) {
        /* jftddxx */
        gsm_properties();
        property_override_dual("ro.product.model","ro.product.vendor.model", "GT-I9507");
        property_override_dual("ro.product.device","ro.product.vendor.device", "jftddxx");
        property_override_dual("ro.build.product","ro.lineage.device","jftddxx");
    } else if (bootloader.find("I9508") != std::string::npos)  {
        /* jfltezm */
        gsm_properties();
        property_override_dual("ro.product.model","ro.product.vendor.model", "GT-I9508");
        property_override_dual("ro.product.device","ro.product.vendor.device", "jfltezm");
        property_override_dual("ro.build.product","ro.lineage.device","jfltezm");
    } else if (bootloader.find("I9295") != std::string::npos) {
        /* jactivelte */
        gsm_properties();
        property_override_dual("ro.product.model","ro.product.vendor.model", "GT-I9295");
        property_override_dual("ro.product.device","ro.product.vendor.device", "jactivelte");
        property_override_dual("ro.build.product","ro.lineage.device","jactivelte");
    } else {
        property_override("ro.build.fingerprint","ERROR.INIT FAILED");
        return;
    }
    property_override_dual("ro.build.fingerprint","ro.vendor.build.fingerprint", "google/blueline/blueline:9/PQ2A.190405.003/5310204:user/release-keys");
    property_override("ro.build.description", "blueline-user 9 PQ2A.190405.003 5310204 release-keys");
    android::init::property_set("ro.boot.btmacaddr", "00:00:00:00:00:00");

    char const *serial_number_file = SERIAL_NUMBER_FILE;
	std::string serial_number;
	if (ReadFileToString(serial_number_file, &serial_number)) {
        serial_number = Trim(serial_number);
        property_override("ro.serialno", serial_number.c_str());
	}	
}

void gsm_properties()
{
    android::init::property_set("telephony.lteOnGsmDevice", "1");
    android::init::property_set("ro.telephony.default_network", "9");
    android::init::property_set("telephony.radioAccessFamily", "gsm");
}

void cdma_properties(int sub)
{
    if ( sub == 1 )
        android::init::property_set("ro.telephony.default_cdma_sub", "1");
    else
        android::init::property_set("ro.telephony.default_cdma_sub", "0");

    android::init::property_set("ro.gps.set_privacy", "1");
    android::init::property_set("persist.eons.enabled", "false");
    android::init::property_set("persist.radio.snapshot_enabled", "1");
    android::init::property_set("persist.radio.snapshot_timer", "22");
    android::init::property_set("telephony.lteOnCdmaDevice", "1");
    android::init::property_set("telephony.radioAccessFamily", "cdma");
}

void r970_properties()
{
    android::init::property_set("ro.telephony.default_network", "8");
    android::init::property_set("ril.subscription.types", "NV,RUIM");
    android::init::property_set("telephony.sms.pseudo_multipart", "1");
    android::init::property_set("ro.config.combined_signal", "true");
    android::init::property_set("ro.gsm.data_retry_config", "max_retries=infinite,0,0,60000,120000,480000,900000");
    android::init::property_set("DEVICE_PROVISIONED", "1");
}
