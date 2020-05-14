#!/bin/bash
### 确认拨号是否成功脚本
cd /usr/local/singlo/edge/install_v2

echo "开始拨号"
./start_net.sh  
cd ../tools && ./get_all_ip.sh
