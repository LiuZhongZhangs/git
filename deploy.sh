#!/bin/bash
echo "开始下载脚本初始化"
cd /tmp && curl -o install_all.sh  https://data.singlocloud.com/ppp/install &&  chmod +x install_all.sh 
echo "将日志定位到/tmp/deploy.log中"
./install_all.sh $1 
cat deploy.log | grep "失败"
if [ $? -eq 0 ]
then
    echo "初始化失败，请重新下载文件并初始化"
else
    echo "初始化成功，请确认拨号是否成功"
fi