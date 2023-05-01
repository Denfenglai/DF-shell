#!/bin/bash

# 定义颜色变量
N="\e[0m"
G="\e[32m"
R="\e[31m"
Q="\e[36m"
L="\e[34m"
H="\e[33m"
#清屏
clear

echo "           错误码  "
echo "============================"
echo "    1. 删除虚拟设备信息"
echo "    2. 安装指定icqq版本"
echo "    3. 错误码:45"
echo "    4. 错误码:237"
echo "    5. 错误码:235"
echo "    6. 错误码:238"
echo "============================"
echo "      输入【oicq】换乐鸟源"
echo "      输入【icqq】换喵喵源"
echo "============================"
echo "    0. 退出"

while true; do
read -p "请输入选项编号: " opt
case $opt in
    #删
    1)
        cd ~/Yunzai-Bot
        if [ -d /root/Yunzai-Bot/data/icqq ]; then
   rm -rf data/icqq
else
   rm -rf data/device.json
fi
 echo -en "\033[32m 修复完成 回车返回\033[0m";read -p ""
        ;;
        
        #装
    2)
        while true; do
        clear
        echo "=============ICQQ官网=============="
        echo "  https://github.com/icqqjs/icqq"
        echo "  不知道版本就不要用或者去官网找你要的"
        echo "=================================="
        echo -e "请输入您要安装的icqq版本(格式：x.x):"
        echo -n "ICQQ@0.";read version
        if [[ "$version" == "n" ]]; then
            exit 0
        elif [[ "$version" =~ ^[0-3]\.[0-2]$ ]]; then
            cd ~/Yunzai-Bot
            pnpm i icqq@0.$version -w
            echo -en "\033[32m 修复完成 回车返回\033[0m";read -p ""
        else
            echo -e "$R输入的格式不正确，请重新输入$N"
            done
        fi
        ;;
        
    3)
#套用xdm的脚本，咱也不看直接套
clear
echo -e "$Y本方法是安装0.3.1版本然后使用协议6$N"
echo -e "$Q也就是安卓8.8.8$N"
echo -e "$R此方法必须完全删除虚拟设备信息！$N"
echo -e "$Q等风来就是不要脸，直接套人家脚本，诶嘿~$N"
echo -e "$Y5秒后开始安装$N"
sleep 5
#先提前删一遍
cd ~/Yunzai-Bot
if [ -d /root/Yunzai-Bot/data/icqq ]; then
   rm -rf data/icqq
else
   rm -rf data/device.json
fi
#笨比Xx居然不自己cd！不过也好，这样适配还多一些
cd ~/Yunzai-Bot
bash <(curl -sL https://gitee.com/haanxuan/version/raw/master/version.sh)
    ;;

    4)
#摘抄某人的原话
        echo -e "$L说简单点就是换号解决$N"
        echo -e "$Q说易懂点就是风控$N"
        echo -e "$G登录频繁被腾讯限制登录\n只能用手机号或扫码\n但目前没有手机号登录的框架\n扫码只支持手表还不一定成功\n所以237一律换号$N"
        echo
        echo -en "\033[32m 修复完成 回车返回\033[0m";read -p ""
        ;;
        
    5)
        echo -e "$L235不知道什么原因$N"
        echo -e "$G删了虚拟设备信息就可以了$N"
        cd ~/Yunzai-Bot
if [ -d /root/Yunzai-Bot/data/icqq ]; then
   rm -rf data/icqq
else
   rm -rf data/device.json
fi
        echo -e "$G我已经帮你删辣，下回自己删就可以了$N"
        echo "删除教程:"
        echo "云崽: rm -rf data/device.json"
        echo "喵崽: rm -rf data/icqq"
        echo "你不清楚的话用脚本删就可以了"
        echo -en "\033[32m 修复完成 回车返回\033[0m";read -p ""
        ;;
        
        6)
            echo -e "$R目前238只在手表账密登录出现\n手表只支持扫码登录\n使用手表协议请扫码登录\n需要账密登录推荐使用iPad$N"
            echo -en "\033[32m 修复完成 回车返回\033[0m";read -p ""
            ;;
            
        oicq)
            echo "咕咕~"
            echo "刨个坑"
            echo -en "\033[32m 未完待续 回车返回\033[0m";read -p ""
            ;;
            
        icqq)
            echo "咕咕~"
            echo "刨个坑"
            echo -en "\033[32m 未完待续 回车返回\033[0m";read -p ""
            ;;
            
        0)
        exit 0
        ;;
        
    *)
        echo "无效的选项"
        ;;

esac
done