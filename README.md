# crDroid OTA repo
OTA configuration for crDroidOTA (push OTA info when new build is ready to device users)

## Introduction ##
In order for a device to be OTA compliant, there are a few things to know. 

## XML structure ##
```
<manufacturer id="manufacturer">
            <device codename>
                  <maintainer></maintainer>
                  <devicename></devicename>
                  <filename></filename>
                  <buildtype></buildtype>
                  <download></download>
                  <changelog></changelog>
                  <gapps></gapps>
                  <forum></forum>
            </device codename>
</manufacturer>
```


### Mandatory XML tags ###
**maintainer** - your name followed by your nickname (your name can be private if you want - just add some info)  
**devicename** - device name (pay attention not codename)  
**filename** - this is the name of the latest crDroid build made  
**buildtype** - Nightly/Weekly/Final  
**download** - download url  
**changelog** - changelog url  
**gapps** - gapps url (generally opengapps would be good here)  
**forum** - forum url where you share your builds and offer support (most likely XDA)  

### Optional tags ###
**paypal** - paypal url (for donations)  
**telegram** - telegram url (if you offer support via telgram - can be a group link or telegram.me link)  
