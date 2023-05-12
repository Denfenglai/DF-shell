#!/bin/bash

if [ "$PREFIX" = "/data/data/com.termux/files/usr" ]; then
echo -e "\e[1;32m已安装！为您启动Ubuntu\e[0m"
echo "bash Tip.sh" >> /data/data/com.termux/files/home/Termux-Linux/Ubuntu/ubuntu-fs/root/.bashrc
curl -o /data/data/com.termux/files/home/Termux-Linux/Ubuntu/ubuntu-fs/root/Tip.sh https://gitee.com/haanxuan/yzai-pd/raw/master/Tip.sh
echo 正在启动Ubuntu
cd ~/Termux-Linux/Ubuntu
./start-ubuntu.sh
clear
echo -e "\e[1;36m  爱很重要，值得奔走相告。\e[0m"
bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/Termux/Termux.sh)
exit
else
if [ -e "/usr/local/bin/d" ]; then
clear
  d
  exit
else
clear
echo -e "\e[1;36m  在风中相遇，在光中起舞。\e[0m"
bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/install.sh)
exit
 fi
fi