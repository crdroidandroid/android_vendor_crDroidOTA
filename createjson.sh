#!/bin/bash
#put script in crDroid source folder, make executable (chmod +x createupdate.sh) and run it (./createupdate.sh)

#modify values below
#leave blank if not used
maintainer="Bart D (Schumi_wk)" #ex: Lup Gabriel (gwolfu)
oem="Xiaomi" #ex: OnePlus
device="perseus" #ex: guacamole
devicename="Mi Mix 3" #ex: OnePlus 7 Pro
zip="crDroidAndroid-10.0-20200404-perseus-v6.4.zip" #ex: crDroidAndroid-10.0-20191110-guacamole-v6.0.zip
buildtype="weekly" #choose from Testing/Alpha/Beta/Weekly/Monthly
forum="https://forum.xda-developers.com/mi-mix-3/development/rom-crdroid-perseus-t4077295" #https link (mandatory)
gapps="https://opengapps.org/?arch=arm64&api=10.0&variant=pico" #https link (leave empty if unused)
firmware="https://xiaomifirmwareupdater.com/download/?file=fw_perseus_miui_MIMIX3_20.3.26_1a4cf601da_10.0.zip" #https link (leave empty if unused)
modem="" #https link (leave empty if unused)
bootloader="" #https link (leave empty if unused)
recovery="https://forum.xda-developers.com/mi-mix-3/development/recovery-unofficial-twrp-recovery-t3901261" #https link (leave empty if unused)
paypal="https://bit.ly/2GFfDHk" #https link (leave empty if unused)
telegram="https://t.me/MiMix3Global" #https link (leave empty if unused)

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
        "maintainer": "'$maintainer'",
        "oem": "'$oem'",
        "device": "'$devicename'",
        "filename": "'$zip_only'",
        "download": "https://sourceforge.net/projects/crdroid/files/'$device'/'$v_max'.x/'$zip_only'/download",
        "timestamp": '$timestamp',
        "md5": "'$md5'",
        "size": '$size',
        "version": "'$version'",
        "buildtype": "'$buildtype'",
        "forum": "'$forum'",
        "gapps": "'$gapps'",
        "firmware": "'$firmware'",
        "modem": "'$modem'",
        "bootloader": "'$bootloader'",
        "recovery": "'$recovery'",
        "paypal": "'$paypal'",
        "telegram": "'$telegram'"
    }
  ]
}' >> $device.json
