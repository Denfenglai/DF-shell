#!/bin/bash
ver=0.1.7
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
"5" "错误码修复" \
"6" "帮助" \
"7" "更新脚本" \
"0" "退出" \
3>&1 1>&2 2>&3)

feedback=$?
if [ $feedback = 0 ];then
  #调用管理脚本
  if [[ ${sese} = 1 ]]
   then
   clear
   echo -e "\e[34m 校验脚本成功 \e[0m"
   echo -e "\e[32m 正在打开管理脚本 \e[0m"
     bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/Manage.sh)
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
  
  #调用修复脚本
  if [[ ${sese} = 4 ]]
    then
    clear
    echo -e "\e[1;32m正在打开修复菜单\e[0m"
    if [ -d "$HOME/Yunzai-Bot" ];then
    bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/shell/Bc.sh)
     else
     whiptail --title "哦呀？" --msgbox "
     笨比，你都没有安装云崽怎么修复啊
       " 10 43
      fi
fi

  #打开错误码修复脚本
  if [[ ${sese} = 5 ]]
  if [ -d "$HOME/Yunzai-Bot" ];then
       bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/shell/EC.sh)
     else
      whiptail --title "哼╭(╯^╰)╮" --msgbox "
       你都没有安装云崽！哪来的错误码啊！
       " 10 43
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
            whiptail --title "魅魔♡" --msgbox \
            "呜呜 被玩坏惹 肯定是网络的问题！" \ 
            8 25
            exit
        fi
        # 下载完成，随机获取一句励志名言并显示
        Aword=$(curl -s https://api.vvhan.com/api/ian) \
        whiptail --title "更新成功" --msgbox \
        "${Aword}" 
        10 50
        chmod +x /usr/local/bin/d
        rm wget.log
        exit
        d
    else
        # 版本最新，提示用户
        clear
        whiptail --title "等风来" --msgbox \
        "主人♡ 人家已经是最新了" \
        8 25
    fi
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