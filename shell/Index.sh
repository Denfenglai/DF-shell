#!/bin/bash
ver=0.1.1
# 定义颜色变量
reset="\e[0m"
green="\e[32m"
red="\e[31m"
cyan="\e[36m"
blue="\e[34m"
yellow="\e[33m"
bold="\e[1m"

while true
do
sese=$(whiptail \
--title "涩涩🥵" \
--menu "${ver}" \
17 35 7 \
"1" "管理Yunzai-Bot" \
"2" "安装Yunzai-Bot" \
"3" "管理Yunzai插件" \
"4" "报错修复" \
"5" "帮助" \
"6" "更新脚本" \
"0" "退出" \
3>&1 1>&2 2>&3)

feedback=$?
if [ $feedback = 0 ];then
  #调用管理脚本
  if [[ ${sese} = 1 ]]
   then
   clear
   echo -e "\e[34m 校验脚本成功 \e[0m"
   echo -e "\e[32m 获取密钥成功 \e[0m"
     bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/Manage.sh)
 fi
  
  #安装脚本
  if [[ ${sese} = 2 ]]
    then
    clear
    echo -e "\e[34m 校验脚本成功 \e[0m"
    echo -e "\e[32m 获取密钥成功 \e[0m"
    bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/Yzaz.sh)
  fi
  
  #调用插件脚本
  if [[ ${sese} = 3 ]]
   then
   clear
    echo -e "\e[34m 校验脚本成功 \e[0m"
    echo -e "\e[32m 获取密钥成功 \e[0m"
      if [ -d "$HOME/Yunzai-Bot" ];then
       bash <(curl -sL https://gitee.com/haanxuan/yzai-pd/raw/master/plugins.sh)
     else
      whiptail --title "哦呀？" --msgbox "
       您好像还没有未安装云崽呢，快去安装吧!
       " 10 43
     fi
   fi
  
  #调用附加安装脚本
  if [[ ${sese} = 4 ]]
    then
    cd
    fi
  
  if [[ ${sese} = 5 ]]
   then
    #作者信息？？？
    whiptail --title "帮助" --msgbox "
    快捷命令
    前台启动:y
    后台启动:r
    重置账号:g
    查看日志:l
    停止运行:s
    " 17 40 7
  fi
  
  if [[ ${sese} = 6 ]];then
  cd
  fi
  
  #退出
  if [[ ${sese} = 0 ]]
  then
  exit 0
  fi

else
    exit
fi
done