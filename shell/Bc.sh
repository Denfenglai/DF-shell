#!/bin/bash

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

cd $Yz
# 清屏
clear


# 添加菜单选项
echo "当前路径:$Yz"
echo "================================="
echo "              报错修复            "
echo "=================================
1. 修复pnpm start 报错
2. 修复缺少icqq
3. 重装云崽依赖
4. node:internal/errors:xxx报错
5. 打开puppeteer chromium修复菜单
6. 打开登录错误码修复菜单
"

# 提示用户选择
echo "请选择一个选项 [1-6]: "

# 读取用户输入
read choice

# 根据选择执行相应的操作
case $choice in
    1)
        pnpm install pm2 -w
        echo -en "\033[32m 修复完成 回车返回\033[0m";read -p ""
        ;;
    2)
        pnpm add icqq -w
        echo -en "\033[32m 修复完成 回车返回\033[0m";read -p ""
        ;;
    3)
        rm -rf node_modules
        pnpm cache clean --force
        pnpm install
        echo -en "\033[32m 修复完成 回车返回\033[0m";read -p ""
        ;;
    
    5)
#清屏
clear
        echo -e "\e[1;32m正在打开Chromium修复菜单\e[0m"
        bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/shell/Chromium.sh)
        ;;
        
        
        4)
#清屏
clear  
      pnpm config set registry https://registry.npmmirror.com
      pnpm config set puppeteer_download_host=https://registry.npmmirror.com
      pnpm install
         if [[ $? -eq 0 ]]; then
  echo "\e[1;32m恭喜你成功啦\e[0m"
  echo -en "\033[32m 修复完成 回车返回\033[0m";read -p ""
else
  echo -e "\e[1;31m什么嘛，失败了？快去百度一下你的报错吧！\e[0m"
  exit 1
         fi
         
            ;;
            
    6)
 #清屏
 clear
 echo  "正在打开……"
 bash <(curl -sL https://gitee.com/Wind-is-so-strong/yz/raw/master/shell/EC.sh)
        ;;
        
        *)
        echo "无效的选择"
        ;;
    
esac