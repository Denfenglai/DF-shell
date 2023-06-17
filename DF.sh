#!/bin/bash

# 检测是否在 Termux 上运行
if [ -n "$ANDROID_ROOT" ] && [ -x "$PREFIX/bin/apt" ]; then
  clear
  echo -e "\e[32m脚本载入成功！\e[0m "
  echo -e "\e[34m检测为 Termux "
  echo -e "\e[36m正在为您安装 Ubuntu 容器以运行脚本"
  echo -e "\e[33m作者：\e[0m等风来\e[0m"
  echo -e "\e[35m项目主页：\e[0mhttps://dengfenglai.cloud/"
  sleep 3
  bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/Termux/Termux.sh)

# 检测是否在 Ubuntu 上运行
elif [ -f /etc/os-release ] && grep -q "^NAME=\"Ubuntu\"" /etc/os-release; then
  clear
  echo -e "\e[32m脚本载入成功！\e[0m "
  echo -e "\e[34m检测为 Ubuntu "
  echo -e "\e[36m正在为您安装脚本"
  echo -e "\e[33m作者：\e[0m等风来\e[0m"
  echo -e "\e[35m项目主页：\e[0mhttps://dengfenglai.cloud/"
  sleep 3
  bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/Ubuntu/install.sh)

# 检测是否在 CentOS 上运行
elif [ -f /etc/centos-release ]; then
  clear
  echo -e "\e[32m脚本载入成功！\e[0m "
  echo -e "\e[34m检测为 CentOS "
  echo -e "\e[36m正在为您安装脚本"
  echo -e "\e[33m作者：\e[0m等风来\e[0m"
  echo -e "\e[35m项目主页：\e[0mhttps://dengfenglai.cloud/"
  sleep 3
  bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/CentOS/install.sh)

# 不支持的系统
else
  echo -e '\033[31m暂不支持该系统\033[0m'
  echo "\e[1;31m支持\e[0m] Ubuntu 18+ CentOS 7+ 系统"
  echo -e "\e[33m]详情请见 dengfenglai.cloud\e[0m"
fi