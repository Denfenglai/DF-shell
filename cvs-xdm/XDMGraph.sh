#!/bin/bash

#必须用root
if [[ $EUID != 0 ]];then
clear
echo -e "\033[31m 当前不是root用户，必须更换root用户才能用。\033[0m\n"
exit
else
clear
echo -e "\033[36m 你好旅行者，少女为你祈福..\033[0m\n"
sleep 1.6
fi

#定义颜色消息
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m" && H_font_prefix="\033[33m"
Info="${Green_font_prefix}[信息]${Font_color_suffix}"
Error="${Red_font_prefix}[错误]${Font_color_suffix}"
Tip="${H_font_prefix}[注意]${Font_color_suffix}"
OK="${Green_font_prefix}[OK]${Font_color_suffix}"

#初始化加载
if [ -f "$HOME/.Yunzai" ]; then
  echo -e "\033[32m校验成功\033[0m"
else
  echo -e "\033[33m初始化文件中\033[0m"
  sleep 0.3
  echo "/root/Yunzai-Bot" > "$HOME/.Yunzai"
fi
#定义云崽路径
Yz=$(head -n 1 "${HOME}/.Yunzai")
    
# 检查$Yz/plugins/miao-plugin是否存在
if [ -e "$Yz/plugins/miao-plugin/resources/profile" ]; then
 :
else
clear
    echo -e ${Error} $Yz/plugins/miao-plugin/resources/profile不存在
    echo -e ${Tip} 请检查是否安装了【喵喵插件】
    echo -e ${Info} 如果已经安装成功运行
    echo -e ${Info} 请加入交流群453694434询问
    exit
fi

# 检测是否安装了whiptail
# 首先，使用which命令查找whiptail的位置
which whiptail > /dev/null 2>&1
# 如果返回值为0，则表示whiptail已安装
if [ $? -eq 0 ]; then
    :
else
    apt install whiptail -y
    yum install whiptail -y
fi

# 使用whiptail命令创建菜单
XxxX=$(whiptail \
--title "《Yunzai-Bot-V3-Bot 载入喵喵面板图》" \
--menu "$miao" \
10 50 2 \
"1" "载入面板图" \
"2" "更新面板图" \
3>&1 1>&2 2>&3)

# 判断用户是否选择了菜单中的选项
x=$?
if [ $x = 0 ]
then
# 根据用户的选择执行相应的操作
    case $XxxX in
    1)
 clear
    echo -e "\e[1;36m少女祈祷中..\e[0m"
cd $Yz/plugins/miao-plugin/resources/profile
echo -e ${Info} 开始拉取面板图资源
git clone https://gitee.com/haanxuan/miao-PAN.git
echo -e ${Info} 已将面板图拉取至本地
echo -e ${OK}

echo -e ${Info} 开始载入角色面板图
echo -e ${Tip} 过程不会有进度提示
echo -e ${Info} 请耐心等待
mv $Yz/plugins/miao-plugin/resources/profile/miao-PAN/normal-character/* $Yz/plugins/miao-plugin/resources/profile/normal-character/
echo -e ${Info} 已载入角色面板图
echo -e ${OK}

echo -e ${Info} 开始载入彩蛋面板图
echo -e ${Tip} 过程不会有进度提示
echo -e ${Info} 请耐心等待
mv $Yz/plugins/miao-plugin/resources/profile/miao-PAN/super-character/* $Yz/plugins/miao-plugin/resources/profile/super-character/
echo -e ${Info} 已载入彩蛋面板图
echo -e ${OK}
exit
    ;;

    2)
 clear    
cd $Yz/plugins/miao-plugin/resources/profile/miao-PAN
echo -e ${Info} 开始拉取面板图资源
git fetch --all
git reset --hard origin/master
git clean -f
echo -e ${Info} 已将面板图拉取至本地
echo -e ${OK}

echo -e ${Info} 开始载入角色面板图
echo -e ${Tip} 过程不会有进度提示
echo -e ${Info} 请耐心等待
cp -r $Yz/plugins/miao-plugin/resources/profile/miao-PAN/normal-character/* $Yz/plugins/miao-plugin/resources/profile/normal-character/ && rm -rf $Yz/plugins/miao-plugin/resources/profile/miao-PAN/normal-character
echo -e ${Info} 已载入角色面板图
echo -e ${OK}

echo -e ${Info} 开始载入彩蛋面板图
echo -e ${Tip} 过程不会有进度提示
echo -e ${Info} 请耐心等待
cp -r $Yz/plugins/miao-plugin/resources/profile/miao-PAN/super-character/* $Yz/plugins/miao-plugin/resources/profile/super-character/ && rm -rf $Yz/plugins/miao-plugin/resources/profile/miao-PAN/super-character
echo -e ${Info} 已载入彩蛋面板图
echo -e ${OK}
exit
    ;;
    esac
fi