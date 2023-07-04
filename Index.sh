#!/bin/bash

ver=0.3.6.4

echo "校验版本中"
# 检查脚本版本是否最新，如果不是则下载最新版本
version=$(curl -s https://gitee.com/Wind-is-so-strong/yz/raw/master/Deng)
if [ "$version" != "$ver" ]; then
    # 下载最新版本脚本
    curl -L --show-error --fail --retry 3 --output /usr/local/bin/d https://gitee.com/Wind-is-so-strong/yz/raw/master/Index.sh --progress-bar
    if [ $? -ne 0 ]; then
        # 下载文件失败
        echo "下载文件失败"
        exit 1
    elif [ $(stat -c %s /usr/local/bin/d) -eq 0 ]; then
        # 文件大小为零
        echo "下载文件失败或文件大小为 0"
        exit 1
    else
        # 添加执行权限
        chmod +x /usr/local/bin/d
        # 检查是否已添加到 PATH 环境变量中
        if ! type -P d &>/dev/null; then
            echo 'd 命令未添加到 $PATH 中，请手动添加。'
        else
            # 执行最新版本脚本
            d
            exit 0
        fi
    fi
else
    # 版本最新，提示用户
    clear
    echo -e "\033[32m脚本载入成功\033[0m"
    echo -e "\e[33m作者：\e[0m等风来\e[0m"
    echo -e "\e[35m项目主页：\e[0mdengfenglai.cloud"
fi

# 定义颜色变量
N="\e[0m"
G="\e[32m"
R="\e[31m"
Q="\e[36m"
L="\e[34m"
H="\e[33m"


target_file="$HOME/.Yunzai"

if [ -f "$target_file" ]; then
  echo -e "\033[32m校验成功\033[0m"
else
  echo -e "\033[33m初始化文件中\033[0m"
  sleep 0.3

  # 指定可能的文件列表，按优先级排序
  files=("/root/Yunzai-Bot" "/root/Miao-Yunzai" "/root/TRSS-Yunzai")

  # 遍历文件列表，找到存在的文件并写入目标文件
  for file in "${files[@]}"; do
    if [ -f "$file" ]; then
      echo "$file" > "$target_file"
      break
    fi
  done

  if [ ! -f "$target_file" ]; then
    rm -f "$target_file"
    # 如果都找不到，直接跳过写入留空
  fi
fi
#定义云崽路径
Yz=$(head -n 1 "${HOME}/.Yunzai")

while true
do
export NEWT_COLORS='
root=,blue
'
sese=$(whiptail \
--title "DF" \
--backtitle "脚本纯免费使用   主页官网dengfenglai.cloud   作者:等风来" \
--menu "${ver}
$Yz" \
20 40 9 \
"1" "Bot管理" \
"2" "安装管理" \
"3" "插件管理" \
"4" "报错修复" \
"5" "其他功能" \
"6" "作者信息" \
"7" "修改路径" \
"0" "退出" \
3>&1 1>&2 2>&3)

feedback=$?
if [ $feedback = 0 ];then
  #调用管理脚本
  if [[ ${sese} = 1 ]];then
   clear
if [ -d "$Yz" ];then
       admin=$(whiptail \
       --title "DF" \
       --menu "${ver}" \
       17 40 10 \
       "1" "启动Yunzai" \
       "2" "停止Yunzai" \
       "3" "后台启动Yunzai" \
       "4" "查看后台Yunzai日志" \
       "5" "重置Yunzai账号" \
       "6" "修改登录协议" \
       "7" "修改主人QQ号" \
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
             break
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
            redis-server --daemonize yes
            pnpm run login
            break
        fi

           if [[ ${admin} = 6 ]];then
           pushd $Yz
           equipment=$(whiptail \
           --title "DF" \
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
           whiptail --title "ʕ•ᴥ•ʔ……" --msgbox "
           笨比，你都没有安装云崽，快去安装吧!
           " 10 43
    fi
 fi

  #安装脚本
  if [[ ${sese} = 2 ]]; then
    clear
    install=$(whiptail \
       --title "⸜₍๑•⌔•๑₎⸝" \
       --menu "${ver}" \
       17 35 6 \
       "1" "Yunzai-Bot" \
       "2" "Miao-Yunzai" \
       "3" "频道TRSS-Yunzai" \
       "0" "返回" \
       3>&1 1>&2 2>&3 )
    
    case ${install} in
        1)
            clear
            if [ -d "$HOME/Yunzai-Bot" ]; then
                whiptail --title "等风来" --msgbox "
                您已安装云崽 禁止套娃
                " 10 43
            else
                if [ -f "/etc/redhat-release" ]; then
                    # 如果是CentOS系统
                    bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/CentOS/Yzaz.sh)
                elif [ -f "/etc/lsb-release" ]; then
                    # 如果是Ubuntu系统
                    bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/Ubuntu/Yzaz.sh)
                else
                    echo "不支持当前系统"
                    exit
                fi
            fi
            ;;
        2)
            # 获取系统发行版本的信息
            if [ -f "/etc/redhat-release" ]; then
                # 如果是CentOS系统
                bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/CentOS/Mzaz.sh)
            elif [ -f "/etc/lsb-release" ]; then
                # 如果是Ubuntu系统
                bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/Ubuntu/Mzaz.sh)
            else
                echo "不支持当前系统"
                exit
            fi
            ;;
        3)
            bash <(curl -sL gitee.com/Wind-is-so-strong/tsgp/raw/master/Tzaz.sh)
            break
            ;;
        *)
            # 退出
            ;;
    esac
fi


  #调用插件脚本
  if [[ ${sese} = 3 ]]
   then
   clear
    cha=$(whiptail \
       --title "꒰ *•ɷ•* ꒱" \
       --menu "${ver}
 $Yz" \
       17 35 6 \
       "1"  "安装plugin插件" \
       "2"  "卸载plugin插件" \
       "3"  "卸载js插件" \
       "0"  "返回" \
       3>&1 1>&2 2>&3 )
     #调用插件安装脚本
    if [[ ${cha} = 1 ]]
    then
        bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/cvs-xdm/plugins-shell.sh)
    break
    fi

    #调用卸载脚本
    if [[ ${cha} = 2 ]];then
        cd $Yz
        bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/shell/rm.sh)
    break
    fi
    
    if [[ ${cha} = 3 ]];then
    cd $Yz
        bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/shell/Uex.sh)
    fi
fi

  #调用修复脚本
  if [[ ${sese} = 4 ]];then
    clear
    if [ -d "$Yz" ];then
    bc=$(whiptail \
       --title "报错修复" \
       --menu "${ver}
$Yz" \
       17 40 5 \
       "1" "重装云崽依赖" \
       "2" "打开puppeteer chromium修复菜单" \
       "3" "打开登录错误码修复菜单" \
       "4" "重启PM2报错修复" \
       "5" "快速删除虚拟设备文件" \
       3>&1 1>&2 2>&3 )
      
        if [[ ${bc} = 1 ]];then
        rm -rf node_modules
        pnpm cache clean --force
        pnpm install
        echo -en "\033[32m 修复完成 回车返回\033[0m";read -p ""
        fi
        
        if [[ ${bc} = 2 ]];then
        clear
        cd $Yz
        echo -e "\e[1;32m正在打开Chromium修复菜单\e[0m"
        bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/shell/Chromium.sh)
        fi
        
        if [[ ${bc} = 3 ]];then
        clear
        cd $Yz
        bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/shell/EC.sh)
        fi
        
        if [[ ${bc} = 4 ]];then
        clear
        cd "$Yz"
        echo -e "\e[96m升级依赖\e[0m"
        if pnpm update; then
        clear
        echo -e "\e[96m重新安装标注文件的依赖\e[0m"
        if pnpm install -P && pnpm install -P; then
        echo -e "\e[96m全局安装PM2并更新\e[0m"
        if pnpm install pm2 -g && pm2 update; then
        echo -en "修复完成 回车返回";read -p ""
        else
        echo -en "\e[91m安装失败！回车返回\e[0m";read -p ""
        fi
        else
        echo -en "\e[91m安装失败！回车返回\e[0m";read -p ""
        fi
        else
        echo -en "\e[91m安装失败！回车返回\e[0m";read -p ""
        fi
        fi
        
        if [[ ${bc} = 5 ]];then
        clear
        cd $Yz
        if [ -d data/icqq ]; then
            rm -rf data/icqq
            else
            rm -rf data/device.json
        fi
        echo -en "删除完成 回车返回";read -p ""
     fi
     
     #未安装云崽
     else
     whiptail --title "哦呀？" --msgbox "
     请检查你是否正确安装云崽并设置脚本路径
       " 10 43
      fi
fi

  #打开其他脚本
  if [[ ${sese} = 5 ]]
  then
  clear
    qt=$(whiptail \
       --title "⸜₍๑•⌔•๑₎⸝" \
       --menu "${ver}
$Yz
功能等待添加，欢迎反馈~" \
       17 35 6 \
       "1" "安装ffmpeg" \
       "2" "安装Python 3.9.15和Poetry" \
       "3" "搭载喵喵面板图" \
       "4" "搭载涩涩面板图" \
       "5" "添加命令别名" \
       "0" "返回" \
       3>&1 1>&2 2>&3 )
#安装ffmpeg
if [[ ${qt} = 1 ]];then
clear
    bash <(curl -sL https://gitee.com/Wind-is-so-strong/ffmpeg/raw/master/ffmpeg.sh)
    break
    fi
    
    if [[ ${qt} = 2 ]];then
    clear
    bash <(curl -sL https://gitee.com/haanxuan/Python/raw/master/Python3915.sh)
    fi
    
    if [[ ${qt} = 3 ]];then
    clear
    bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/cvs-xdm/XDMGraph.sh)
    fi
    
    if [[ ${qt} = 4 ]];then
    clear
    bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/cvs-xdm/SeseGraph.sh)
    fi
    
    if [[ ${qt} = 5 ]];then
    clear
    bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/shell/Alias.sh)
    fi
    fi
    
  #帮助
  if [[ ${sese} = 6 ]]
   then
    #帮助菜单
    whiptail --title "帮助" --msgbox "
项目主页:
https://dengfenglai.cloud
作者:等风来
使用有任何问题或有功能需求可以加群:
692314526
    " 17 40 7
  fi


#自定义路径
if [[ ${sese} -eq 7 ]]; then
bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/Yz.sh)
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