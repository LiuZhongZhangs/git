#!/bin/bash 
### 重新下载文件并初始化
echo "重新下载文件并安装"
cd /usr/local/singlo/edge/install_v2

echo "执行重新下载文件脚本"
./download_user_file.sh $1.xlsx

echo "生成edge_config.ini"
./3_install_edgeconfig.py ../etc/$1.xlsx  $1

echo  "生成拨号配置"
./4_install_pppoeconfig.sh

echo "生成disk_config.ini"
./5_install_diskconfig.py ../etc/$1.xlsx  $1


