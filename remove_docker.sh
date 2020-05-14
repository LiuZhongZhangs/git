#!/bin/bash 
### 卸载docker
echo "完全卸载docker"
echo "卸载自动安装的包"
apt-get autoremove docker docker-ce docker-engine  docker.io  containerd runc -y

echo "卸载docker插件"
apt-get autoremove docker-ce-*

echo "卸载docker的相关配置"
rm -rf /etc/systemd/system/docker.service.d
rm -rf /var/lib/docker