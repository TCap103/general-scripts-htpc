#!/bin/bash

# Halt all xboxdrv processes
sudo killall xboxdrv 2> /dev/null

# Was having an issue with daemon failing to connect
# (wasn't dropping previous connection fast enough?)
sleep 1
sudo xboxdrv --detach-kernel-driver --led 2 -c "$1"  --axismap -Y2=Y2 --daemon --detach
