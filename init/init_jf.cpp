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
using android::init::property_set;

#define SERIAL_NUMBER_FILE "/efs/FactoryApp/serial_no"

// copied from build/tools/releasetools/ota_from_target_files.py
// but with "." at the end and empty entry
std::vector<std::string> ro_product_props_default_source_order = {
    ".",
    "product.",
    "product_services.",
    "odm.",
    "vendor.",
    "system.",
};

void property_override(char const prop[], char const value[], bool add = true)
{
    auto pi = (prop_info *) __system_property_find(prop);

    if (pi != nullptr) {
        __system_property_update(pi, value, strlen(value));
    } else if (add) {
        __system_property_add(prop, strlen(prop), value, strlen(value));
    }
}

void vendor_load_properties()
{
    const std::string bootloader = GetProperty("ro.bootloader", "");

    char const *serial_number_file = SERIAL_NUMBER_FILE;
    std::string serial_number;

    if (ReadFileToString(serial_number_file, &serial_number)) {
        serial_number = Trim(serial_number);
        property_override("ro.serialno", serial_number.c_str());
    }

    const auto set_ro_product_prop = [](const std::string &source,
            const std::string &prop, const std::string &value) {
        auto prop_name = "ro.product." + source + prop;
        property_override(prop_name.c_str(), value.c_str(), false);
    };

    if (bootloader.find("M919") == 0) {
        /* jfltetmo */
        for (const auto &source : ro_product_props_default_source_order) {
            set_ro_product_prop(source, "fingerprint", "samsung/jfltetmo/jfltetmo:4.4.4/KTU84P/M919UVSFQA1:user/release-keys");
            set_ro_product_prop(source, "device", "jfltetmo");
            set_ro_product_prop(source, "model", "SGH-M919");
            set_ro_product_prop(source, "name", "jfltetmo");
        }
        property_override("ro.build.description", "jfltetmo-user 4.4.4 KTU84P M919UVSFQA1 release-keys");
        property_override("ro.build.product", "jfltetmo");
    } else if (bootloader.find("I9505G") == 0) {
        /* jgedlte */
        for (const auto &source : ro_product_props_default_source_order) {
            set_ro_product_prop(source, "fingerprint", "samsung/jgedlteue/jgedlte:5.1/LMY47O.S008/160301:user/release-keys");
            set_ro_product_prop(source, "device", "jgedlte");
            set_ro_product_prop(source, "model", "GT-I9505G");
            set_ro_product_prop(source, "name", "jgedlteu");
        }
        property_override("ro.build.description", "jgedlteue-user 5.1 LMY47O.S008 160301 release-keys");
        property_override("ro.build.product", "jgedlte");
    } else if (bootloader.find("I9505") == 0) {
        /* jfltexx */
        for (const auto &source : ro_product_props_default_source_order) {
            set_ro_product_prop(source, "fingerprint", "samsung/jfltexx/jflte:5.0.1/LRX22C/I9505XXUHQK1:user/release-keys");
            set_ro_product_prop(source, "device", "jflte");
            set_ro_product_prop(source, "model", "GT-I9505");
            set_ro_product_prop(source, "name", "jfltexx");
        }
        property_override("ro.build.description", "jfltexx-user 5.0.1 LRX22C I9505XXUHQK1 release-keys");
        property_override("ro.build.product", "jflte");
    } else if (bootloader.find("R970C") == 0) {
        /* jfltecri */
        for (const auto &source : ro_product_props_default_source_order) {
            set_ro_product_prop(source, "fingerprint", "samsung/jfltecri/jfltecri:4.4.2/KOT49H/R970CVVUFNC6:user/release-keys");
            set_ro_product_prop(source, "device", "jfltecri");
            set_ro_product_prop(source, "model", "SCH-R970C");
            set_ro_product_prop(source, "name", "jfltecri");
        }
        property_override("ro.build.description", "jfltecri-user 4.4.2 KOT49H R970CVVUFNC6 release-keys");
        property_override("ro.build.product", "jfltecri");
        property_set("ro.cdma.home.operator.alpha", "Cricket");
        property_set("ro.cdma.home.operator.numeric", "310090");
    } else if (bootloader.find("R970X") == 0) {
        /* jfltecsp */
        for (const auto &source : ro_product_props_default_source_order) {
            set_ro_product_prop(source, "fingerprint", "samsung/jfltecsp/jfltecsp:5.0.1/LRX22C/R970XWWUGOH1:user/release-keys");
            set_ro_product_prop(source, "device", "jfltecsp");
            set_ro_product_prop(source, "model", "SCH-R970X");
            set_ro_product_prop(source, "name", "jfltecsp");
        }
        property_override("ro.build.description", "jfltecsp-user 5.0.1 LRX22C R970XWWUGOH1 release-keys");
        property_override("ro.build.product", "jfltecsp");
        property_set("ro.cdma.home.operator.alpha", "C Spire");
        property_set("ro.cdma.home.operator.numeric", "311230");
    } else if (bootloader.find("R970") == 0) {
        /* jflteusc */
        for (const auto &source : ro_product_props_default_source_order) {
            set_ro_product_prop(source, "fingerprint", "samsung/jflteusc/jflteusc:5.0.1/LRX22C/R970TYUGPD5:user/release-keys");
            set_ro_product_prop(source, "device", "jflteusc");
            set_ro_product_prop(source, "model", "SCH-R970");
            set_ro_product_prop(source, "name", "jflteusc");
        }
        property_override("ro.build.description", "jflteusc-user 5.0.1 LRX22C R970TYUGPD5 release-keys");
        property_override("ro.build.product", "jflteusc");
        property_set("ro.cdma.home.operator.alpha", "U.S. Cellular");
        property_set("ro.cdma.home.operator.numeric", "311580");
    } else if (bootloader.find("L720") == 0) {
        /* jfltespr */
        for (const auto &source : ro_product_props_default_source_order) {
            set_ro_product_prop(source, "fingerprint", "samsung/jfltespr/jfltespr:5.0.1/LRX22C/L720VPSGPL1:user/release-keys");
            set_ro_product_prop(source, "device", "jfltespr");
            set_ro_product_prop(source, "model", "SPH-L720");
            set_ro_product_prop(source, "name", "jfltespr");
        }
        property_override("ro.build.description", "jfltespr-user 5.0.1 LRX22C L720VPSGPL1 release-keys");
        property_override("ro.build.product", "jfltespr");
        property_set("ro.cdma.home.operator.alpha", "Sprint");
        property_set("ro.cdma.home.operator.numeric", "310120");
    } else if (bootloader.find("I337M") == 0) {
        /* jfltecan */
        for (const auto &source : ro_product_props_default_source_order) {
            set_ro_product_prop(source, "fingerprint", "samsung/jfltevl/jfltecan:5.0.1/LRX22C/I337MVLSGQB1:user/release-keys");
            set_ro_product_prop(source, "device", "jfltecan");
            set_ro_product_prop(source, "model", "SGH-I337M");
            set_ro_product_prop(source, "name", "jfltevl");
        }
        property_override("ro.build.description", "jfltevl-user 5.0.1 LRX22C I337MVLSGQB1 release-keys");
        property_override("ro.build.product", "jfltecan");
    } else if (bootloader.find("I337") == 0) {
        /* jflteatt */
        for (const auto &source : ro_product_props_default_source_order) {
            set_ro_product_prop(source, "fingerprint", "samsung/jflteuc/jflteatt:5.0.1/LRX22C/I337UCUGOC3:user/release-keys");
            set_ro_product_prop(source, "device", "jflteatt");
            set_ro_product_prop(source, "model", "SGH-I337");
            set_ro_product_prop(source, "name", "jflteuc");
        }
        property_override("ro.build.description", "jflteuc-user 5.0.1 LRX22C I337UCUGOC3 release-keys");
        property_override("ro.build.product", "jflteatt");
    } else if (bootloader.find("I9515L") == 0) {
        /* jfvelteub */
        for (const auto &source : ro_product_props_default_source_order) {
            set_ro_product_prop(source, "fingerprint", "samsung/jfvelteub/jfvelte:5.0.1/LRX22C/I9515LUBU1BQF1:user/release-keys");
            set_ro_product_prop(source, "device", "jfvelte");
            set_ro_product_prop(source, "model", "GT-I9515L");
            set_ro_product_prop(source, "name", "jfvelteub");
        }
        property_override("ro.build.description", "jfvelteub-user 5.0.1 LRX22C I9515LUBU1BQF1 release-keys");
        property_override("ro.build.product", "jfvelte");
    } else if (bootloader.find("I9515") == 0) {
        /* jfvelte */
        for (const auto &source : ro_product_props_default_source_order) {
            set_ro_product_prop(source, "fingerprint", "samsung/jfveltexx/jfvelte:5.0.1/LRX22C/I9515XXS1BQD2:user/release-keys");
            set_ro_product_prop(source, "device", "jfvelte");
            set_ro_product_prop(source, "model", "GT-I9515");
            set_ro_product_prop(source, "name", "jfveltexx");
        }
        property_override("ro.build.description", "jfveltexx-user 5.0.1 LRX22C I9515XXS1BQD2 release-keys");
        property_override("ro.build.product", "jfvelte");
    } else if (bootloader.find("I545L") == 0) {
        /* jfltelra */
        for (const auto &source : ro_product_props_default_source_order) {
            set_ro_product_prop(source, "fingerprint", "samsung/jfltelra/jfltelra:5.0.1/LRX22C/I545LWWUGOH1:user/release-keys");
            set_ro_product_prop(source, "device", "jfltelra");
            set_ro_product_prop(source, "model", "SCH-I545L");
            set_ro_product_prop(source, "name", "jfltelra");
        }
        property_override("ro.build.description", "jfltelra-user 5.0.1 LRX22C I545LWWUGOH1 release-keys");
        property_override("ro.build.product", "jfltelra");
    } else if (bootloader.find("I545") == 0) {
        /* jfltevzw */
        for (const auto &source : ro_product_props_default_source_order) {
            set_ro_product_prop(source, "fingerprint", "Verizon/jfltevzw/jfltevzw:5.0.1/LRX22C/I545VRSGPL1:user/release-keys");
            set_ro_product_prop(source, "device", "jfltevzw");
            set_ro_product_prop(source, "model", "SCH-I545");
            set_ro_product_prop(source, "name", "jfltevzw");
        }
        property_override("ro.build.description", "jfltevzw-user 5.0.1 LRX22C I545VRSGPL1 release-keys");
        property_override("ro.build.product", "jfltevzw");
    } else if (bootloader.find("I9295") == 0) {
        /* jactivelte */
        for (const auto &source : ro_product_props_default_source_order) {
            set_ro_product_prop(source, "fingerprint", "samsung/jactiveltexx/jactivelte:5.0.1/LRX22C/I9295XXUDPF1:user/release-keys");
            set_ro_product_prop(source, "device", "jactivelte");
            set_ro_product_prop(source, "model", "GT-I9295");
            set_ro_product_prop(source, "name", "jactiveltexx");
        }
        property_override("ro.build.description", "jactiveltexx-user 5.0.1 LRX22C I9295XXUDPF1 release-keys");
        property_override("ro.build.product", "jactivelte");
    }

    const std::string device = GetProperty("ro.product.device", "");
    LOG(INFO) << "Found bootloader " << bootloader << ". " << "Setting build properties for " << device << ".\n";
}
