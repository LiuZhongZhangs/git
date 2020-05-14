#!/bin/bash

for device_id ` awk '{print $1}' host.md `
do
    wget https://data.singlocloud.com/ppp/download/$device_id.xlsx
done