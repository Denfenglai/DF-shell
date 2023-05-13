#!/bin/bash

#32位也想玩？
if [ "$(uname -m)" = "i686" ] || [ "$(uname -m)" = "i386" ]; then
    echo -e "\e[1;33m很遗憾你是32位系统\e[0m"
    echo -e "\e[1;31m换一个64位的系统吧\e[0m"
    echo -e "\e[1;32m推荐使用大厂服务器\e[0m"
    echo -e "\e[1;36m腾讯云或阿里云都有免费试用\e[0m"
    exit
else
clear
fi

#先试试嘛~
echo -e "\e[1;32m已安装！为您启动Ubuntu\e[0m"
echo Ubuntu 启动成功
cd ~/Termux-Linux/Ubuntu
./start-ubuntu.sh
clear

#检测是否有大聪明
if [ "$PREFIX" = "/data/data/com.termux/files/usr" ]; then
:
else
    echo -e "\e[1;36m师傅 你是干什么工作的？\e[0m"
    echo -e "\e[1;31m这不是Termux呀\e[0m"
    echo -e "\e[1;33mTermux才需要装Ubuntu\e[0m"
    echo -e "\e[1;32m你有ubuntu直接安装启动脚本就可以了啊\e[0m"
exit
fi

# 换源
sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/apt/termux-main stable main@' $PREFIX/etc/apt/sources.list

# 设置需要检查或安装的软件包
PACKAGES="proot git python"

# 安装软件包的命令（抄到其他系统可自行替换！）
INSTALL_COMMAND="pkg install"

# 缺失的软件包的列表
MISSING_PACKAGES=""

# 安装失败最大重新尝试安装次数（抄脚本的时候可方便自定义！）
MAX_TRIES=3

# 循环遍历检查每个需要安装的软件包是否已经存在
for package in $PACKAGES
do
    if ! command -v $package &> /dev/null
    then
        MISSING_PACKAGES="$MISSING_PACKAGES $package"
    fi
done

# 如果所有的软件包都已经安装，则跳过，否则安装缺失的软件包
if [ -z "$MISSING_PACKAGES" ]
then
    :
else
    echo "下列软件包将被安装：$MISSING_PACKAGES"
    for ((try=1; try<=$MAX_TRIES; try++)); do
        echo "正在尝试第 $try 次安装……"
        if ! $INSTALL_COMMAND $MISSING_PACKAGES -y; then
            echo "安装失败。"
            if [[ $try -lt $MAX_TRIES ]]; then
                echo "尝试再次安装……"
                sleep 3
            else
                echo "安装 $MISSING_PACKAGES 失败，换源或者科学一下你的上网方式吧。"
                exit 1
            fi
        else
            echo "安装成功！"
            break
        fi
    done
fi
echo -e "\e[1;32m开始安装Ubuntu 18.04\e[0m"
git clone https://gitee.com/Le-niao/termux-install-linux.git
echo "alias u='cd ~/Termux-Linux/Ubuntu && ./start-ubuntu.sh'" >> ~/.bashrc
cd termux-install-linux
yes 1 |python termux-linux-install.py
echo "bash Tip.sh" >> /data/data/com.termux/files/home/Termux-Linux/Ubuntu/ubuntu-fs/root/.bashrc
curl -o /data/data/com.termux/files/home/Termux-Linux/Ubuntu/ubuntu-fs/root/Tip.sh https://gitee.com/Wind-is-so-strong/yz/raw/master/Termux/Tip.sh
cd ~/Termux-Linux/Ubuntu
./start-ubuntu.sh
echo -e "\e[1;31m安装Ubuntu 18.04失败\e[0m"
echo -e "\e[1;32m加入QQ交流群453694434问问吧\e[0m"
echo -e "\e[1;36m记得截图这个界面去问喔\e[0m"
exit