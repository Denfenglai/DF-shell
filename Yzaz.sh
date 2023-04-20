#!/bin/bash
if [ -d "$HOME/Yunzai-Bot" ];then
       whiptail --title "白狐≧▽≦" --msgbox "
       您已安装云崽 禁止套娃
       " 10 43
     else
       # 更新软件源和软件
        echo -e "\033[34m 更新软件源 \033[0m";
        apt update -y
        echo -e "\033[34m 更新完成 \033[0m";
        echo

        # 安装nodejs
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
        
        #安装pnpm
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
        
        # 安装并运行redis
        echo -e "\033[34m 安装redis \033[0m";
        apt-get install redis-server -y
        redis-server --daemonize yes
        echo '安装redis完成';
        echo

        # 安装chromium
        echo -e "\033[34m 安装chromium \033[0m";
        apt install chromium-browser -y
        echo '安装chromium完成';
        echo
        
        #安装中文字体
        apt install -y fonts-wqy-microheiapt-get install -y fonts-wqy-microhei fonts-wqy-zenhei

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
        #写入自动命令
        if [ -e "/usr/bin/dfl" ]
           then
           echo -e "\033[34m 检测到已写入 \033[34m";
           echo "退出"
        else
           pushd $HOME 
           echo '正在将启动写入启动命令'
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
    fi
    