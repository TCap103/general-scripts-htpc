#!/bin/bash

[ -z "$(dpkg -l | grep zsnes)" ] && sudo apt-get install -y zsnes

~/XBMC/Scripts/Xboxdrv/xboxdrv.sh ~/XBMC/Scripts/Xboxdrv/Config/zsnes.conf

sudo zsnes -m -v 4 -ad sdl "$1"

~/XBMC/Scripts/Xboxdrv/xboxdrv.sh ~/XBMC/Scripts/Xboxdrv/Config/xbmc.conf

