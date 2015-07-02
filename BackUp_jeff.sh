#!/bin/bash

_BackupTime=$(date +"%m_%d_%Y_%H%M")
_FileDir1="/root/ixos/scripts"
_FileDir2="/etc"
echo "BackUp starts now........."
rsync -vrlptg $_FileDir1 /media/disk/scripts$_BackupTime
rsync -vrlptg $_FileDir2 /media/disk/etc$_BackupTime

