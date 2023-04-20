#!/bin/bash

echo "卸载旧版Chromium"
sudo apt remove chromium -y
echo "使用apt包安装Chromium"
sudo apt-get install chromium-browser
if [ $? -eq 0 ]; then
    echo -e "\e[32m执行完成，如果还是失败请尝试其他办法\e[32m"
else
    echo -e "\e[31m安装失败，请检查网络\e[31m"
    exit 1