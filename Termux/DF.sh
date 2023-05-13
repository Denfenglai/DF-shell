#!/bin/bash

# 检测是否在 Termux 上运行
if [ -n "$ANDROID_ROOT" ] && [ -x "$PREFIX/bin/apt" ]; then
  echo "在风中相遇，在光中起舞..."
  bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/Termux/Termux.sh)

# 检测是否在 Ubuntu 上运行
elif [ -f /etc/os-release ] && grep -q "^NAME=\"Ubuntu\"" /etc/os-release; then
  echo "在风中相遇，在光中起舞..."
  bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/install.sh)

# 不支持的系统
else
  echo -e '\033[31m不支持的系统，请使用 Ubuntu 。\033[0m'
fi