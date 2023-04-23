#!/bin/bash

# 清屏
clear

# 添加背景和图案
cowsay -f dragon Welcome to the menu! | lolcat 

# 添加菜单选项
echo "============================"
echo "   Chromium puppeteer修复            "
echo "============================"
echo "1.  Chromium降级"
echo "2.  使用install.js"
echo "3.  使用apt包安装"
echo "4.  调用甘雨大佬的修复"
echo "5.  调用白佬的脚本"
echo "============================"
echo " 不清楚的话从上到下依次执行"
echo "      直到能用为止"
echo "什么？都用过了还不行？那就…诶嘿~"
echo "============================"
# 提示用户选择
echo "请选择一个选项 [1-5]: "

# 读取用户输入
read choice

# 根据选择执行相应的操作
case $choice in
    1)
        #强制降级
        pnpm add puppeteer@13.7.0 -w --force
        echo -e "\033[32m 修复完成 \033[0m"
        exit 0
        ;;
    2)
        #完全卸载旧版Chromium
        pnpm uninstall puppeteer
        pnpm install puppeteer@19.7.3 -w
        echo "开始使用install.js安装"
        node ./node_modules/puppeteer/install.js
        echo -e "\033[32m 修复完成 \033[0m"
        exit 0
        ;;
    3)
        echo "使用apt包安装Chromium"
        #卸载
        apt remove chromium -y
        #安装
        apt-get install chromium-browser
        echo -e "\033[32m 修复完成 \033[0m"
        exit 0
        ;;
    4)
        #简单抄白狐脚本，诶嘿
        Ubuntuv=$(lsb_release -r | awk '{print $2}')
           architecture=$(uname -m)
            if [ "$architecture" = "aarch64" ]; then
             echo -e "\033[34m 调用甘雨大佬的浏览器修复 感谢 \033[0m";
             pushd $HOME
             apt-get autoremove chromium-browser -y
             git clone --depth=1 https://gitee.com/Ganyu256/chromium
             pushd chromium
             bash install.sh
             pushd $HOME
             rm -rf chromium
             rm -rf chromium
             pushd Yunzai-Bot
             pnpm install -P
             pushd $HOME
             sed -i "13s/.*/chromium_path: \/usr\/bin\/chromium-browser/g" $HOME/Yunzai-Bot/config/config/bot.yaml
             echo;echo -en "\033[32m 修复完成 回车返回\033[0m";read -p ""
            elif [ "$architecture" = "armv8l" ]; then
             echo -e "\033[34m 调用甘雨大佬的浏览器修复 感谢 \033[0m";
             pushd $HOME
             apt-get autoremove chromium-browser -y
             git clone --depth=1 https://gitee.com/Ganyu256/chromium
             pushd chromium
             bash install.sh
             pushd $HOME
             rm -rf chromium
             rm -rf chromium
             pushd Yunzai-Bot
             pnpm install -P
             pushd $HOME
             sed -i "13s/.*/chromium_path: \/usr\/bin\/chromium-browser/g" $HOME/Yunzai-Bot/config/config/bot.yaml
             echo;echo -en "\033[32m 修复完成 回车返回\033[0m";read -p ""
            elif [ "$architecture" = "x86_64" ]; then
             if [ "$Ubuntuv" == "18.04" ]; then
             pushd Yunzai-Bot
             node ./node_modules/puppeteer/install.js
             pnpm install -P
             elif [ "$Ubuntuv" == "22.04" ]; then
             apt install snapd -y
             snap install chromium
             sed -i "13s/.*/chromium_path: \/usr\/bin\/chromium-browser/g" $HOME/Yunzai-Bot/config/config/bot.yaml
             elif [ "$Ubuntuv" == "22.10" ]; then
             apt install snapd -y
             snap install chromium
             sed -i "13s/.*/chromium_path: \/usr\/bin\/chromium-browser/g" $HOME/Yunzai-Bot/config/config/bot.yaml
             else
             pushd Yunzai-Bot
             node ./node_modules/puppeteer/install.js
             sed -i "13s/.*/chromium_path: \/usr\/bin\/chromium-browser/g" $HOME/Yunzai-Bot/config/config/bot.yaml
             fi
             echo;echo -en "\033[32m 修复完成 回车返回\033[0m";read -p ""
            else
             echo -en "\033[31m 错误: 不支持的框架 \033[0m";
             exit
            fi
        ;;
    5)
        echo "套用白狐佬的脚本，适配了Ubuntu22.04哦~"
        bash <(curl https://gitee.com/baihu433/chromium/raw/master/chromium.sh)
        ;;
#退出    
    0)
        echo -e "\033[34m 感谢您的使用！\033[34m"
        exit 0
        ;;
        
    *)
        echo "无效的选择"
        ;;
esac