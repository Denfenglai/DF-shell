#!/bin/bash
ver=0.1.0

while true
do
等风来=$(whiptail \
--title "涩涩" \
--menu "${ver}" \
17 35 7 \
"1" "管理Yunzai-Bot" \
"2" "安装Yunzai-Bot" \
"3" "管理Yunzai插件" \
"0" "退出" \
3>&1 1>&2 2>&3)

feedback=$?
if [ $feedback = 0 ];then
  #调用管理脚本
  if [[ ${等风来} = 1 ]]
  bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/Manage.sh)
  fi
  
  #调用安装脚本
  if [[ ${等风来} = 2 ]]
  bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/Yzaz.sh)
  fi
  
  #套用XDM脚本
  if [[ ${等风来} = 3 ]]
  XxxX=$(whiptail \
--title "《Yunzai-Bot-V3-插件管理》" \
--menu "$Love" \
10 50 3 \
"1" "安装插件" \
"2" "删除插件" \
"3" "查看已安装的插件" \
3>&1 1>&2 2>&3)

# 判断用户是否选择了菜单中的选项
x=$?
if [ $x = 0 ]
then
# 根据用户的选择执行相应的操作
    case $XxxX in
        1)
        clear
echo -e "\e[1;32m少女祈祷中..\e[0m"        
bash <(curl -sL https://gitee.com/haanxuan/yzai-pd/raw/master/plugins.sh)
exit
            ;;
        2)
        clear
echo -e "\e[1;32m少女祈祷中..\e[0m"
bash <(curl -sL https://gitee.com/haanxuan/yzai-pd/raw/master/Splugins.sh)
exit
            ;;
        3)  
        clear
echo -e "\e[1;32m少女祈祷中..\e[0m"
bash <(curl -sL https://gitee.com/haanxuan/yzai-pd/raw/master/lsplugins.sh)
exit
            ;;            
    esac
fi 
  d
exit
            ;;
    fi
    
if [[ ${等风来} = 0 ]]
exit 0
fi
fi
     