#!/bin/bash

# 定义颜色变量
N="\e[0m"
G="\e[32m"
R="\e[31m"
Q="\e[36m"
L="\e[34m"
H="\e[33m"
#初始化加载
if [ -f "$HOME/.Yunzai" ]; then
  echo -e "\033[32m校验成功\033[0m"
else
  echo -e "\033[33m初始化文件中\033[0m"
  sleep 0.3
  echo "~/Yunzai-Bot" > "$HOME/.Yunzai"
fi
#定义云崽路径
Yz=$(head -n 1 "${HOME}/.Yunzai")
#清屏
clear

echo "           错误码  "
echo "============================
当前路径:$Yz"
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
        cd $Yz
        if [ -d $Yz/data/icqq ]; then
   rm -rf data/icqq
else
   rm -rf data/device.json
fi
 echo -en "\033[32m 修复完成 回车返回\033[0m";read -p ""
        ;;
        
        #装
    2)
        clear
        echo "=============ICQQ官网=============="
        echo "  https://github.com/icqqjs/icqq"
        echo "  不知道版本就不要用或者去官网找你要的"
        echo "=================================="
        while true; do
        echo -e "请输入您要安装的icqq版本(格式：x.x):"
        echo -n "ICQQ@0.";read version
        if [[ "$version" == "n" ]]; then
            exit 0
        elif [[ "$version" =~ ^[0-3]\.[0-37]$ ]]; then
            cd $Yz
            pnpm i icqq@0.$version -w
            echo -en "\033[32m 修复完成 回车返回\033[0m";read -p ""
        exit
        else
            echo -e "$R输入的格式不正确，请重新输入$N"
        fi
        done
        ;;
        
    3)
#套用xdm的脚本，咱也不看直接套
clear
echo -e "$Y 本方法是安装0.3.1版本然后使用协议6$N"
echo -e "$Q 也就是安卓8.8.8 $N"
echo -e "$R 此方法必须完全删除虚拟设备信息！$N"
echo -e "$Q 等风来就是不要脸，直接套人家脚本，诶嘿~$N"
echo -e "$Y 5秒后开始安装$N"
sleep 5
#先提前删一遍
cd $Yz
if [ -d $Yz/data/icqq ]; then
   rm -rf data/icqq
else
   rm -rf data/device.json
fi
#笨比Xx居然不自己cd！不过也好，这样适配还多一些
cd $Yz
bash <(curl -sL https://gitee.com/haanxuan/version/raw/master/version.sh)
    break
    ;;

    4)
#摘抄某人的原话
        echo -e "$L说简单点就是换号解决$N"
        echo -e "$Q说易懂点就是风控$N"
        echo -e "$G登录频繁被腾讯限制登录\n只能用手机号或扫码\n但目前没有手机号登录的框架\n扫码只支持手表还不一定成功\n所以237一律换号$N"
        echo
        echo -en "\033[32m 修复完成 回车返回\033[0m";read -p ""
      exit
        ;;
        
    5)
        echo -e "$L235不知道什么原因$N"
        echo -e "$G删了虚拟设备信息就可以了$N"
        cd $Yz
if [ -d $Yz/data/icqq ]; then
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
       exit
        ;;
        
        6)
            echo -e "$R目前238只在手表账密登录出现\n手表只支持扫码登录\n使用手表协议请扫码登录\n需要账密登录推荐使用iPad$N"
            echo -en "\033[32m 修复完成 回车返回\033[0m";read -p ""
            exit
            ;;
            
        oicq)
            echo "咕咕~"
            echo "刨个坑"
            echo -en "\033[32m 未完待续 回车返回\033[0m";read -p ""
          exit
            ;;
            
        icqq)
            echo "咕咕~"
            echo "刨个坑"
            echo -en "\033[32m 未完待续 回车返回\033[0m";read -p ""
          exit
            ;;
            
        0)
        exit 0
        ;;
        
    *)
        echo "无效的选项"
        ;;

esac
done