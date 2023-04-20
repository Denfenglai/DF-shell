#!/bin/bash
# 定义颜色变量
reset="\e[0m"
green="\e[32m"
red="\e[31m"
cyan="\e[36m"
blue="\e[34m"
yellow="\e[33m"
bold="\e[1m"
echo -e "${cyan}"
cat << "EOF"
                                        __
        ____  ___  ____  ___  ____ ____/ /
       / __ \/ _ \/ __ \/ _ \/ __ `/ __  / 
      / /_/ /  __/ /_/ /  __/ /_/ / /_/ /  
     / .___/\___/ .___/\___/\__,_/\__,_/   
    /_/        /_/                          
EOF
echo ""
echo -e "${bold}${yellow}欢迎使用Yunzai-Bot错误修复脚本${reset}"
echo ""
echo -e "${green}请选择您要执行的操作：${reset}"
echo ""
echo -e "  ${cyan}1.${reset} 修复icqq云崽版本低（错误码45）"
echo -e "  ${cyan}2.${reset} 搭载喵喵面板图"
echo -e "  ${cyan}3.${reset} 打开白狐管理脚本"
echo -e "  ${cyan}0.${reset} 退出脚本"
echo ""
echo -e "${blue}作者：${cyan}等风来${reset}"
echo -e "更多功能 敬请期待"
echo ""
# 获取用户输入的选项
while true; do
    read -p $'\e[32m请输入选项数字：\e[0m' choice
    case $choice in
        1)
            echo -e "$正在修复icqq版本低${reset}"
            bash <(curl -sL https://gitee.com/Wind-is-so-strong/yzsh/raw/master/shell/Repair.sh)
            break
            ;;
        2)
            echo -e "${green}正在搭载喵喵面板图……${reset}"
            bash <(curl -sL https://gitee.com/Wind-is-so-strong/yzsh/raw/master/shell/Cta.sh)
            break
            ;;
        3)
            echo -e "${green}正在打开白狐脚本.${reset}"
            bash <(curl -sL https://gitee.com/baihu433/Ubuntu-Yunzai/raw/master/install.sh)
            break
            ;;
        0)
            echo -e "${green}再见旅行者~愿星空永远映射着你的位置~${reset}"
            exit 0
            ;;
        *)
            echo -e "${red}无效的选项，请重新输入。${reset}"
            ;;
    esac
done
echo ""
echo -e "${blue}感谢使用本脚本！${reset}"
echo ""