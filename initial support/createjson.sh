#!/bin/bash
#put script in crDroid source folder, make executable (chmod +x createupdate.sh) and run it (./createupdate.sh)

#modify values below
#leave blank if not used
maintainer:"MLZ (MLZ94)",

         oem:"Asus",

         device:"Asus Zenfone 5",

         filename:"crDroidAndroid-11.0-20200110-X00QD-v7.2.zip",

         download:"https://drive.google.com/file/d/1PY1IPvZaUqQdd0rJfr7EWvLuNa5MtyQr/view?usp=drivesdk",

         timestamp:1608382590,

         md5:"833b0cfda6e9606b11c576f71fbdae09",

         size:850865773,

         version:"7.2",

         buildtype:"Mountly",

         forum:"https://forum.xda-developers.com/t/crdroid-asus-zenfone-5.4217813/",

         gapps:"",

         firmware:"",

         modem:"",

         bootloader:"",

         recovery:"",

         paypal:"patreon.com/MLZ94",

         telegram:"https://t.me/MLZ94"














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
