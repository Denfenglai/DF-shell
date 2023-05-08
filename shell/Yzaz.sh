#!/bin/bash
if [ -d "$HOME/Yunzai-Bot" ];then
       whiptail --title "等风来" --msgbox "
       您已安装云崽 禁止套娃
       " 10 43
     else
       # 更新软件源和软件
        echo -e "\033[34m 更新软件源 \033[0m";
        apt update -y
        echo -e "\033[34m 更新完成 \033[0m";
        echo
        #判断是否安装了node.js
        if ! command -v node &> /dev/null
        then
        echo "Node.js 未安装"
        Ubuntuv=$(lsb_release -r | awk '{print $2}')
        until npm -v
        do
        if [ "$Ubuntuv" == "18.04" ]; then
          rm /etc/apt/sources.list.d/nodesource.list
          bash <(curl -sL https://deb.nodesource.com/setup_16.x)
        elif [ "$Ubuntuv" == "22.04" ]; then
          rm /etc/apt/sources.list.d/nodesource.list
          bash <(curl -sL https://deb.nodesource.com/setup_18.x)
        elif [ "$Ubuntuv" == "22.10" ]; then
          rm /etc/apt/sources.list.d/nodesource.list
          bash <(curl -sL https://deb.nodesource.com/setup_18.x)
        else
          rm /etc/apt/sources.list.d/nodesource.list
          bash <(curl -sL https://deb.nodesource.com/setup_16.x)
        fi
        apt remove nodejs -y
        apt autoremove -y
        apt update -y
        apt install -y nodejs
        done
        #再查一次
        if ! command -v node &> /dev/null
then
    echo -e "\e[31m node.js 安装失败！请检查网络\e[0m"
else
    echo -e "\e[32mNode.js 安装成功！\e[0m"
fi
       else
        echo "Node.js 已安装"
 fi
        
        
        #安装pnpm
        if ! command -v pnpm &> /dev/null
then
    echo "pnpm 未安装"
     echo -e "\033[34m 开始安装pnpm  \033[0m";
        npm config set registry http://registry.npm.taobao.org/
        npm install -g npm
        npm install -g pnpm
        pnpm -v
        if [ $? -ne 0 ]
        then
          echo -e "\033[34m 安装pnpm失败 请检查网络 \033[0m";
          exit
        else
          echo -e "\033[34m 安装pnpm成功 \033[0m";
        fi
        echo
else
    echo "pnpm 已安装"
fi
       # 检测是否安装了redis
dpkg -l | grep redis

# 如果没有安装，则安装redis数据库
if [ $? -ne 0 ]; then
clear
# 安装redis
echo -e ${Tip} 开始安装redis数据库
apt-get install redis -y
redis-server --daemonize yes
# 判断是否安装成功
if [ $? -eq 0 ]; then
redis-server --daemonize yes
echo -e ${Info} redis数据库 安装成功！
echo -e ${OK}
sleep 3
else
echo -e ${Error} redis安装失败
echo -e ${Tip} 请重新运行脚本
exit
 fi
fi

clear

        # 检查chromium-browser是否已安装
       clear
       if [ $(dpkg-query -W -f='${Status}' chromium-browser 2>/dev/null | grep -c "ok installed") -eq 0 ];
       then
       # 如果没有安装，则安装chromium-browser
       echo -e 开始安装谷歌浏览器
       apt install chromium-browser -y
       if [ $? -eq 0 ]; then
      #中文字体
      apt install -y fonts-wqy-microhei
      #蜜汁依赖
     apt-get install ca-certificates fonts-liberation libasound2 libatk-bridge2.0-0 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgbm1 libgcc1 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 lsb-release wget xdg-utils libxkbcommon0 -y
     echo -e "\e[32m谷歌浏览器安装成功\e[0m"
sleep 3
  else
echo -e "\e[31m谷歌浏览器安装失败\e[0m"
echo -e "\e[33m3秒后重试\e[0m"
sleep 3
  fi
else
 ：
fi

#阿里云轻量100%失败一次，那就再试试咯
clear
# 检查chromium-browser是否已安装
clear
if [ $(dpkg-query -W -f='${Status}' chromium-browser 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  # 如果没有安装，则安装chromium-browser
echo -e ${Tip} 开始安装谷歌浏览器
apt install chromium-browser -y
  if [ $? -eq 0 ]; then
  #中文字体
  apt install -y fonts-wqy-microhei
  #蜜汁依赖
  apt-get install ca-certificates fonts-liberation libasound2 libatk-bridge2.0-0 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgbm1 libgcc1 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 lsb-release wget xdg-utils libxkbcommon0 -y
echo -e ${Info} 谷歌浏览器安装成功
echo -e ${OK}
sleep 3
  else
echo -e "\e[31m谷歌浏览器安装失败\e[0m"
echo -e "\e[33m请重新运行脚本\e[0m"
exit 1
  fi
else
 ：
fi
#ffmpeg
     if [ ! -e /usr/local/bin/ ]; then
       bash <(curl -sL gitee.com/haanxuan/ffmpeg/raw/master/FFmpeg.sh)
       fi
        
        # 克隆项目
        echo -e "\033[34m 正在克隆Yunzai-Bot \033[0m";
        pushd ~/
        git clone --depth=1 https://gitee.com/yoimiya-kokomi/Yunzai-Bot
          if [ ! -d "~/Yunzai-Bot" ]
            then
              echo -e "\033[34m 克隆成功 \033[0m";
            else
              echo -e "\033[34m 克隆失败 请检查网络 \033[0m";
              exit 0
          fi
        echo
        
        #安装Yunzai依赖
        echo -e "\033[34m 安装依赖 \033[0m";
        pushd ~/Yunzai-Bot
        pnpm install -P && pnpm install -P
        
        #蜜汁22.04
ubuntu_version=$(lsb_release -r -s)

if [ "$ubuntu_version" = "22.04" ]; then
# 检查CPU架构
architecture=$(uname -m)
# 如果是ARM架构
if [ $architecture == "arm" ] || [ $architecture == "aarch64" ]; then
    echo -e "\e[1;32m  使用由 甘雨 提供的 chromium-browser_ARM64\e[0m"
    rm -rf /root/chromium
    git clone https://gitee.com/haanxuan/chromium.git ~/chromium
    bash /root/chromium/install.sh
 fi
fi
        
        #写入自动命令
        if [ -e "/usr/bin/dfl" ]
           then
           echo -e "\033[34m 检测到已写入 \033[0m";
           echo "退出"
        else
           pushd $HOME 
           echo '正在将启动写入启动命令'
           #转到云崽目录
           echo cd ~/Yunzai-Bot > /usr/bin/yz
           chmod 777 /usr/bin/yz
           #启动
           echo echo 正在启动Yunzai-Bot > /usr/bin/y
           sed -i -e '1a redis-server --daemonize yes && cd ~/Yunzai-Bot && node app' /usr/bin/y 
           chmod 777 /usr/bin/y
           #后台
           echo echo 正在启动Yunzai-Bot > /usr/bin/r
           sed -i -e '1a redis-server --daemonize yes && cd ~/Yunzai-Bot && pnpm run start' /usr/bin/r
           chmod 777 /usr/bin/r
           #日志
           echo echo 打开Yunzai-Bot日志 > /usr/bin/l
           sed -i -e '1a cd ~/Yunzai-Bot && pnpm run log' /usr/bin/l 
           chmod 777 /usr/bin/l
           #登录
           echo echo 启动Yunzai-Bot账号配置 > /usr/bin/g
           sed -i -e '1a cd ~/Yunzai-Bot && pnpm run login' /usr/bin/g
           chmod 777 /usr/bin/g
           #停止
           echo echo 正在停止Yunzai-Bot运行 > /usr/bin/s
           sed -i -e '1a cd ~/Yunzai-Bot && pnpm stop' /usr/bin/s
           chmod 777 /usr/bin/s
           echo echo 你已安装等风来脚本！感谢使用！ > /usr/bin/dfl
           chmod 777 /usr/bin/dfl
           pushd 
           echo
        fi
        echo -en "\033[32m 安装完成 回车开始登录\033[0m";read -p ""
        cd $Yz
        node app
    fi
    