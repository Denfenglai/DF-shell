#!/bin/bash

# 检测是否已安装 Node.js，如果已安装则继续执行下一条安装命令
if command -v node &> /dev/null; then
    clear
    echo "Node.js 已安装"
    sleep 2
else
    # 输出安装提示信息
    clear
    echo -e "即将安装 Node.js 18.x，请耐心等待...\n"

    # 添加 Node.js 源
    curl -sL https://rpm.nodesource.com/setup_18.x | bash -

    # 安装 Node.js
    clear
    yum install -y nodejs

    # 检测安装结果并输出相应信息
    if command -v node &> /dev/null; then
        clear
        echo -e "\033[32mNode.js 安装成功\033[0m\n"
    else
        echo -e "\033[31mNode.js 安装失败，请检查安装日志\033[0m\n"
        exit 1
    fi
fi

# 检测是否已安装 Redis，如果已安装则继续执行下一条安装命令
if command -v redis-server &> /dev/null; then
    clear
    echo "Redis 已安装"
    sleep 2
else
    # 输出安装提示信息
    clear
    echo -e "即将安装 Redis，请耐心等待...\n"

    # 安装 EPEL 源
    yum install -y epel-release

    # 替换 EPEL 源为镜像源
    sed -i "s|^#baseurl=http://download.fedoraproject.org/pub|baseurl=https://mirrors.tuna.tsinghua.edu.cn|g" /etc/yum.repos.d/epel.repo
    sed -i "s|^metalink=|#metalink=|g" /etc/yum.repos.d/epel.repo

    # 安装 Redis
    yum install -y redis

    # 启动 Redis 服务
    service redis start

    # 检测安装结果并输出相应信息
    if command -v redis-server &> /dev/null; then
        clear
        echo -e "\033[32mRedis 安装成功\033[0m\n"
    else
        echo -e "\033[31mRedis 安装失败，请检查安装日志\033[0m\n"
        exit 1
    fi
fi

# 输出安装提示信息
clear
echo -e "即将安装 Chromium，请耐心等待...\n"

# 安装 Chromium、Git、Nano
yum install -y chromium git nano

# 检测安装结果并输出相应信息
if command -v chromium &> /dev/null; then
    clear
    echo -e "\033[32mChromium安装成功\033[0m"
else
    echo -e "\033[31mChromium安装失败，请检查安装日志\033[0m"
    exit 1
fi

# 输出安装提示信息
clear
echo -e "即将安装字体，请耐心等待...\n"

# 安装字体
yum groupinstall -y fonts

# 检测安装结果并输出相应信息
if rpm -q fonts &> /dev/null; then
    clear
    echo -e "\033[32m字体安装成功\033[0m\n"
else
    echo -e "\033[31m字体安装失败，请检查安装日志\033[0m\n"
    exit 1
fi


# 克隆 Yunzai 3.0 仓库
clear
echo -e "正在克隆 Yunzai 3.0 仓库，请耐心等待...\n"
git clone --depth=1 -b main https://gitee.com/yoimiya-kokomi/Yunzai-Bot.git

# 检测克隆结果并输出相应信息
if [ -d "Yunzai-Bot" ]; then
    echo -e "\033[32mYunzai 3.0 仓库克隆成功\033[0m\n"
else
    echo -e "\033[31mYunzai 3.0 仓库克隆失败，请检查克隆日志\033[0m\n"
    exit 1
fi

# 添加 NPM 镜像源
npm config set registry https://registry.npmmirror.com

# 输出安装提示信息
clear
echo -e "即将安装 pnpm，请耐心等待...\n"

# 安装 pnpm
npm install -g pnpm

# 检测安装结果并输出相应信息
if command -v pnpm &> /dev/null; then
    echo -e "\033[32mpnpm 安装成功\033[0m\n"
else
    echo -e "\033[31mpnpm 安装失败，请检查安装日志\033[0m\n"
    exit 1
fi

# 输出安装提示信息
clear
echo -e "即将安装依赖，请耐心等待...\n"

# 安装依赖
pnpm install -P

# 检测安装结果并输出相应信息
if [ -d "node_modules" ]; then
    echo -e "\033[32m依赖安装成功\033[0m\n"
else
    echo -e "\033[31m依赖安装失败，请检查安装日志\033[0m\n"
    exit 1
fi

# 输出安装提示信息
clear
echo -e "即将删除当前版本的 puppeteer 并安装 19.11.1 版，请耐心等待...\n"

# 删除当前版本的 puppeteer 并安装 19.11.1 版
pnpm remove puppeteer
pnpm add puppeteer@19.11.1 -w

# 检测安装结果并输出相应信息
if [ -d "node_modules/puppeteer" ]; then
    echo -e "\033[32mPuppeteer 安装成功\033[0m\n"
else
    echo -e "\033[31mPuppeteer 安装失败，请检查安装日志\033[0m\n"
    exit 1
fi

if [ -e "/usr/bin/dfl" ]
           then
           echo -e "\033[34m 检测到已写入 \033[0m";
           echo "退出"
        else
           pushd $HOME 
           echo '正在写入快捷命令'
           #转到Yunzai-Bot
           echo 'cd /root/Yunzai-Bot && exec bash -i' >> /usr/local/bin/yz
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
           echo "alias l='cd /root/Yunzai-Bot && clear && echo -e \"\e[1;32m当前日志 如果没有则是没启动云崽\e[0m\" && npm run log'" >> ~/.bashrc
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
        clear
        cd ~/Yunzai-Bot
        redis-server --daemonize yes
        node app
    