#!/bin/bash

cd ~/Yunzai-Bot
# 清屏
clear


# 添加菜单选项
echo "================================="
echo "              报错修复            "
echo "================================="
echo "1. 修复pnpm start 报错"
echo "2. 修复缺少icqq"
echo "3. 重装云崽依赖"
echo "4. 修复45禁止登录（概率成功）"
echo "5. 打开puppeteer chromium修复菜单
"

# 提示用户选择
echo "请选择一个选项 [1-5]: "

# 读取用户输入
read choice

# 根据选择执行相应的操作
case $choice in
    1)
        pnpm install pm2 -w
        echo -en "\033[32m 修复完成 回车返回\033[0m";read -p ""
        ;;
    2)
        pnpm add icqq -w
        echo -en "\033[32m 修复完成 回车返回\033[0m";read -p ""
        ;;
    3)
        rm -rf node_modules
        pnpm cache clean --force
        pnpm install
        echo -en "\033[32m 修复完成 回车返回\033[0m";read -p ""
        ;;
    4)
     echo "正在校验ICQQ版本"
#定义ICQQ版本
ICQQ_VERSION=$(npm ls icqq | grep icqq | awk '{print $4}' | cut -c2-)
REQUIRED_VERSION="0.0.31"

#判断ICQQ是否为0.0.31
if [ "$ICQQ_VERSION" = "$REQUIRED_VERSION" ]; then
    #是就直接删除虚拟设备信息
    echo -e "\e[1;32m校验成功,版本为0.0.31！\e[0m"
    echo -e "\e[\e[1;33m正在修复..\e[0m"
    rm -rf data/device.json
    echo -e "\e[1;32m修复成功\e[0m"
    echo -en "\033[33;4m一次不行可以多试几次 回车开始配置账号\e[0m";read -p ""
else
    #什么?你居然不用0.0.31?给我用！
    echo -e "\e[1;31m当前ICQQ版本为:\e[0m \e[1;34m$ICQQ_VERSION\e[0m" 
    sleep 0.5
    echo -e "\e[1;34m正在尝试安装ICQQ@0.0.31版本\e[0m"
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
#再次检查安装是否成功
if [[ $? -eq 0 ]]; then
  echo "\e[1;32m哦呀？成功了哦，看来你的运气也不是很差嘛\e[0m"
else
  echo -e "\e[1;31m什么嘛，又失败了？你可真是天弃之子啊！\e[0m"
  exit 1
         fi
    fi
fi
 npm run login
        ;;
    5)
#清屏
clear
        echo -e "\e[1;32m正在打开Chromium修复菜单\e[0m"
        bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/shell/Chromium.sh)
        ;;
    *)
        echo "无效的选择"
        ;;
esac
