 # GPS
PRODUCT_PROPERTY_OVERRIDES += \
    persist.gps.qc_nlp_in_use=1 \
    ro.gps.agps_provider=1

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bluetooth.dun=true \
    ro.bluetooth.sap=true \
    ro.bluetooth.hfp.ver=1.6 \
    ro.bt.bdaddr_path=/efs/bluetooth/bt_addr

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0
    