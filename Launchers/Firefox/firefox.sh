#!/bin/bash

#  Make sure firefox is actually installed
[ -z "$(dpkg -l | grep firefox)" ] && sudo apt-get install -y firefox

# Always reset it to open in full screen
LOCALSTORE="$(find /home/xbmc/.mozilla/firefox -type f | grep localstore.rdf)"
sed -i 's/sizemode=".*"/sizemode="fullscreen"/g' "$LOCALSTORE"


# Turn on xboxdrv config for firefox, switch back when exits.
# Can I instead change config based on focus?  Maybe this method is best to prevent being able to open tons of junk?
~/XBMC/Scripts/Xboxdrv/xboxdrv.sh ~/XBMC/Scripts/Xboxdrv/Config/firefox.conf
firefox
~/XBMC/Scripts/Xboxdrv/xboxdrv.sh ~/XBMC/Scripts/Xboxdrv/Config/xbmc.conf
