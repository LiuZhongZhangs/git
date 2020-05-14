#!/bin/bash
# 必须root权限
if [ $EUID -ne 0 ]; then
    echo "\033[91m 本程序必须以root用户运行，切换root后重试！ \033[0m" 
    exit 1
fi

# 脚本参数检测
if [ $# -ne 2 ]; then
    echo "usage: $0 用户名 密码"
    exit 2
fi

## 软件包检查
if [ ! f /usr/bin/expect ];then
    echo "\033[91m 安装expect \033[0m"
    apt install expect -y
    exit 3
fi
echo "\033[91m  添加$user用户 \033[0m"
user=$1
password=$2
check_user(){
    egrep "^$username" /etc/passwd >/dev/null
    if [ $? -eq 0];then
        echo "$1用户已存在"
    else
        echo "\033[91m 添加用户 $1 \033[0m"
    fi

}
expect adduser.exp $user $password >> /dev/null


echo "\033[91m $user 添加root权限 \033[0m"
chmod u+w /etc/sudoers && sed -i  '/User privilege/a\'$user'   ALL=(ALL:ALL) ALL' /etc/sudoers
if [ $? -ne 0 ]; then
    echo "[error] 添加$user用户权限失败 "
    exit 4
else
    echo "添加$user用户权限成功"
fi
