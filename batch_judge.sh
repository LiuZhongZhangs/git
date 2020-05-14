#!/bin/bash
cd /tmp/host_file
for device_id in `awk '{print $1}' host.md`
do
    ./update_file.py  $device_id.xlsx  $device_id   >> update.log  
done