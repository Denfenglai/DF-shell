#!/bin/bash

if [ -e "/usr/local/bin/d" ]; then
clear
  sed -i '/bash Tip.sh/d' /root/.bashrc
  source ~/.bashrc
  d
  rm -rf Tip.sh
  exit
else
  :
fi 

clear
echo -e "\e[1;33m  更新软件包\e[0m"
apt update

clear
echo -e "\e[1;33m  安装Curl\e[0m"
apt install curl -y

clear
echo -e "\e[1;36m  少女祈祷中..\e[0m"
bash <(curl -sL https://github.com/Denfenglai/DF-shell/raw/master/Ubuntu/install.sh)