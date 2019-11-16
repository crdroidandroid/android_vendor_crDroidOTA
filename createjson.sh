#!/bin/bash
#put script in crDroid source folder, make executable (chmod +x createupdate.sh) and run it (./createupdate.sh)

#modify values below
#leave blank if not used
maintainer="Name (nickname)" #ex: Lup Gabriel (gwolfu)
oem="OEM" #ex: OnePlus
device="device codename" #ex: guacamole
devicename="name of device" #ex: OnePlus 7 Pro
zip="crdroid zip" #ex: crDroidAndroid-10.0-20191110-guacamole-v6.0.zip
buildtype="Beta" #choose from Testing/Alpha/Beta/Weekly/Monthly
forum="https://link"
gapps="https://link"
firmware="https://link"
modem="https://link"
bootloader="https://link"
recovery="https://link"
paypal="https://link"
telegram="https://link"

#don't modify from here
script_path="`dirname \"$0\"`"
zip_name=$script_path/crDroid/out/target/product/$device/$zip

build_date=`echo "$zip_name" | cut -d'-' -f3 | cut -d'_' -f1`
zip_date=`date -r $zip_name "+%Y%m%d %H:%M:%S"`
timestamp=`date --date="$zip_date" +%s`
zip_only=`basename "$zip_name"`
md5=`echo "$zip_name" | md5sum | cut -d' ' -f1`
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