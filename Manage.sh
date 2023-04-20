#!/bin/bash

if [ -d "$HOME/Yunzai-Bot" ];then
       admin=$(whiptail \
       --title "管♂理菜单" \
       --menu "${ver}" \
       17 40 10 \
       "1" "启动Yunzai-Bot" \
       "2" "停止Yunzai-Bot" \
       "3" "后台启动Yunzai-Bot" \
       "4" "查看后台Yunzai-Bot日志" \
       "5" "重置Yunzai-Bot账号" \
       "6" "修改登录协议" \
       "0" "返回" \
       3>&1 1>&2 2>&3 )
          #启动
           if [[ ${admin} = 1 ]];then
              pushd ~/Yunzai-Bot
              redis-server --daemonize yes
              node app
           fi
           
           #停止
           if [[ ${admin} = 2 ]];then
              pushd ~/Yunzai-Bot
              pnpm run stop
           fi
           
           if [[ ${admin} = 3 ]];then
             pushd ~/Yunzai-Bot
             redis-server --daemonize yes
             pnpm run start
           fi
             
           if [[ ${admin} = 4 ]];then
              pushd ~/Yunzai-Bot
              pnpm run log
           fi
           
           if [[ ${admin} = 5 ]];then
           pushd ~/Yunzai-Bot
           rm $HOME/Yunzai-Bot/data/device.json
           pnpm run login
           fi
           
           if [[ ${admin} = 6 ]];then
           pushd ~/Yunzai-Bot
           equipment=$(whiptail \
           --title "♡涩涩♡" \
           --menu "请选择登录设备" \
           17 35 7 \
           "1" "安卓手机" \
           "2" "aPad" \
           "3" "安卓手表" \
           "4" "MacOS" \
           "5" "iPad[推荐]" \
           3>&1 1>&2 2>&3 )
           new="platform: ${equipment}"
           file="$HOME/Yunzai-Bot/config/config/qq.yaml"
           old_equipment="platform: [0-5]"
           new_equipment="platform: ${equipment}"
           sed -i "s/$old_equipment/$new_equipment/g" $file
           rm $HOME/Yunzai-Bot/data/device.json
           fi
           #退出
           if [[ ${admin} = 0 ]];then
               d
           fi
    else
           whiptail --title "涩批~" --msgbox "
           笨比，你都没有安装云崽，快去安装吧!
           " 10 43        
    fi
           