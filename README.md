# crDroid OTA repo
In order for a device to be officially supported by crDroid, OTA information needs to be added.
Please refer to the following "Readme" to get started

## 1. Introduction ##
In order for a device to be OTA compliant, there are a few things to know.

### 1.1 JSON structure ###
```
{
  "response": [
    {
        "maintainer": "Name (nickname)",
        "oem": "OEM",
        "device": "Device Name",
        "filename": "crDroidAndroid-13.0-<date>-<device codename>-v<crversion>.zip",
        "download": "https://sourceforge.net/projects/crdroid/files/<device codename>/<crversion>/crDroidAndroid-13.0-<date>-<device codename>-v<crversion>.zip/download",
        "timestamp": 0000000000,
        "md5": "abcdefg123456",
        "sha256": "abcdefg123456",
        "size": 123456789,
        "version": "<crversion>",
        "buildtype": "Testing/Alpha/Beta/Weekly/Monthly",
        "forum": "https://forum link", #(mandatory)
        "gapps": "https://gapps link", #(mandatory)
        "firmware": "https://firmware link",
        "modem": "https://modem link",
        "bootloader": "https://bootloader link",
        "recovery": "https://recovery link",
        "paypal": "https://donation link",
        "telegram": "https://telegram link",
        "dt": "https://github.com/crdroidandroid/android_device_<oem>_<device_codename>", #(mandatory)
        "common-dt": "https://github.com/crdroidandroid/android_device_<orm>_<SOC>-common", #(mandatory)
        "kernel": "https://github.com/crdroidandroid/android_kernel_<oem>_<SOC>" #(mandatory)
    }
  ]
}
```

### 1.2 changelog.txt structure ### 
```
Highlights & Device Specific Changes:
Build type: Testing/Alpha/Beta/Weekly/Monthly
Device: Device name (<device codename>)
Device maintainer: Name (nickname)
Required firmware: add if any else remove this line

===== <date> =====
- change 1
- change 2
- change 3
```

## 2 Guidelines ##
* Check if manufacturer is already existing
* Check if published link is official
* Check if JSON is intact with help of online validator tools like [https://jsonformatter.curiousconcept.com](https://jsonformatter.curiousconcept.com) or [https://jsonformatter.org](https://jsonformatter.org)
* Check if no extra / missing spaces

## 3. How to ##
For following below description, replace *codename* with your device codename. 
### 3.1 Initial support ###
After you contacted [Gabriel on Telegram](https://telegram.me/gwolf2u), and have the approval, follow the below steps.
1. Fork this repo to your own GitHub.
2. A file named *codename*.json is created in OUT dir after you built.
3. Copy it to where this repo was cloned.
4. Open the file and modify needed entries (see 1.1 for mandatory entries).
5. Create a file named changelog_*codename*.txt based on changelog structure from point 1.2, and add your changelog in it.
6. Submit a pull request to this repo (this way we validate that you understood the requirements and if all is good you'll be granted direct push access to this repo)

### 3.2 Update build ###
1. Clone this repo locally
```
git clone https://github.com/crdroidandroid/android_vendor_crDroidOTA -b 13.0
```
2. Change to the directory where you cloned this repo (android_vendor_crDroidOTA) and fetch updates from repo.
```
cd android_vendor_crDroidOTA
git fetch --all
git pull
```
3. Copy *codename*.json file from OUT dir over to this repo).
4. Make changes to changelog_*codename*.txt.
5. Now with the files updated, commit your update to this repo.
```
git add .
git commit #(this opens up your prefered text editor, so write a nice description like "<device codename>: update build")
git push #you may be prompted for your github username and password
```
