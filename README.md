# crDroid OTA repo
In order for a device to be officially supported by crDroid, OTA information needs to be added.
Please refer to the following "Readme" to get started"

## Introduction ##
In order for a device to be OTA compliant, there are a few things to know. 

## XML structure ##
```
      <manufacturer id="Manufacturer">
            <DeviceCode>
                  <maintainer>MaintainerName</maintainer>
                  <devicename>DeviceName</devicename>
                  <filename>FileName</filename>
                  <buildtype>BuildType</buildtype>
                  <download>DownloadLink</download>
                  <changelog>ChangelogLink</changelog>
                  <gapps>GappsLink</gapps>
                  <forum>ForumLink</forum>
                  <firmware>FirmwareLink</firmware>
                  <modem>ModemLink</modem>
                  <bootloader>BootloaderLink</bootloader>
                  <recovery>RecoveryLink</recovery>
                  <paypal>PaypalLink</paypal>
                  <telegram>TelegramLink</telegram>
            </DeviceCode>
      </manufacturer>
```

### Mandatory XML tags ###
* **Manufacturer** - Add under existing manufacturer (create manufacturer if required)
* **DeviceCode** - Device code name
* **MaintainerName** - Maintainer name followed by prefered name in parenthesis
* **DeviceName** - Device name (not code name)
* **FileName** - Latest crdroid build name (OTA code parses date to check for new version - don't include file extension .zip)
* **BuildType** - Nightly/Weekly/Final
* **DownloadLink** - Official download folder url (from AFH) masked by bit.ly shortlinks
* **ChangelogLink** - Changelog url (GitHub)
* **GappsLink** - Google apps url (preferred: opengapps url)
* **ForumLink** - Forum url for discussions and support (preferred: xda url)

*All mandatory XML tags need to be there. Please leave blank in case some do not apply to you.*

### Optional XML tags ###
* **FirmwareLink** - link for needed firmware
* **ModemLink** - link for needed modem
* **BootloaderLink** - link for needed bootloader
* **RecoveryLink** - link for recommended recovery
* **PaypalLink** - paypal url (for donations)
* **TelegramLink** - telegram url (if you offer support via telegram - can be a group link or telegram.me link)

## Guidelines ##
* Check if manufacturer is already existing
* Check if published link is official
* Check if XML is intact
* Check if no extra / missing spaces  

## How to ##
### Initial support - first setup ###
1. Clone this repo locally
```
git clone https://github.com/crdroidandroid/android_vendor_crDroidOTA -b 9.0
```
2. Open file named **update.xml** and make changes based on the [XML structure](https://github.com/crdroidandroid/android_vendor_crDroidOTA#xml-structure). You can also add your **changelog_<device_codename>.txt** file if you have it.
3. Now with the files updated, commit your changes to this repo.
```
git add *
git commit #(this opens up your prefered text editor, so write a nice description like "added support for <device>")
git push #you may be prompted for your github username and password
```
### Update builds ###  
1. Just open a terminal and change to the directory where you cloned this repo (android_vendor_crDroidOTA) and fetch updates from repo.
```
cd android_vendor_crDroidOTA
git fetch --all
git pull
```
2. Make changes to **update.xml** and changelog, then push updates to repo.
```
git add *
git commit 
git push
```

## Notice: ##  
Due to the fact the XML does not accept "&" in tags, there is a need to shortlink your download links
Please note that **goo.gl** is going down starting **April 13 2018** ([source](https://developers.googleblog.com/2018/03/transitioning-google-url-shortener.html)) it's advised to use **[bitly](https://bitly.com)** as alternative
