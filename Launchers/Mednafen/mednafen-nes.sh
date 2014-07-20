#!/bin/bash

[ -z "$(dpkg -l | grep mednafen)" ] && sudo apt-get install -y mednafen

~/XBMC/Scripts/Xboxdrv/xboxdrv.sh ~/XBMC/Scripts/Xboxdrv/Config/mednafen.conf

mednafen -fs 1 "$1"

~/XBMC/Scripts/Xboxdrv/xboxdrv.sh ~/XBMC/Scripts/Xboxdrv/Config/xbmc.conf

