#!/bin/bash

# 清屏
clear

if [ ! -d "lib" ]; then
  echo -e "\033[31m请在 Yunzai 根目录下执行该脚本\033[0m"
  exit 1
fi

# 添加菜单选项
echo "================================"
echo "   Chromium puppeteer修复            "
echo "================================"
echo "0.  安装中文字体"
echo "1.  Chromium降级"
echo "2.  使用install.js"
echo "3.  使用apt包安装"
echo "4.  调用甘雨大佬的修复"
echo "5.  使用白狐的脚本"
echo "================================"
echo "     请优先尝试1和5选项"
echo -e "\e[33m    作者：\e[0m等风来"
echo -e "\e[36m    项目主页:\e[0mdengfenglai.cloud"
echo "================================"
# 提示用户选择
echo "请选择一个选项 [0-5]: "

# 读取用户输入
read choice

# 根据选择执行相应的操作
case $choice in
  
        0)
        #只支持ubuntu啊
        if [ "$(uname -s)" != "Linux" ] || [ "$(lsb_release -is)" != "Ubuntu" ]; then
        echo -e "\033[31m此脚本只能在 Ubuntu 系统上运行。\033[0m"
        exit 1
        fi
    
        #安装浏览器中文字体
        echo "正在使用apt安装中文字体"
        apt install -y fonts-wqy-microhei 
        echo "字体安装成功！"
        # 清屏
        sleep 2
        clear
        #蜜汁依赖
        echo "使用apt安装依赖"
        apt-get install ca-certificates fonts-liberation libasound2 libatk-bridge2.0-0 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgbm1 libgcc1 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 lsb-release wget xdg-utils libxkbcommon0 -y
        echo -n "修复完成 回车返回";read -p ""
           ;;
           
        1)
        #强制降级
        npm stop
        pnpm run stop
        pnpm add puppeteer@13.7.0 -w --force
        echo -en "修复完成 回车返回";read -p ""
        ;;
    2)
        #完全卸载旧版Chromium
        
        npm stop
        pnpm uninstall puppeteer
        pnpm install puppeteer@19.7.3 -w
        echo "开始使用install.js安装"
        node ./node_modules/puppeteer/install.js
        echo -en "修复完成 回车返回";read -p ""
        ;;
    3)
        
        echo "使用apt包安装Chromium"
        #卸载
        npm stop
        apt remove chromium -y
        #安装
        apt-get install chromium-browser
        echo -e "修复完成"
        exit 0
        ;;
    4)

    if [ "$(uname -s)" != "Linux" ] || [ "$(lsb_release -is)" != "Ubuntu" ]; then
    echo "\033[31m此脚本只能在 Ubuntu 系统上运行。\033[0m"
    exit 1
    fi
        #简单抄白狐脚本，诶嘿
        Ubuntuv=$(lsb_release -r | awk '{print $2}')
           architecture=$(uname -m)
            if [ "$architecture" = "aarch64" ]; then
             echo -e "\033[34m 调用甘雨大佬的浏览器修复 感谢 \033[0m";
             pushd 
             apt-get autoremove chromium-browser -y
             git clone --depth=1 https://gitee.com/Ganyu256/chromium
             pushd chromium
             bash install.sh
             pushd 
             rm -rf chromium
             rm -rf chromium
             pushd $Yz
             pnpm install -P
             pushd 
             sed -i "13s/.*/chromium_path: \/usr\/bin\/chromium-browser/g" $Yz/config/config/bot.yaml
             echo;echo -en "\033[32m 修复完成 回车返回\033[0m";read -p ""
            elif [ "$architecture" = "armv8l" ]; then
             echo -e "\033[34m 调用甘雨大佬的浏览器修复 感谢 \033[0m";
             pushd 
             apt-get autoremove chromium-browser -y
             git clone --depth=1 https://gitee.com/Ganyu256/chromium
             pushd chromium
             bash install.sh
             pushd 
             rm -rf chromium
             rm -rf chromium
             pushd $Yz
             pnpm install -P
             pushd 
             sed -i "13s/.*/chromium_path: \/usr\/bin\/chromium-browser/g" $Yz/config/config/bot.yaml
             echo;echo -en "\033[32m 修复完成 回车返回\033[0m";read -p ""
            elif [ "$architecture" = "x86_64" ]; then
             if [ "$Ubuntuv" == "18.04" ]; then
             pushd $Yz
             node ./node_modules/puppeteer/install.js
             pnpm install -P
             elif [ "$Ubuntuv" == "22.04" ]; then
             apt install snapd -y
             snap install chromium
             sed -i "13s/.*/chromium_path: \/usr\/bin\/chromium-browser/g" $Yz/config/config/bot.yaml
             elif [ "$Ubuntuv" == "22.10" ]; then
             apt install snapd -y
             snap install chromium
             sed -i "13s/.*/chromium_path: \/usr\/bin\/chromium-browser/g" $Yz/config/config/bot.yaml
             else
             pushd $Yz
             node ./node_modules/puppeteer/install.js
             sed -i "13s/.*/chromium_path: \/usr\/bin\/chromium-browser/g" $Yz/config/config/bot.yaml
             fi
             echo;echo -en "\033[32m 修复完成 回车返回\033[0m";read -p ""
            else
             echo -en "\033[31m 错误: 不支持的框架 \033[0m";
             exit
            fi
        ;;
    5)
   if [ "$(uname -s)" != "Linux" ] || [ "$(lsb_release -is)" != "Ubuntu" ]; then
   echo "此脚本只能在 Ubuntu 系统上运行。"
   exit 1
  fi
        echo "套用白狐佬的脚本，适配了Ubuntu22.04哦~"
        npm stop
        bash <(curl https://gitee.com/baihu433/chromium/raw/master/chromium.sh)
       echo -en "修复完成 回车返回";read -p ""
       ;;


        6)
            echo "拉取仓库"
            cd
            rm -rf chromium
            git clone https://gitee.com/Ganyu256/chromium.git
            cd chromium
            echo "启动修复"
            bash install.sh
            cd
            rm -rf chromium
            ;;
        
    *)
        echo "无效的选择"
        ;;
esac