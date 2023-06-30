#!/bin/bash

if [ -d "$HOME/Miao-Yunzai/plugins/miao-plugin" ];then
       whiptail --title "等风来" --msgbox "
       您已安装喵崽 请勿重复安装
       " 10 43
     exit
     fi
#定义颜色消息
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m" && H_font_prefix="\033[33m"
Info="${Green_font_prefix}[信息]${Font_color_suffix}"
Error="${Red_font_prefix}[错误]${Font_color_suffix}"
Tip="${H_font_prefix}[注意]${Font_color_suffix}"
OK="${Green_font_prefix}[OK]${Font_color_suffix}"

clear
echo 载入成功！
echo 检测为Ubuntu
echo -e "\e[1;31m如果不是请CTRL+C结束运行\e[0m"
echo -e "\e[1;32m那么接下来就开始加载啦\e[0m"
echo -e "\e[1;33m加载结束会提示主人捏\e[0m"
echo -e "\e[1;33m主人中途不要打断我喔\e[0m"
echo -e "\e[1;36m少女祈祷中...\e[0m"
echo Miao-Yunzai
sleep 6



#Git
if [ -x "$(command -v git)" ]; then
  :
else
  apt update
  apt install git -y
echo -e ${Info} Git 安装成功！
echo -e ${OK}  
fi

# 获取node版本号
node_version=$(node -v)

# 检测node版本是否在指定的版本号范围内
if [[ $node_version == v1[6-9].* ]] || [[ $node_version == v[2-9][0-9].* ]]; then
  clear
  node -v
  echo -e ${Tip} node 安装成功！
  echo -e ${OK}
else
  # 检测Ubuntu版本并选择合适的Node.js脚本URL
  ubuntu_version=$(lsb_release -r | cut -f2)
  script_url=""
  
  if [ "$ubuntu_version" == "22.04" ]; then
    script_url="https://gitee.com/haanxuan/Fork/raw/master/node19.sh"
  else
    script_url="https://gitee.com/haanxuan/Fork/raw/master/node17.sh"
  fi

  clear
  echo -e ${Tip} 开始安装 Node.js
  
  apt-get clean
  bash <(curl -sL $script_url)
  apt-get install -y nodejs

  # 检测node版本是否在安装后的指定版本号范围内
  node_version=$(node -v)
  if [[ $node_version == v1[6-9].* ]] || [[ $node_version == v[2-9][0-9].* ]]; then
    clear
    node -v
    echo -e ${Tip} Node.js 安装成功！
    echo -e ${OK}
  else
    echo -e ${Error} Node.js 安装失败
    echo -e ${Tip} 请科学一下上网方式重新运行脚本
    exit 1
  fi
fi

# 检测是否安装了 Redis
dpkg -s redis-server &> /dev/null

# 如果没有安装，则安装 Redis 数据库
if [ $? -ne 0 ]; then
  clear
  # 安装 Redis
  echo -e ${Tip} 开始安装 Redis 数据库
  apt-get install redis -y
  redis-server --daemonize yes

  # 判断是否安装成功
  if [ $? -eq 0 ]; then
    echo -e ${Info} Redis 数据库安装成功！
    echo -e ${OK}
    sleep 3
  else
    echo -e ${Error} Redis 安装失败
    echo -e ${Tip} 请重新运行脚本
    exit 1
  fi
fi

clear

# 检查chromium-browser是否已安装
if ! dpkg-query -W -f='${Status}' chromium-browser 2>/dev/null | grep -q "installed"; then
  # 安装chromium-browser
  echo -e "${Tip} 开始安装谷歌浏览器"
  apt install -y chromium-browser fonts-wqy-microhei || {
    echo -e "${Error} 谷歌浏览器安装失败，请重新运行脚本"
    exit 1
  }
  
  # 安装依赖
  apt-get install -y ca-certificates fonts-liberation libasound2 libatk-bridge2.0-0 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgbm1 libgcc1 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 lsb-release wget xdg-utils libxkbcommon0 || {
    echo -e "${Error} 依赖安装失败，请重新运行脚本"
    exit 1
  }
  
  echo -e "${Info} 谷歌浏览器安装成功"
  sleep 3
fi

#克隆喵崽项目
clear
# 检查/root/Miao-Yunzai是否存在
if [ ! -d "/root/Miao-Yunzai" ];
then
  # 如果不存在，则克隆Miao-Yunzai
echo -e ${Tip} 开始克隆喵崽免费开源项目-赞美乐神
rm -rf /var/cache/Miao-Yunzai
# git clone --depth=1 -b main https://gitee.com/Le-niao/Miao-Yunzai.git /root/Miao-Yunzai
git clone --depth=1 https://gitee.com/yoimiya-kokomi/Miao-Yunzai.git /root/Miao-Yunzai
  if [ $? -eq 0 ]; then
echo -e ${Info} 克隆成功-赞美乐神-感谢喵佬
echo -e ${OK}
sleep 3 


clear

# 安装喵喵插件
        if [ ! -d "/root/Miao-Yunzai/plugins/miao-plugin" ]; then
            echo -e "${Info} 使用 Gitee 安装喵喵插件"
            cd /root/Miao-Yunzai

            # 使用gitee克隆
            git clone --depth=1 https://gitee.com/yoimiya-kokomi/miao-plugin.git ./plugins/miao-plugin/

            # 检查是否安装成功
            if [ ! -d "/root/Miao-Yunzai/plugins/miao-plugin" ]; then
                echo -e "\e[31m克隆失败！正在切换Github克隆……\e[0m"

                # 使用github
                git clone --depth=1 https://github.com/yoimiya-kokomi/miao-plugin.git ./plugins/miao-plugin/

                # 再次检查是否安装成功
                if [ ! -d "/root/Miao-Yunzai/plugins/miao-plugin" ]; then
                    echo -e "\e[31m喵喵插件安装失败！请检查网络然后重新运行脚本！\e[0m"
                    exit 1
                fi
            fi
        fi

clear
#细节优化
echo -e ${Info} 优化设置中
echo "# qq账号
qq:
# 密码，为空则用扫码登录,扫码登录现在仅能在同一ip下进行
pwd:
# 1:安卓手机、 2:aPad 、 3:安卓手表、 4:MacOS 、 5:iPad
platform: 5" > /root/Miao-Yunzai/config/config/qq.yaml

echo "# 日志等级:trace,debug,info,warn,fatal,mark,error,off
# mark时只显示执行命令，不显示聊天记录
log_level: debug
# 群聊和频道中过滤自己的消息
ignore_self: true
# 被风控时是否尝试用分片发送
resend: true
# ffmpeg
ffmpeg_path: 
ffprobe_path: 

# chromium其他路径
chromium_path:
  
# 米游社接口代理地址，国际服用
proxyAddress: 

# 上线时给首个主人QQ推送帮助
online_msg: true
# 上线推送通知的冷却时间
online_msg_exp: 1" > /root/Miao-Yunzai/config/default_config/bot.yaml

echo "# 是否自动同意加好友 1-同意 0-不处理
autoFriend: 1
# 是否自动退群人数，当被好友拉进群时，群人数小于配置值自动退出， 默认50，0则不处理
autoQuit: 0
# 主人QQ号
masterQQ:

# 禁用私聊功能 true：私聊只接受ck以及抽卡链接（Bot主人不受限制），false：私聊可以触发全部指令，默认false
disablePrivate: false
# 禁用私聊Bot提示内容
disableMsg: "私聊功能已禁用，仅支持发送cookie，抽卡记录链接，记录日志文件"
# 私聊通行字符串
disableAdopt:
  - stoken
#白名单群，配置后只在该群生效
whiteGroup:

#黑名单群
blackGroup:
  - 453694434
  - 213938015
#黑名单qq
blackQQ:
  - 528952540" > /root/Miao-Yunzai/config/default_config/other.yaml

#这个是把云崽默认输入密码是隐藏password改成input就不会隐藏了！
file_path="/root/Miao-Yunzai/lib/config/qq.js"
search_str="type: process.platform == 'win32' ? 'Input' : 'password',"
replace_str="type: process.platform == 'win32' ? 'Input' : 'input',"

echo -e ${OK}
sleep 1.6



#切换云崽根目录
cd /root/Miao-Yunzai
node ./node_modules/puppeteer/install.js


  else
echo -e ${Error} 克隆失败-gite你都失败了？
echo -e ${Tip} 请重新运行脚本
exit
  fi
else
echo -e ${Info} 哇趣-你已经克隆过云崽了
sleep 3
fi

# 安装pnpm
clear
echo -e "${Info} 开始安装pnpm"
cd /root/Miao-Yunzai

if npm --registry=https://registry.npmmirror.com install pnpm -g; then
    echo -e "${Info} pnpm安装成功"
    echo -e "${OK}"
    sleep 3
else
    echo -e "${Error} pnpm安装失败"
    echo -e "${Tip} 请重新运行脚本"
    exit
fi

# 安装依赖
clear
echo -e "${Info} 开始安装云崽所需依赖"
cd /root/Miao-Yunzai
pnpm config set registry https://registry.npmmirror.com

        #检查CPU架构
        architecture=$(uname -m)
        # 如果是ARM架构
        if [ $architecture == "arm" ] || [ $architecture == "aarch64" ]; then
        #修改依赖项
        sed -i 's/"puppeteer": ".*"/"puppeteer": "^13.7.0"/g' /root/Yunzai-Bot/package.json
        fi
       
if pnpm install -P; then
    echo -e "${Info} 依赖安装成功"
    echo -e "${OK}"
    sleep 3
else
    echo -e "${Error} 依赖安装失败"
    echo -e "${Tip} 请重新运行脚本"
    exit
fi

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

#写入快捷命令
if [ -e "/usr/bin/m" ]
           then
           echo -e "\033[34m 检测到已写入 \033[34m";
           echo "退出"
        else
           pushd $HOME 
           echo '正在将启动写入启动命令'
           #转到目录
           echo 'cd /root/Miao-Yunzai && exec bash -i' >> /usr/bin/mz
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
    #写入路径
        if [ ! -f "/root/Yunzai-Bot" ]; then
    echo "/root/Miao-Yunzai" > /root/.Yunzai
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