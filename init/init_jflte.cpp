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

#include <android-base/file.h>
#include <android-base/logging.h>
#include <android-base/properties.h>
#include <android-base/strings.h>

#include "property_service.h"
#include "vendor_init.h"


#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

using android::base::GetProperty;
using android::base::ReadFileToString;
using android::base::Trim;
//using property_override;

#define SERIAL_NUMBER_FILE "/efs/FactoryApp/serial_no"

void property_override(char const prop[], char const value[], bool add = true)
{
    auto pi = (prop_info *) __system_property_find(prop);

    if (pi != nullptr) {
        __system_property_update(pi, value, strlen(value));
    } else if (add) {
        __system_property_add(prop, strlen(prop), value, strlen(value));
    }
}

void gsm_properties()
{
    property_override("telephony.lteOnGsmDevice", "1");
    property_override("ro.telephony.default_network", "9");
    property_override("telephony.radioAccessFamily", "gsm");
}

void cdma_properties(int sub)
{
    if ( sub == 1 )
        property_override("ro.telephony.default_cdma_sub", "1");
    else
        property_override("ro.telephony.default_cdma_sub", "0");

    property_override("ro.gps.set_privacy", "1");
    property_override("persist.eons.enabled", "false");
    property_override("persist.radio.snapshot_enabled", "1");
    property_override("persist.radio.snapshot_timer", "22");
    property_override("telephony.lteOnCdmaDevice", "1");
    property_override("telephony.radioAccessFamily", "cdma");
}

void r970_properties()
{
    property_override("ro.telephony.default_network", "8");
    property_override("ril.subscription.types", "NV,RUIM");
    property_override("telephony.sms.pseudo_multipart", "1");
    property_override("ro.config.combined_signal", "true");
    property_override("ro.gsm.data_retry_config", "max_retries=infinite,0,0,60000,120000,480000,900000");
    property_override("DEVICE_PROVISIONED", "1");
}

// copied from build/tools/releasetools/ota_from_target_files.py
// but with "." at the end and empty entry
std::vector<std::string> ro_product_props_default_source_order = {
    "",
    "product.",
    "product_services.",
    "odm.",
    "vendor.",
    "system.",
    "system_ext.",
};

void vendor_load_properties()
{
    const std::string bootloader = GetProperty("ro.bootloader", "");

	char const *serial_number_file = SERIAL_NUMBER_FILE;
	std::string serial_number;

	if (ReadFileToString(serial_number_file, &serial_number)) {
        serial_number = Trim(serial_number);
        if (serial_number != "00000000000") {
            property_override("ro.serialno", serial_number.c_str());
        }
	}

 	const auto set_ro_product_prop = [](const std::string &source,
            const std::string &prop, const std::string &value) {
        auto prop_name = "ro.product." + source + prop;
        property_override(prop_name.c_str(), value.c_str(), false);
    };

    if (bootloader.find("I337M") == 0) {
        /* jfltecan */
        gsm_properties();
        for (const auto &source : ro_product_props_default_source_order) {
        	set_ro_product_prop(source,"fingerprint","samsung/jfltevl/jfltecan:4.4.2/KOT49H/I337MVLUFNC1:user/release-keys");
        	set_ro_product_prop(source,"device","jfltecan");
        	set_ro_product_prop(source,"model","SGH-I337M");
        	set_ro_product_prop(source,"name","jfltecan");
        }
        property_override("ro.build.description", "jfltevl-user 4.2.2 JDQ39 I337MVLUAMDJ release-keys");
        property_override("ro.build.product", "jfltecan");
    } else if (bootloader.find("I337") == 0)  {
        /* jflteatt */
        gsm_properties();
        for (const auto &source : ro_product_props_default_source_order) {
        	set_ro_product_prop(source,"fingerprint","samsung/jflteuc/jflteatt:4.4.2/KOT49H/I337UCUFNB1:user/release-keys");
        	set_ro_product_prop(source,"device","jflteatt");
        	set_ro_product_prop(source,"model","SGH-I337");
        	set_ro_product_prop(source,"name","jflteatt");
        }
        property_override("ro.build.description", "jflteuc-user 4.4.2 KOT49H I337UCUFNB1 release-keys");
        property_override("ro.build.product", "jflteatt");
    } else if (bootloader.find("R970C") == 0)  {
        /* jfltecri */
        cdma_properties(0);
        r970_properties();
        for (const auto &source : ro_product_props_default_source_order) {
        	set_ro_product_prop(source,"fingerprint","samsung/jfltecri/jfltecri:4.4.2/KOT49H/R970CVVUFNC6:user/release-keys");
        	set_ro_product_prop(source,"device","jfltecri");
        	set_ro_product_prop(source,"model","SCH-R970C");
        	set_ro_product_prop(source,"name","jfltecri");
        }
        property_override("ro.build.description", "jfltecri-user 4.4.2 KOT49H R970CVVUFNC6 release-keys");
        property_override("ro.build.product", "jfltecri");

        property_override("ro.cdma.home.operator.alpha", "Cricket");
        property_override("ro.cdma.home.operator.numeric", "310090");
    } else if (bootloader.find("R970X") == 0) {
        /* jfltecsp */
        cdma_properties(0);
        r970_properties();
        for (const auto &source : ro_product_props_default_source_order) {
        	set_ro_product_prop(source,"fingerprint","samsung/jfltecsp/jfltecsp:5.0.1/LRX22C/R970XWWUGOH1:user/release-keys");
        	set_ro_product_prop(source,"device","jfltecsp");
        	set_ro_product_prop(source,"model","SCH-R970X");
        	set_ro_product_prop(source,"name","jfltecsp");
        }
        property_override("ro.build.description", "jfltecsp-user 5.0.1 LRX22C R970XWWUGOH1 release-keys");
        property_override("ro.build.product", "jfltecsp");

        property_override("telephony.sms.pseudo_multipart", "1");
        property_override("ro.cdma.home.operator.alpha", "C Spire");
        property_override("ro.cdma.home.operator.numeric", "311230");
    } else if (bootloader.find("L720") == 0) {
        /* jfltespr */
        cdma_properties(1);
        for (const auto &source : ro_product_props_default_source_order) {
        	set_ro_product_prop(source,"fingerprint","samsung/jfltespr/jfltespr:5.0.1/LRX22C/L720VPSGPL1:user/release-keys");
        	set_ro_product_prop(source,"device","jfltespr");
        	set_ro_product_prop(source,"model","SPH-L720");
        	set_ro_product_prop(source,"name","jfltespr");
        }
        property_override("ro.build.description", "jfltespr-user 5.0.1 LRX22C L720VPSGPL1 release-keys");
        property_override("ro.build.product", "jfltespr");

        property_override("ro.cdma.home.operator.numeric", "310120");
        property_override("ro.cdma.home.operator.alpha", "Sprint");
        property_override("ro.telephony.default_network", "8");
        property_override("ro.telephony.get_imsi_from_sim", "true");
        property_override("telephony.sms.pseudo_multipart", "1");
     } else if (bootloader.find("L720T") == 0) {
        /* jflterefreshspr */
        cdma_properties(1);
        for (const auto &source : ro_product_props_default_source_order) {
        	set_ro_product_prop(source,"fingerprint","samsung/jfltespr/jfltespr:5.0.1/LRX22C/L720VPSGPL1:user/release-keys");
        	set_ro_product_prop(source,"device","jflterefreshspr");
        	set_ro_product_prop(source,"model","SPH-L720T");
        	set_ro_product_prop(source,"name","jflterefreshspr");
        }
        property_override("ro.build.description", "jfltespr-user 5.0.1 LRX22C L720VPSGPL1 release-keys");
        property_override("ro.build.product", "jflterefreshspr");

        property_override("ro.cdma.home.operator.numeric", "310120");
        property_override("ro.cdma.home.operator.alpha", "Sprint");
        property_override("ro.telephony.default_network", "8");
        property_override("ro.telephony.get_imsi_from_sim", "true");
        property_override("telephony.sms.pseudo_multipart", "1");
    } else if (bootloader.find("M919") == 0) {
        /* jfltetmo */
        gsm_properties();
        for (const auto &source : ro_product_props_default_source_order) {
        	set_ro_product_prop(source,"fingerprint","samsung/jfltetmo/jfltetmo:4.4.4/KTU84P/M919UVSFQA1:user/release-keys");
        	set_ro_product_prop(source,"device","jfltetmo");
        	set_ro_product_prop(source,"model","SGH-M919");
        	set_ro_product_prop(source,"name","jfltetmo");
        }
        property_override("ro.build.description", "jfltetmo-user 4.4.4 KTU84P M919UVSFQA1 release-keys");
        property_override("ro.build.product", "jfltetmo");
    } else if (bootloader.find("S970") == 0)  {
		/* jfltetfntmo */
		gsm_properties();
        for (const auto &source : ro_product_props_default_source_order) {
        	set_ro_product_prop(source,"fingerprint","samsung/jfltetmo/jfltetmo:4.4.4/KTU84P/M919UVSFQA1:user/release-keys");
        	set_ro_product_prop(source,"device","jfltetfntmo");
        	set_ro_product_prop(source,"model","SGH-S970G");
        	set_ro_product_prop(source,"name","jfltetfntmo");
        }
        property_override("ro.build.description", "jfltetmo-user 4.4.4 KTU84P M919UVSFQA1 release-keys");
        property_override("ro.build.product", "jfltetfntmo");

        property_override("ril.subscription.types", "NV,RUIM");
        property_override("DEVICE_PROVISIONED", "1");
    } else if (bootloader.find("S975") == 0) {
		/* jfltetfnatt */
		gsm_properties();
		for (const auto &source : ro_product_props_default_source_order) {
        	set_ro_product_prop(source,"fingerprint","samsung/jflteuc/jflteatt:4.4.2/KOT49H/I337UCUFNB1:user/release-keys");
        	set_ro_product_prop(source,"device","jfltetfnatt");
        	set_ro_product_prop(source,"model","SM-S975L");
        	set_ro_product_prop(source,"name","jfltetfnatt");
        }
        property_override("ro.build.description", "jflteuc-user 4.4.2 KOT49H I337UCUFNB1 release-keys");
        property_override("ro.build.product", "jfltetfnatt");

        property_override("ril.subscription.types", "NV,RUIM");
        property_override("DEVICE_PROVISIONED", "1");
    } else if (bootloader.find("R970") == 0) {
        /* jflteusc */
        cdma_properties(0);
        r970_properties();
		for (const auto &source : ro_product_props_default_source_order) {
        	set_ro_product_prop(source,"fingerprint","samsung/jflteusc/jflteusc:5.0.1/LRX22C/R970TYUGPD5:user/release-keys");
        	set_ro_product_prop(source,"device","jflteusc");
        	set_ro_product_prop(source,"model","SCH-R970");
        	set_ro_product_prop(source,"name","jflteusc");
        }
        property_override("ro.build.description", "jflteusc-user 5.0.1 LRX22C R970TYUGPD5 release-keys");
        property_override("ro.build.product", "jflteusc");

        property_override("ro.cdma.home.operator.alpha", "U.S.Cellular");
        property_override("ro.cdma.home.operator.numeric", "311580");
    } else if (bootloader.find("I545") == 0) {
        /* jfltevzw */
        cdma_properties(0);
        for (const auto &source : ro_product_props_default_source_order) {
        	set_ro_product_prop(source,"fingerprint","Verizon/jfltevzw/jfltevzw:5.0.1/LRX22C/I545VRSGPL1:user/release-keys");
        	set_ro_product_prop(source,"device","jfltevzw");
        	set_ro_product_prop(source,"model","SCH-I545");
        	set_ro_product_prop(source,"name","jfltevzw");
        }
        property_override("ro.build.description", "jfltevzw-user 5.0.1 LRX22C I545VRSGPL1 release-keys");
        property_override("ro.build.product", "jfltevzw");

        property_override("ro.cdma.home.operator.alpha", "Verizon");
        property_override("ro.cdma.home.operator.numeric", "311480");
        property_override("ro.telephony.default_network", "10");
        property_override("ro.telephony.get_imsi_from_sim", "true");
        property_override("ro.config.multimode_cdma", "1");
        property_override("ro.config.combined_signal", "true");
        property_override("ro.gsm.data_retry_config", "max_retries=infinite,5000,5000,60000,120000,480000,900000");
        property_override("DEVICE_PROVISIONED", "1");
        property_override("ro.com.google.clientidbase", "android-verizon");
    } else if (bootloader.find("I9505G") == 0) {
        /* jgedlte */
        gsm_properties();
        for (const auto &source : ro_product_props_default_source_order) {
        	set_ro_product_prop(source,"fingerprint","samsung/jgedlteue/jgedlte:4.4.3/KTU84L.S003/140503:user/release-keys");
        	set_ro_product_prop(source,"device","jgedlte");
        	set_ro_product_prop(source,"model","GT-I9505G");
        	set_ro_product_prop(source,"name","jgedlte");
        }
        property_override("ro.build.description", "jgedlteue-user 4.4.3 KTU84L.S003 140503 release-keys");
        property_override("ro.build.product", "jgedlte");

        property_override("ril.subscription.types", "NV,RUIM");
        property_override("DEVICE_PROVISIONED", "1");
    } else if (bootloader.find("I9505") == 0) {
        /* jfltexx */
        gsm_properties();
        for (const auto &source : ro_product_props_default_source_order) {
        	set_ro_product_prop(source,"fingerprint","samsung/jfltexx/jflte:5.0.1/LRX22C/I9505XXUHQK1:user/release-keys");
        	set_ro_product_prop(source,"device","jfltexx");
        	set_ro_product_prop(source,"model","GT-I9505");
        	set_ro_product_prop(source,"name","jfltexx");
        }
        property_override("ro.build.description", "jfltexx-user 5.0.1 LRX22C I9505XXUHQK1 release-keys");
        property_override("ro.build.product", "jfltexx");
    } else if (bootloader.find("I9507") == 0) {
        /* jftddxx */
        gsm_properties();
        for (const auto &source : ro_product_props_default_source_order) {
        	set_ro_product_prop(source,"fingerprint","samsung/jftddxx/jftdd:4.3/JSS15J/I9507XXUENB5:user/release-keys");
        	set_ro_product_prop(source,"device","jftddxx");
        	set_ro_product_prop(source,"model","GT-I9507");
        	set_ro_product_prop(source,"name","jftddxx");
        }
        property_override("ro.build.description", "jftddxx-user 4.3 JSS15J I9507XXUENB5 release-keys");
        property_override("ro.build.product", "jftddxx");
    } else if (bootloader.find("I9508") == 0)  {
        /* jfltezm */
        gsm_properties();
        for (const auto &source : ro_product_props_default_source_order) {
        	set_ro_product_prop(source,"fingerprint","samsung/jfltezm/jflte:4.2.2/JDQ39/I9508ZMUAMG1:user/release-keys");
        	set_ro_product_prop(source,"device","jfltezm");
        	set_ro_product_prop(source,"model","GT-I9508");
        	set_ro_product_prop(source,"name","jfltezm");
        }
        property_override("ro.build.description", "jfltezm-user 4.2.2 JDQ39 I9508ZMUAMG1 release-keys");
        property_override("ro.build.product", "jfltezm");

    } else if (bootloader.find("I9295") == 0) {
        /* jactivelte */
        gsm_properties();
        for (const auto &source : ro_product_props_default_source_order) {
        	set_ro_product_prop(source,"fingerprint","samsung/jactiveltexx/jactivelte:5.0.1/LRX22C/I9295XXUDPF1:user/release-keys");
        	set_ro_product_prop(source,"device","jactivelte");
        	set_ro_product_prop(source,"model","GT-I9295");
        	set_ro_product_prop(source,"name","jactivelte");
        }
         property_override("ro.build.description", "jactiveltexx-user 5.0.1 LRX22C I9295XXUDPF1 release-keys");
        property_override("ro.build.product", "jactivelte");
    } else {
        property_override("ro.build.fingerprint","ERROR.INIT FAILED");
        return;
    }
    const std::string device = GetProperty("ro.product.vendor.device", "");
    LOG(INFO) << "Found bootloader " << bootloader << ". " << "Setting build properties for " << device << ".\n";

}

