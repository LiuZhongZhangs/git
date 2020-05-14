

echo "升级镜像版本"

cd   /usr/local/singlo/edge/install_v2

echo "下载镜像" 

### p2p
#./download_image.sh http://101.89.28.90:9080/lego_server-x86_64-centos-6000105.tgz

### zhilian
./download_image.sh http://183.61.57.108/legoserver.com/fog_lego_server_1.1.2.gz

echo "关闭网络"
./stop_net.sh

echo "开启网络"
./start_net.sh


echo "启动镜像"
### p2p
#./start_6_docker_p2p_one.sh ../image/lego_server-x86_64-centos-6000105.tgz

### zhilian
./start_docker.sh ../image/fog_lego_server_1.1.2.gz

echo "查看镜像版本"
docker ps
