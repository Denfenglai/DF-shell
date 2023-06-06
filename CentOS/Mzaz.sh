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
echo -e "正在克隆 Miao-Yunzai 仓库，请耐心等待...\n"
git clone --depth=1 https://gitee.com/yoimiya-kokomi/Miao-Yunzai.git

# 检测克隆结果并输出相应信息
if [ -d "Miao-Yunzai" ]; then
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

if [ -e "/usr/bin/m" ]
           then
           echo -e "\033[34m 检测到已写入 \033[34m";
           echo "退出"
        else
           pushd $HOME 
           echo '正在将启动写入启动命令'
           #转到目录
           echo 'cd /root/Miao-Yunzai && exec bash -i' >> /usr/local/bin/mz
           chmod 777 /usr/bin/mz
           #启动
           echo echo 正在启动Miao-Yunzai > /usr/bin/m
           sed -i -e '1a redis-server --daemonize yes && cd ~/Miao-Yunzai && npm stop && clear && node app' /usr/bin/m
           chmod 777 /usr/bin/m
           #后台
           echo echo 后台启动Miao-Yunzai > /usr/bin/mr
           sed -i -e '1a redis-server --daemonize yes && cd ~/Miao-Yunzai && clear && pnpm run start && echo -e "Miao-Yunzai已在后台运行"' /usr/bin/mr
           chmod 777 /usr/bin/mr
           #日志
           echo echo 打开Miao-Yunzai日志 > /usr/bin/ml
           sed -i -e '1a cd ~/Miao-Yunzai && clear && echo "当前日志 没有则是没有启动" && pnpm run log' /usr/bin/ml 
           chmod 777 /usr/bin/ml
           #登录
           echo echo 启动Miao-Yunzai账号配置 > /usr/bin/mg
           sed -i -e '1a cd ~/Miao-Yunzai && clear && pnpm run login' /usr/bin/mg
           chmod 777 /usr/bin/mg
           #停止
           echo echo 正在停止Miao-Yunzai运行 > /usr/bin/ms
           sed -i -e '1a cd ~/Miao-Yunzai && pnpm stop && clear && echo Miao-Yunzai已停止运行' /usr/bin/ms
           chmod 777 /usr/bin/ms
        fi

#哇趣
clear
echo -e "\e[1;32m恭喜主人 已经加载完啦\e[0m"
echo -e "\e[1;36m快捷指令:
转到喵崽目录:\e[0m\e[32m mz \e[0m
\e[1;36m前台启动:\e[0m \e[32mm\e[0m
\e[1;36m后台启动:\e[0m \e[32mmr\e[0m
\e[1;36m打开日志:\e[0m\e[32mml\e[0m
\e[1;36m重置登录:\e[0m\e[32m mg\e[0m
\e[1;36m停止运行:\e[0m\e[32m ms \e[0m"
echo -e "\e[36m主人可以通过 “脚本-修改脚本路径” 切换要管理的目录\e[0m"
exit 0
