#!/bin/bash

ver=0.1.9

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

while true
do
sese=$(whiptail \
--title "(⑅˃◡˂⑅)" \
--menu "${ver}
当前路径: $Yz" \
20 40 9 \
"1" "管理Yunzai-Bot" \
"2" "安装Yunzai-Bot" \
"3" "管理Yunzai插件" \
"4" "报错修复" \
"5" "错误码修复" \
"6" "帮助" \
"7" "更新脚本" \
"8" "修改脚本路径" \
"0" "退出" \
3>&1 1>&2 2>&3)

feedback=$?
if [ $feedback = 0 ];then
  #调用管理脚本
  if [[ ${sese} = 1 ]]
   then
   clear
if [ -d "$Yz" ];then
       admin=$(whiptail \
       --title "⚆_⚆？" \
       --menu "${ver}" \
       17 40 10 \
       "1" "启动Yunzai-Bot" \
       "2" "停止Yunzai-Bot" \
       "3" "后台启动Yunzai-Bot" \
       "4" "查看后台Yunzai-Bot日志" \
       "5" "重置Yunzai-Bot账号" \
       "6" "修改登录协议" \
       "7" "修改主人QQ号୧꒰•̀ᴗ•́꒱୨" \
       "0" "返回" \
       3>&1 1>&2 2>&3 )
          #启动
           if [[ ${admin} = 1 ]];then
              pushd $Yz
              redis-server --daemonize yes
              npm stop
              node app
              break
           fi

           #停止
           if [[ ${admin} = 2 ]];then
              pushd $Yz
              pnpm run stop
              echo -e "$G Yunzai-BOT已停止运行 $N"
              break
           fi

           if [[ ${admin} = 3 ]];then
             pushd $Yz
             redis-server --daemonize yes
             npm stop
             pnpm run start
             echo -e "$G Yunzai-BOT已在后台运行 $N"
           fi

           #显示后台日志
           if [[ ${admin} = 4 ]];then
              clear
              echo -e "$Q 正在打开Yunzai-BOT后台日志"
              echo -e "$Q没有则是没有运行，请先后台运行再查看$N"
              pushd $Yz
              pnpm run log
           break
           fi

           #重置登录
           if [[ ${admin} = 5 ]];then
           pushd $Yz
           npm stop
    #删除虚拟设备信息
        if [ -d data/icqq ]; then
       rm -rf data/icqq
  else
       rm -rf data/device.json
fi
           pnpm run login
           fi

           if [[ ${admin} = 6 ]];then
           pushd $Yz
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
           file="$Yz/config/config/qq.yaml"
           old_equipment="platform: [0-5]"
           new_equipment="platform: ${equipment}"
           sed -i "s/$old_equipment/$new_equipment/g" $file
           rm $HOME/Yunzai-Bot/data/device.json
           fi
           #修改主人QQ
           if [[ ${admin} = 7 ]];then
             qq=$(whiptail \
             --title "修改主人QQ号୧꒰•̀ᴗ•́꒱୨" \
             --inputbox "请输入您要更改后的主人qq号" \
             10 60 \
             3>&1 1>&2 2>&3)

             if [[ $qq =~ ^[0-9]+$ ]]; then
             if [ $qq -gt 9999 ]; then
                 sed -i '7s/.*/'" - $qq"'/' $Yz/config/config/other.yaml
                 whiptail --title "修改成功ε٩(๑> ₃ <)۶з" --msgbox \
                 "主人QQ已更改为${qq}" \
                 10 60
               else
                 echo -e "\033[31m 请输入正确的QQ号！\033[0m"
                 exit
             fi
               else
                 echo -e "\033[31m 请输入正确的QQ号！\033[0m"
                 exit
             fi
           fi
           #退出
           if [[ ${admin} = 0 ]];then
               d
           fi
    else
           whiptail --title "没有找到Yunzai-Botʕ•ᴥ•ʔ……" --msgbox "
           笨比，你都没有安装云崽，快去安装吧!
           " 10 43
    fi
 fi

  #安装脚本
  if [[ ${sese} = 2 ]]
    then
    clear
    echo -e "\e[34m 校验脚本成功 \e[0m"
    echo -e "\e[32m 正在打开安装脚本 \e[0m"
    bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/Yzaz.sh)
  fi

  #调用插件脚本
  if [[ ${sese} = 3 ]]
   then
   clear
    cha=$(whiptail \
       --title "꒰ *•ɷ•* ꒱" \
       --menu "${ver}
       当前路径: $Yz" \
       17 30 5 \
       "1"  "安装插件" \
       "2"  "卸载插件" \
       "0"  "返回" \
       3>&1 1>&2 2>&3 )
     #调用插件安装脚本
    if [[ ${cha} = 1 ]]
    then
        bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/cvs-xdm/plugins-shell.sh)
    break
    fi

    #调用卸载脚本
    if [[ ${cha} = 2 ]]
    then
        bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/cvs-xdm/Splugin.sh)
    break
    fi
   fi

  #调用修复脚本
  if [[ ${sese} = 4 ]]
    then
    clear
    echo -e "\e[1;32m正在打开修复菜单\e[0m"
    if [ -d "$Yz" ];then
    bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/shell/Bc.sh)
     else
     whiptail --title "哦呀？" --msgbox "
     笨比，你都没有安装云崽怎么修复啊
       " 10 43
      fi
fi

  #打开错误码修复脚本
  if [[ ${sese} = 5 ]]
  then
  if [ -d "$Yz" ];then
       bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/shell/EC.sh)
     else
      whiptail --title "哼╭(╯^╰)╮" --msgbox "
       你都没有安装云崽！哪来的错误码啊！
       " 10 43
     fi
fi

  if [[ ${sese} = 6 ]]
   then
    #帮助菜单
    whiptail --title "帮助" --msgbox "
    快捷命令
    前台启动:y
    后台启动:r
    重置账号:g
    查看日志:l
    停止运行:s
    打开脚本:d
    " 17 40 7
  fi

  if [[ ${sese} = 7 ]]; then
    # 如果环境不存在，则下载等风来脚本
    if [ ! -f "/usr/local/bin/d" ]; then
    clear
        wget -O /usr/local/bin/d https://gitee.com/Wind-is-so-strong/yz/raw/master/shell/Index.sh >> wget.log 2>&1
        # 显示下载进度条
        {
            for ((i = 0 ; i <= 100 ; i+=1)); do
                sleep 0.01s
                echo $i
            done
        } | whiptail --gauge "检测到新版本 正在更新" 6 60 0
        if ! [ -e "/usr/local/bin/d" ]; then
            # 下载失败，提示用户并退出
            whiptail --title "等风来" --msgbox
            "安装失败 请检查网络"
            8 25
            exit
        fi
        chmod +x /usr/local/bin/d
        rm wget.log
        d
    fi

    # 检查脚本版本是否最新，如果不是则下载最新版本
    version=$(curl -s https://gitee.com/Wind-is-so-strong/yz/raw/master/shell/Deng.sh)
    clear
    if [ "$version" != "$ver" ]; then
        rm -rf /usr/local/bin/d
        wget -O /usr/local/bin/d https://gitee.com/Wind-is-so-strong/yz/raw/master/shell/Index.sh >> wget.log 2>&1 &
        # 显示下载进度条
        {
            for ((i = 0 ; i <= 100 ; i+=1)); do
                sleep 0.01s
                echo $i
            done
        } | whiptail --gauge "有新版本辣 正在更新！" 6 60 0
        if ! [ -e "/usr/local/bin/d" ]; then
            # 下载失败，提示用户并退出
            whiptail --title "❛‿˂̵✧" --msgbox \
            "呜呜 被玩坏惹 肯定是网络的问题！" \
            8 25
            exit
        fi
        d
    else
        # 版本最新，提示用户
        clear
        whiptail --title "等风来" --msgbox \
        "主人♡ 人家已经是最新了" \
        8 25
    fi
fi

#自定义路径
if [[ ${sese} -eq 8 ]]; then
bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/shell/Yz.sh)
break
fi

#退出
  if [[ ${sese} = 0 ]]
  then
  clear
  echo "感谢使用🙏"
  exit 0
  fi

else
    exit
    fi
    done