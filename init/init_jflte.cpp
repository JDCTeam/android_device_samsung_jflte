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

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
//#include "util.h"
#include <string>

void gsm_properties();
void cdma_properties(int sub);
void r970_properties();

using android::base::GetProperty;

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
        property_override_dual("ro.build.fingerprint","ro.vendor.build.fingerprint","samsung/jfltevl/jfltecan:4.2.2/JDQ39/I337MVLUAMDJ:user/release-keys");
        property_override("ro.build.description", "jfltevl-user 4.2.2 JDQ39 I337MVLUAMDJ release-keys");
        property_override_dual("ro.product.model","ro.product.vendor.model","SGH-I337M");
        property_override_dual("ro.product.device","ro.product.vendor.device", "jfltecan");
        property_override_dual("ro.build.product","ro.lineage.device","jfltecan");
    } else if (bootloader.find("I337") != std::string::npos)  {
        /* jflteatt */
        gsm_properties();
        property_override_dual("ro.build.fingerprint","ro.vendor.build.fingerprint","samsung/jflteuc/jflteatt:5.0.1/LRX22C/I337UCUGOC3:user/release-keys");
        property_override("ro.build.description", "jflteuc-user 5.0.1 LRX22C I337UCUGOC3 release-keys");
        property_override_dual("ro.product.model","ro.product.vendor.model", "SGH-I337");
        property_override_dual("ro.product.device","ro.product.vendor.device",  "jflteatt");
        property_override_dual("ro.build.product","ro.lineage.device","jflteatt");
    } else if (bootloader.find("R970C") != std::string::npos)  {
        /* jfltecri */
        cdma_properties(0);
        r970_properties();
        property_override_dual("ro.build.fingerprint","ro.vendor.build.fingerprint", "samsung/jfltecri/jfltecri:4.2.2/JDQ39/R970CVVUAME4:user/release-keys");
        property_override("ro.build.description", "jfltecri-user 4.2.2 JDQ39 R970CVVUAME4 release-keys");
        property_override_dual("ro.product.model","ro.product.vendor.model", "SCH-R970C");
        property_override_dual("ro.product.device","ro.product.vendor.device",  "jfltecri");
        android::init::property_set("ro.cdma.home.operator.alpha", "Cricket");
        android::init::property_set("ro.cdma.home.operator.numeric", "310090");
        property_override_dual("ro.build.product","ro.lineage.device","jfltecri");
    } else if (bootloader.find("R970X") != std::string::npos) {
        /* jfltecsp */
        cdma_properties(0);
        r970_properties();
        property_override_dual("ro.build.fingerprint","ro.vendor.build.fingerprint", "samsung/jfltecsp/jfltecsp:4.2.2/JDQ39/R970XWWUAMFA:user/release-keys");
        property_override("ro.build.description", "jfltecsp-user 4.2.2 JDQ39 R970XWWUAMFA release-keys");
        property_override_dual("ro.product.model","ro.product.vendor.model", "SCH-R970X");
        property_override_dual("ro.product.device","ro.product.vendor.device",  "jfltecsp");
        property_override_dual("ro.build.product","ro.lineage.device","jfltecsp");
        android::init::property_set("telephony.sms.pseudo_multipart", "1");
    } else if (bootloader.find("L720") != std::string::npos) {
        /* jfltespr */
        cdma_properties(1);
        property_override_dual("ro.build.fingerprint","ro.vendor.build.fingerprint", "samsung/jfltespr/jfltespr:4.2.2/JDQ39/L720VPUAMDL:user/release-keys");
        property_override("ro.build.description", "jfltespr-user 4.2.2 JDQ39 L720VPUAMDL release-keys");
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
        property_override_dual("ro.build.fingerprint","ro.vendor.build.fingerprint", "samsung/jfltetmo/jfltetmo:4.4.4/KTU84P/M919UVUFNK2:user/release-keys");
        property_override("ro.build.description", "jfltetmo-user 4.4.4 KTU84P M919UVUFNK2 release-keys");
        property_override_dual("ro.product.model","ro.product.vendor.model", "SGH-M919");
        property_override_dual("ro.product.device","ro.product.vendor.device",  "jfltetmo");
        property_override_dual("ro.build.product","ro.lineage.device","jfltetmo");
    } else if (bootloader.find("S970") != std::string::npos)  {
	/* jfltetfntmo */
	gsm_properties();
        property_override_dual("ro.build.fingerprint","ro.vendor.build.fingerprint", "samsung/jfltetfntmo/jfltetfntmo:4.2.2/JDQ39/S970GUDUAMH3:user/release-keys");
        property_override("ro.build.description", "jfltetfntmo-user 4.2.2 JDQ39 S970GUDUAMH3 release-keys");
        property_override_dual("ro.product.model","ro.product.vendor.model", "SGH-S970G");
        property_override_dual("ro.product.device","ro.product.vendor.device",  "jfltetfntmo");
        property_override_dual("ro.build.product","ro.lineage.device","jfltetfntmo");
        android::init::property_set("ril.subscription.types", "NV,RUIM");
        android::init::property_set("DEVICE_PROVISIONED", "1");
    } else if (bootloader.find("S975") != std::string::npos) {
	/* jfltetfnatt */
	gsm_properties();
        property_override_dual("ro.build.fingerprint","ro.vendor.build.fingerprint", "samsung/jflteud/jfltetfnatt:4.3/JSS15J/S975LUDUANB1:user/release-keys");
        property_override("ro.build.description", "jflteud-user 4.3 JSS15J S975LUDUANB1 release-keys");
        property_override_dual("ro.product.model","ro.product.vendor.model", "SM-S975L");
        property_override_dual("ro.product.device","ro.product.vendor.device", "jfltetfnatt");
        property_override_dual("ro.build.product","ro.lineage.device","jfltetfnatt");
        android::init::property_set("ril.subscription.types", "NV,RUIM");
        android::init::property_set("DEVICE_PROVISIONED", "1");
    } else if (bootloader.find("R970") != std::string::npos) {
        /* jflteusc */
        cdma_properties(0);
        r970_properties();
        property_override_dual("ro.build.fingerprint","ro.vendor.build.fingerprint", "samsung/jflteusc/jflteusc:4.2.2/JDQ39/R970VXUAMD9:user/release-keys");
        property_override("ro.build.description", "jflteusc-user 4.2.2 JDQ39 R970VXUAMD9 release-keys");
        property_override_dual("ro.product.model","ro.product.vendor.model", "SCH-R970");
        property_override_dual("ro.product.device","ro.product.vendor.device",  "jflteusc");
        property_override_dual("ro.build.product","ro.lineage.device","jflteusc");
        android::init::property_set("ro.cdma.home.operator.alpha", "U.S.Cellular");
        android::init::property_set("ro.cdma.home.operator.numeric", "311580");
    } else if (bootloader.find("I545") != std::string::npos) {
        /* jfltevzw */
        cdma_properties(0);
        property_override_dual("ro.build.fingerprint","ro.vendor.build.fingerprint", "Verizon/jfltevzw/jfltevzw:5.0.1/LRX22C/I545VRUGOC1:user/release-keys");
        property_override("ro.build.description", "jfltevzw-user 5.0.1 LRX22C I545VRUGOC1 release-keys");
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
        property_override_dual("ro.build.fingerprint","ro.vendor.build.fingerprint", "samsung/jgedlteue/jgedlte:5.1/LMY47O.S008/150802:user/release-keys");
        property_override("ro.build.description", "jgedlteue-user 5.1 LMY47O.S008 150802 release-keys");
        property_override_dual("ro.product.model","ro.product.vendor.model", "GT-I9505G");
        property_override_dual("ro.product.device","ro.product.vendor.device", "jgedlte");
        property_override_dual("ro.build.product","ro.lineage.device","jgedlte");
        android::init::property_set("ril.subscription.types", "NV,RUIM");
        android::init::property_set("DEVICE_PROVISIONED", "1");
    } else if (bootloader.find("I9505") != std::string::npos) {
        /* jfltexx */
        gsm_properties();
        property_override_dual("ro.build.fingerprint","ro.vendor.build.fingerprint", "samsung/jfltexx/jflte:5.0.1/LRX22C/I9505XXUHOB7:user/release-keys");
        property_override("ro.build.description", "jfltexx-user 5.0.1 LRX22C I9505XXUHOB7 release-keys");
        property_override_dual("ro.product.model","ro.product.vendor.model", "GT-I9505");
        property_override_dual("ro.product.device","ro.product.vendor.device", "jfltexx");
        property_override_dual("ro.build.product","ro.lineage.device","jfltexx");
    } else if (bootloader.find("I9507") != std::string::npos) {
        /* jftddxx */
        gsm_properties();
        property_override_dual("ro.build.fingerprint","ro.vendor.build.fingerprint", "samsung/jftddxx/jftdd:4.3/JSS15J/I9507XXUENB5:user/release-keys");
        property_override("ro.build.description", "jftddxx-user 4.3 JSS15J I9507XXUENB5 release-keys");
        property_override_dual("ro.product.model","ro.product.vendor.model", "GT-I9507");
        property_override_dual("ro.product.device","ro.product.vendor.device", "jftddxx");
        property_override_dual("ro.build.product","ro.lineage.device","jftddxx");
    } else if (bootloader.find("I9508") != std::string::npos)  {
        /* jfltezm */
        gsm_properties();
        property_override_dual("ro.build.fingerprint","ro.vendor.build.fingerprint", "samsung/jfltezm/jflte:4.2.2/JDQ39/I9508ZMUAMG1:user/release-keys");
        property_override("ro.build.description", "jfltezm-user 4.2.2 JDQ39 I9508ZMUAMG1 release-keys");
        property_override_dual("ro.product.model","ro.product.vendor.model", "GT-I9508");
        property_override_dual("ro.product.device","ro.product.vendor.device", "jfltezm");
        property_override_dual("ro.build.product","ro.lineage.device","jfltezm");
    } else if (bootloader.find("I9295") != std::string::npos) {
        /* jactivelte */
        gsm_properties();
        property_override_dual("ro.build.fingerprint","ro.vendor.build.fingerprint", "samsung/jactivelte/jactivelte:4.4.2/KTU84Q/I9295XXUCNE5:user/release-keys");
        property_override("ro.build.description", "jactivelte-user 4.4.4 KTU84Q I9295XXUCNE5 release-keys");
        property_override_dual("ro.product.model","ro.product.vendor.model", "GT-I9295");
        property_override_dual("ro.product.device","ro.product.vendor.device", "jactivelte");
        property_override_dual("ro.build.product","ro.lineage.device","jactivelte");
    } else {
        property_override("ro.build.fingerprint","ERROR.INIT FAILED");
    }
    property_set("ro.boot.btmacaddr", "00:00:00:00:00:00");
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
