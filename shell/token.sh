#!/bin/bash

# 清屏
clear

#初始化加载
if [ -f "$HOME/.Yunzai" ]; then
  echo -e "\033[32m校验成功\033[0m"
else
  echo -e "\033[33m初始化文件中\033[0m"
  sleep 0.3
  echo "/root/Yunzai-Bot" > "$HOME/.Yunzai"
fi
#定义云崽路径
Yz=$(head -n 1 "${HOME}/.Yunzai")
    
#定义获取版本号
ICQQ_VERSION=$(npm ls icqq | grep icqq | awk '{print $4}' | cut -c2-)
#解析版本号
ICQQ_VERSION=$(echo $ICQQ_VERSION | sed 's/.*[@+]//' | sed 's/\/.*//')
#定义icqq版本
REQUIRED_VERSION="0.3.3"

#判断是否为0.3.3版本
if [ "$ICQQ_VERSION" = "$REQUIRED_VERSION" ]; then
    if [ -n "$NODE_OPTIONS" ] && [ "$NODE_OPTIONS" = "--openssl-legacy-provider" ]; then
    echo -e "\033[34m检测到环境变量已设置！请检查是否能正常登录！\033[0m"
    echo "\033[31m退出\033[0m"
    exit 0
else
    echo "\033[32m正在为您设置环境变量，请稍等！\033[0m"
    export NODE_OPTIONS='--openssl-legacy-provider'
    sleep 0.3
    if [ -n "$NODE_OPTIONS" ] && [ "$NODE_OPTIONS" = "--openssl-legacy-provider" ]; then
    echo "环境变量设置成功！正在为您开始"
else
    echo "NODE_OPTIONS is not set or is set to a different value"
fi
fi
else
    #什么?你居然不用0.0.31?给我用！
    echo -e "\e[1;31m当前ICQQ版本为:\e[0m \e[1;34m$ICQQ_VERSION\e[0m"
    sleep 0.5
    echo -e "\e[1;34m正在尝试安装ICQQ@0.0.31版本\e[0m"
    sleep 0.5
    cd ~/Yunzai-Bot
    pnpm add icqq@0.0.31 -w
#判断装成功没有
if [[ $? -eq 0 ]]; then
    echo -en "\e[1;32m安装成功！\e[0m"
else
    #幸运儿安装失败了
    echo -e "\e[1;31m恭喜你！安装失败了！5秒后强制安装！\e[0m"
    sleep 5
    pnpm add icqq@0.0.31 -w --force
