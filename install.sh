if ! [ "$(uname)" == "Linux" ];then
echo -e "\033[31m 请使用linux! \033[0m"
exit 0
fi
if ! [ -f /etc/lsb-release ];then
echo -e "\033[31m 请使用ubuntu! \033[0m"
exit 0
fi
if [ "$(id -u)" != "0" ]; then
echo -e "\033[31m 请使用root用户! \033[0m"
exit 0
fi
if ! [ -x "$(command -v curl)" ];then
    echo -e "\033[36m检测到未安装curl 开始安装 \033[0m";
    apt update
    apt install curl -y
fi
if ! [ -x "$(command -v wget)" ];then
    echo -e "\033[36m检测到未安装wget 开始安装 \033[0m";
    apt update
    apt install wget -y
fi
if ! [ -x "$(command -v git)" ];then
    echo -e "\033[36m检测到未安装git 开始安装 \033[0m";
    apt update
    apt install git -y
fi
if ! [ -x "$(command -v whiptail)" ]
    then
    echo -e "\033[36m检测到未安装whiptail 开始安装 \033[0m";
    apt update
    apt install whiptail -y
fi
#安装
if ! [ -e "/usr/local/bin/d" ];then
  rm -rf /usr/local/bin/d
  wget -O /usr/local/bin/d https://gitee.com/Wind-is-so-strong/yz/raw/master/shell/Index.sh >> wget.log 2>&1 &
  {
     for ((i = 0 ; i <= 100 ; i+=1)); do
        sleep 0.01s
        echo $i
     done
  } | whiptail --gauge "未安装 正在安装" 6 60 0
  sleep 0.5
  if ! [ -e "/usr/local/bin/d" ];then
  whiptail --title "等风来" --msgbox \
  "安装失败 请检查网络" \
  8 25
  exit
  fi
  chmod +x /usr/local/bin/d
  rm wget.log
  d
else
  rm -rf /usr/local/bin/d
  wget -O /usr/local/bin/d https://gitee.com/Wind-is-so-strong/yz/raw/master/shell/Index.sh >> wget.log 2>&1 &
  {
     for ((i = 0 ; i <= 100 ; i+=1)); do
        sleep 0.01s
        echo $i
     done
  } | whiptail --gauge "已安装 正在更新" 6 60 0
  if ! [ -e "/usr/local/bin/d" ];then
  whiptail --title "等风来" --msgbox \
  "安装失败 请检查网络" \
  8 25
  exit
  fi
  chmod +x /usr/local/bin/d
  rm wget.log
  d
fi
