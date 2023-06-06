#!/bin/bash

# 检查操作系统是否为 CentOS
if ! [[ "$(uname)" == "Linux" && -f "/etc/centos-release" ]]; then
    echo -e "\033[31m 请使用 CentOS 系统！\033[0m"
    exit 1
fi

# 检查是否为root用户
if [[ "$(id -u)" -ne "0" ]]; then
    echo -e "\033[31m 请使用root用户！\033[0m"
    exit 1
fi

if ! [ -x "$(command -v curl)" ];then
    echo -e "\033[36m检测到未安装curl 开始安装 \033[0m";
    yum update -y
    yum install curl -y
fi
if ! [ -x "$(command -v wget)" ];then
    echo -e "\033[36m检测到未安装wget 开始安装 \033[0m";
    yum update -y
    yum install wget -y
fi
if ! [ -x "$(command -v git)" ];then
    echo -e "\033[36m检测到未安装git 开始安装 \033[0m";
    yum update -y
    yum install git -y
fi

if ! [ -x "$(command -v whiptail)" ]; then
    echo -e "\033[36m 检测到未安装 whiptail，开始安装 \033[0m"
    yum update -y
    yum install newt -y
fi

# 安装 d 工具
if ! [ -e "/usr/local/bin/d" ]; then
    yum install -y centos-release-scl
    echo "LANG=\"zh_CN.UTF-8\"
    export LANG" >> /etc/profile
    source /etc/profile
    rm -rf /usr/local/bin/d
    wget -O /usr/local/bin/d https://gitee.com/Wind-is-so-strong/yz/raw/master/shell/Index.sh
    (
        for ((i = 0; i <= 100; i += 1)); do
            sleep 0.01s
            echo $i
        done
    ) | whiptail --gauge "未安装 正在安装" 6 60 0
    sleep 0.5
    if ! [ -e "/usr/local/bin/d" ]; then
        whiptail --title "等风来" --msgbox \
        "安装失败 请检查网络" \
        8 25
        exit 1
    fi
    chmod +x /usr/local/bin/d
    rm -f wget.log
    d
else
    rm -rf /usr/local/bin/d
    wget -O /usr/local/bin/d https://gitee.com/Wind-is-so-strong/yz/raw/master/shell/Index.sh
    (
        for ((i = 0; i <= 100; i += 1)); do
            sleep 0.01s
            echo $i
        done
    ) | whiptail --gauge "已安装 正在更新" 6 60 0
    if ! [ -e "/usr/local/bin/d" ]; then
        whiptail --title "等风来" --msgbox \
        "安装失败 请检查网络" \
        8 25
        exit 1
    fi
    chmod +x /usr/local/bin/d
    rm -f wget.log
    d
fi