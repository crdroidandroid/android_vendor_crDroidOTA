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
