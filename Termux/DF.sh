#!/bin/bash

# 检测是否在 Termux 上运行
if [ -n "$ANDROID_ROOT" ] && [ -x "$PREFIX/bin/apt" ]; then
  clear
  echo -e "\e[32m脚本载入成功！\e[0m "
  echo -e "\e[34m检测为 Termux "
  echo -e "\e[36m正在为您安装Ubuntu容器以运行脚本"
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
  bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/install.sh)

# 不支持的系统
else
  echo -e '\033[31m不支持的系统，请使用 Ubuntu 。\033[0m'
fi