#!/bin/bash
#put script in crDroid source folder, make executable (chmod +x createupdate.sh) and run it (./createupdate.sh)

#modify values below
#leave blank if not used
maintainer="Name (nickname)" #ex: Lup Gabriel (gwolfu)
oem="OEM" #ex: OnePlus
device="device codename" #ex: guacamole
devicename="name of device" #ex: OnePlus 7 Pro
zip="crdroid zip" #ex: crDroidAndroid-<android version>-<date>-<device codename>-v<crdroid version>.zip
buildtype="type" #choose from Testing/Alpha/Beta/Weekly/Monthly
forum="" #https link (mandatory)
gapps="" #https link (leave empty if unused)
firmware="" #https link (leave empty if unused)
modem="" #https link (leave empty if unused)
bootloader="" #https link (leave empty if unused)
recovery="" #https link (leave empty if unused)
paypal="" #https link (leave empty if unused)
telegram="" #https link (leave empty if unused)

#don't modify from here
script_path="`dirname \"$0\"`"
zip_name=$script_path/out/target/product/$device/$zip
buildprop=$script_path/out/target/product/$device/system/build.prop

if [ -f $script_path/$device.json ]; then
  rm $script_path/$device.json
fi

linenr=`grep -n "ro.system.build.date.utc" $buildprop | cut -d':' -f1`
timestamp=`sed -n $linenr'p' < $buildprop | cut -d'=' -f2`
zip_only=`basename "$zip_name"`
md5=`md5sum "$zip_name" | cut -d' ' -f1`
size=`stat -c "%s" "$zip_name"`
version=`echo "$zip_only" | cut -d'-' -f5`
v_max=`echo "$version" | cut -d'.' -f1 | cut -d'v' -f2`
v_min=`echo "$version" | cut -d'.' -f2`
version=`echo $v_max.$v_min`

echo '{
  "response": [
    {
        "maintainer": "'Momin(Patriot06)'",
        "oem": "'Realme'",
        "device": "'Realme X3 / SuperZoom (RMX2081)'",
        "filename": "'crDroidAndroid-11.0-20210914-x3-v7.10.zip'",
        "download": "",
        "timestamp": '',
        "md5": "''",
        "size": '',
        "version": "'7.10'",
        "buildtype": "'Monthly'",
        "forum": "'https://forum.xda-developers.com/t/rom-11-0-rmx2081-crdroid-unified-unofficial-los.4335385/'",
        "gapps": "'https://sourceforge.net/projects/flamegapps/files/arm64/android-11/2021-09-12/FlameGApps-11.0-basic-arm64-20210912.zip/download'",
        "firmware": "'https://download.c.realme.com/flash/Rollbackpack/realme_X3_X3SuperZoom/RMX2081PU_11_OTA_0530_all_2pXGiBpULHIz.ozip'",
        "modem": "''",
        "bootloader": "''",
        "recovery": "''",
        "paypal": "''",
        "telegram": "'t.me/patriot_235'"
    }
  ]
}' >> $device.json
