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
    echo -e ${Info} 请加入交流群询问
    exit
fi

clear
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
sese=$(whiptail \
--title "《Yunzai-Bot-V3-Bot 载入涩涩面板图》" \
--menu "$miao" \
10 50 2 \
"1" "载入面板图" \
"2" "更新面板图" \
3>&1 1>&2 2>&3)

feedback=$?
if [ $feedback = 0 ];then
  if [[ ${sese} = 1 ]];then 
    clear
    echo -e "\e[31m使用须知:\e[0m
=========================================================\e[0m
地址:https://github.com/Denfenglai/Miao-Character\e[0m
\e[1;34m涩涩面板图是18+的\e[0m
\e[1;34m也就是腾讯的规则的不允许的！\e[0m
\e[1;33m写这个脚本的目的就是为群友们准备的\e[0m
\e[1;33m但是可以通过禁止获取原图来减少封号的概率\e[0m
\e[1;35m本人平时使用这个面板图目前没有出现过冻结和封号\e[0m
\e[1;31m使用过程中有任何问题需自行承担\e[0m
=========================================================\e[0m
    "
    echo -e "\e[32m继续使用请输入（我已阅读并同意）\e[0m"
    echo -e "\e[32m括号里的4个中文\e[0m"

    function main() {
      read -p "输入内容后回车执行:" num
      case "${num}" in

        我已阅读并同意|y|yes)
          #拉取到本地面板图
          cd "$Yz/plugins/miao-plugin/resources/profile"
          echo -e "\e[32m开始拉取面板图资源\e[0m"
          echo -e "\e[32m由于gitee的规则，面板图是由github存放\e[0m"
          echo -e "\e[32m如果出现无法连接，请科学一下你的上网方式\e[0m"
          sleep 0.5
          git clone --depth=1 https://github.com/Denfenglai/Miao-Character.git       
          if [ -d Miao-Character ]; then
            echo -e "\e[32m拉取成功\e[0m"
            sleep 0.5

            echo -e "\e[32m开始载入角色面板图\e[0m"
            echo -e "\e[34m过程不会有进度提示\e[0m"
            echo -e "\e[32m请耐心等待\e[0m"
            mv "$Yz/plugins/miao-plugin/resources/profile/Miao-Character/normal-character/*" "$Yz/plugins/miao-plugin/resources/profile/normal-character/"
            echo -e "\e[32m已载入角色面板图\e[0m"

            echo -e "\e[32m正在修改喵喵设置禁止获取原图……\e[0m"
            cd "$Yz"
            sed -i 's/export const originalPic = 3/export const originalPic = 0/g' plugins/miao-plugin/config/cfg.js
            echo -e "\e[32m修改成功！如果设置未生效请对机器人发烧#喵喵设置原图0\e[0m"

            echo -e "\e[32m安装完成，快去和群友们开银趴吧！\e[0m"
            exit 0
          
          else
            echo "\e[31mMiao-Character 目录不存在，请尝试科学一下你的上网方式\e[0m"
            exit 1
          fi
          ;;

        *)
          clear
          echo -e "\e[1;31m
  *           *
    *       *
      *   *
        *
      *     *
    *         *
  *             *
  \e[0m"
          echo -e "\e[1;32m感谢使用 再会~\e[0m"
          exit   
          ;;
        
      esac
    }

    main
  elif [[ ${sese} = 2 ]];then
clear    
cd $Yz/plugins/miao-plugin/resources/profile/normal-character
echo -e ${Info} 开始拉取面板图资源
git fetch --all
git reset --hard origin/master
git clean -f
echo -e ${Info} 已将面板图拉取至本地
echo -e ${OK}

echo -e ${Info} 开始载入角色面板图
echo -e ${Tip} 过程不会有进度提示
echo -e ${Info} 请耐心等待
cp -r $Yz/plugins/miao-plugin/resources/profile/Miao-Character/normal-character/* $Yz/plugins/miao-plugin/resources/profile/normal-character/ && rm -rf $Yz/plugins/miao-plugin/resources/profile/Miao-Character/normal-character
echo -e ${Info} 已载入角色面板图
echo -e ${OK}
fi
fi