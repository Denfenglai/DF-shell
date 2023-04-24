#!/bin/bash

# 判断当前操作系统是否为 Ubuntu，是则直接执行安装脚本 
if [ -f "/etc/os-release" ]; then
    source /etc/os-release
    if [[ "$NAME" == "Ubuntu" ]]; then
        echo -e "\033[34m当前系统为 Ubuntu，将直接执行安装脚本。\033[0m"
        bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/install.sh)
        exit 0
    fi
fi

# 判断当前是否在 Termux 中
if ! type "termux-info" > /dev/null 2>&1; then
    echo -e "\033[31m请使用 Termux 进行安装。\033[0m"
    exit 1
fi

# 安装必要的软件包 
echo -e "\033[34m正在安装必要的软件包...\033[0m"
pkg install -y proot wget curl > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo -e "\033[31m安装软件包失败！\033[0m"
    exit 1
fi
echo -e "\033[32m安装软件包成功！\033[0m"

# 下载 Ubuntu 镜像并创建容器 
echo -e "\033[34m正在下载 Ubuntu 镜像并创建容器...\033[0m"
mkdir -p ~/ubuntu-fs
cd ~/ubuntu-fs
if [ ! -f "stage3.tar.gz" ]; then
    ARCHITECTURE="$(uname -m)"
    case "${ARCHITECTURE}" in
        armv7l) TARCH="armhf" ;;
         aarch64) TARCH="arm64" ;;
             x86) TARCH="x86" ;;
        x86_64) TARCH="amd64" ;;
    esac
    wget "https://github.com/Termux-pod/termux-rootfs-builder/releases/download/v1.1.3/ubuntu-22.04-${TARCH}.tar.xz" -O stage3.tar.xz > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo -e "\033[31m下载镜像文件失败！\033[0m"
        exit 1
    fi
fi
proot --link2symlink tar -xf stage3.tar.xz > /dev/null 2>&1
echo -e "\033[32m镜像文件下载并解压成功！\033[0m"

# 启动容器 
echo -e "\033[34m正在启动 Ubuntu 容器...\033[0m"
cd ~
if [ ! -f "start-ubuntu.sh" ]; then
    touch start-ubuntu.sh
    echo "#!/bin/bash" >> start-ubuntu.sh
    echo "proot --link2symlink -0 -r ~/ubuntu-fs -b /dev/ -b /sys/ -b /proc/ /usr/bin/env -i HOME=/root TERM=\$TERM PATH=/bin:/usr/bin:/sbin:/usr/sbin /bin/bash" >> start-ubuntu.sh
fi
chmod +x start-ubuntu.sh
./start-ubuntu.sh > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo -e "\033[31m启动容器失败！\033[0m"
    exit 1
fi
echo -e "\033[32m容器启动成功！\033[0m"

exit 0