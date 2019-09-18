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
    const std::string bootloader = GetProperty("ro.bootloader", "");

    char const *serial_number_file = SERIAL_NUMBER_FILE;
    std::string serial_number;

    if (ReadFileToString(serial_number_file, &serial_number)) {
        serial_number = Trim(serial_number);
        property_override("ro.serialno", serial_number.c_str());
    }

    if (bootloader.find("M919") == 0) {
        /* jfltetmo */
        property_override("ro.build.description", "jfltetmo-user 4.4.4 KTU84P M919UVSFQA1 release-keys");
        property_override_dual("ro.build.fingerprint", "ro.vendor.build.fingerprint", "samsung/jfltetmo/jfltetmo:4.4.4/KTU84P/M919UVSFQA1:user/release-keys");
        property_override_dual("ro.product.model", "ro.product.vendor.model", "SGH-M919");
        property_override_dual("ro.product.device", "ro.product.vendor.device", "jfltetmo");
        property_override_dual("ro.product.name", "ro.product.vendor.name", "jfltetmo");
        property_override("ro.build.product", "jfltetmo");
    } else if (bootloader.find("I9505G") == 0) {
        /* jgedlte */
        property_override("ro.build.description", "jgedlteue-user 5.1 LMY47O.S008 160301 release-keys");
        property_override_dual("ro.build.fingerprint", "ro.vendor.build.fingerprint", "samsung/jgedlteue/jgedlte:5.1/LMY47O.S008/160301:user/release-keys");
        property_override_dual("ro.product.model", "ro.product.vendor.model", "GT-I9505G");
        property_override_dual("ro.product.device", "ro.product.vendor.device", "jgedlte");
        property_override_dual("ro.product.name", "ro.product.vendor.name", "jgedlteu");
        property_override("ro.build.product", "jgedlte");
    } else if (bootloader.find("I9505") == 0) {
        /* jfltexx */
        property_override("ro.build.description", "jfltexx-user 5.0.1 LRX22C I9505XXUHQK1 release-keys");
        property_override_dual("ro.build.fingerprint", "ro.vendor.build.fingerprint", "samsung/jfltexx/jflte:5.0.1/LRX22C/I9505XXUHQK1:user/release-keys");
        property_override_dual("ro.product.model", "ro.product.vendor.model", "GT-I9505");
        property_override_dual("ro.product.device", "ro.product.vendor.device", "jflte");
        property_override_dual("ro.product.name", "ro.product.vendor.name", "jfltexx");
        property_override("ro.build.product", "jflte");
    } else if (bootloader.find("R970C") == 0) {
        /* jfltecri */
        property_override("ro.build.description", "jfltecri-user 4.4.2 KOT49H R970CVVUFNC6 release-keys");
        property_override_dual("ro.build.fingerprint", "ro.vendor.build.fingerprint", "samsung/jfltecri/jfltecri:4.4.2/KOT49H/R970CVVUFNC6:user/release-keys");
        property_override_dual("ro.product.model", "ro.product.vendor.model", "SCH-R970C");
        property_override_dual("ro.product.device", "ro.product.vendor.device", "jfltecri");
        property_override_dual("ro.product.name", "ro.product.vendor.name", "jfltecri");
        property_override("ro.build.product", "jfltecri");
        property_set("ro.cdma.home.operator.alpha", "Cricket");
        property_set("ro.cdma.home.operator.numeric", "310090");
    } else if (bootloader.find("R970X") == 0) {
        /* jfltecsp */
        property_override("ro.build.description", "jfltecsp-user 5.0.1 LRX22C R970XWWUGOH1 release-keys");
        property_override_dual("ro.build.fingerprint", "ro.vendor.build.fingerprint", "samsung/jfltecsp/jfltecsp:5.0.1/LRX22C/R970XWWUGOH1:user/release-keys");
        property_override_dual("ro.product.model", "ro.product.vendor.model", "SCH-R970X");
        property_override_dual("ro.product.device", "ro.product.vendor.device", "jfltecsp");
        property_override_dual("ro.product.name", "ro.product.vendor.name", "jfltecsp");
        property_override("ro.build.product", "jfltecsp");
        property_set("ro.cdma.home.operator.alpha", "C Spire");
        property_set("ro.cdma.home.operator.numeric", "311230");
    } else if (bootloader.find("R970") == 0) {
        /* jflteusc */
        property_override("ro.build.description", "jflteusc-user 5.0.1 LRX22C R970TYUGPD5 release-keys");
        property_override_dual("ro.build.fingerprint", "ro.vendor.build.fingerprint", "samsung/jflteusc/jflteusc:5.0.1/LRX22C/R970TYUGPD5:user/release-keys");
        property_override_dual("ro.product.model", "ro.product.vendor.model", "SCH-R970");
        property_override_dual("ro.product.device", "ro.product.vendor.device", "jflteusc");
        property_override_dual("ro.product.name", "ro.product.vendor.name", "jflteusc");
        property_override("ro.build.product", "jflteusc");
        property_set("ro.cdma.home.operator.alpha", "U.S. Cellular");
        property_set("ro.cdma.home.operator.numeric", "311580");
    } else if (bootloader.find("L720") == 0) {
        /* jfltespr */
        property_override("ro.build.description", "jfltespr-user 5.0.1 LRX22C L720VPSGPL1 release-keys");
        property_override_dual("ro.build.fingerprint", "ro.vendor.build.fingerprint", "samsung/jfltespr/jfltespr:5.0.1/LRX22C/L720VPSGPL1:user/release-keys");
        property_override_dual("ro.product.model", "ro.product.vendor.model", "SPH-L720");
        property_override_dual("ro.product.device", "ro.product.vendor.device", "jfltespr");
        property_override_dual("ro.product.name", "ro.product.vendor.name", "jfltespr");
        property_override("ro.build.product", "jfltespr");
        property_set("ro.cdma.home.operator.alpha", "Sprint");
        property_set("ro.cdma.home.operator.numeric", "310120");
    } else if (bootloader.find("I337M") == 0) {
        /* jfltecan */
        property_override("ro.build.description", "jfltevl-user 5.0.1 LRX22C I337MVLSGQB1 release-keys");
        property_override_dual("ro.build.fingerprint", "ro.vendor.build.fingerprint", "samsung/jfltevl/jfltecan:5.0.1/LRX22C/I337MVLSGQB1:user/release-keys");
        property_override_dual("ro.product.model", "ro.product.vendor.model", "SGH-I337M");
        property_override_dual("ro.product.device", "ro.product.vendor.device", "jfltecan");
        property_override_dual("ro.product.name", "ro.product.vendor.name", "jfltevl");
        property_override("ro.build.product", "jfltecan");
    } else if (bootloader.find("I337") == 0) {
        /* jflteatt */
        property_override("ro.build.description", "jflteuc-user 5.0.1 LRX22C I337UCUGOC3 release-keys");
        property_override_dual("ro.build.fingerprint", "ro.vendor.build.fingerprint", "samsung/jflteuc/jflteatt:5.0.1/LRX22C/I337UCUGOC3:user/release-keys");
        property_override_dual("ro.product.model", "ro.product.vendor.model", "SGH-I337");
        property_override_dual("ro.product.device", "ro.product.vendor.device", "jflteatt");
        property_override_dual("ro.product.name", "ro.product.vendor.name", "jflteuc");
        property_override("ro.build.product", "jflteatt");
    } else if (bootloader.find("I9515L") == 0) {
        /* jfvelteub */
        property_override("ro.build.description", "jfvelteub-user 5.0.1 LRX22C I9515LUBU1BQF1 release-keys");
        property_override_dual("ro.build.fingerprint", "ro.vendor.build.fingerprint", "samsung/jfvelteub/jfvelte:5.0.1/LRX22C/I9515LUBU1BQF1:user/release-keys");
        property_override_dual("ro.product.model", "ro.product.vendor.model", "GT-I9515L");
        property_override_dual("ro.product.device", "ro.product.vendor.device", "jfvelte");
        property_override_dual("ro.product.name", "ro.product.vendor.name", "jfvelteub");
        property_override("ro.build.product", "jfvelte");
    } else if (bootloader.find("I9515") == 0) {
        /* jfvelte */
        property_override("ro.build.description", "jfveltexx-user 5.0.1 LRX22C I9515XXS1BQD2 release-keys");
        property_override_dual("ro.build.fingerprint", "ro.vendor.build.fingerprint", "samsung/jfveltexx/jfvelte:5.0.1/LRX22C/I9515XXS1BQD2:user/release-keys");
        property_override_dual("ro.product.model", "ro.product.vendor.model", "GT-I9515");
        property_override_dual("ro.product.device", "ro.product.vendor.device", "jfvelte");
        property_override_dual("ro.product.name", "ro.product.vendor.name", "jfveltexx");
        property_override("ro.build.product", "jfvelte");
    } else if (bootloader.find("I545L") == 0) {
        /* jfltelra */
        property_override("ro.build.description", "jfltelra-user 5.0.1 LRX22C I545LWWUGOH1 release-keys");
        property_override_dual("ro.build.fingerprint", "ro.vendor.build.fingerprint", "samsung/jfltelra/jfltelra:5.0.1/LRX22C/I545LWWUGOH1:user/release-keys");
        property_override_dual("ro.product.model", "ro.product.vendor.model", "SCH-I545L");
        property_override_dual("ro.product.device", "ro.product.vendor.device", "jfltelra");
        property_override_dual("ro.product.name", "ro.product.vendor.name", "jfltelra");
        property_override("ro.build.product", "jfltelra");
    } else if (bootloader.find("I545") == 0) {
        /* jfltevzw */
        property_override("ro.build.description", "jfltevzw-user 5.0.1 LRX22C I545VRSGPL1 release-keys");
        property_override_dual("ro.build.fingerprint", "ro.vendor.build.fingerprint", "Verizon/jfltevzw/jfltevzw:5.0.1/LRX22C/I545VRSGPL1:user/release-keys");
        property_override_dual("ro.product.model", "ro.product.vendor.model", "SCH-I545");
        property_override_dual("ro.product.device", "ro.product.vendor.device", "jfltevzw");
        property_override_dual("ro.product.name", "ro.product.vendor.name", "jfltevzw");
        property_override("ro.build.product", "jfltevzw");
    }

    const std::string device = GetProperty("ro.product.device", "");
    LOG(INFO) << "Found bootloader " << bootloader << ". " << "Setting build properties for " << device << ".\n";
}
