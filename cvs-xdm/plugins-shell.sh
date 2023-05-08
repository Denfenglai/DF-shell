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
    #感谢Xx提供宝贵的cv资源
if [ -d "$Yz/plugins" ]; then
    :
else
clear
    echo 安装插件
    echo -e "\e[1;31m$Yz/plugins文件夹不存在\e[0m"
    echo -e "\e[1;33m请先安装云崽本体\e[0m"
    exit   
fi

clear

#必须用root
if [[ $EUID != 0 ]];then
echo -e "\e[31m 当前不是root用户，必须更换root用户才能用。\e[0m\n"
exit
else
echo -e "\e[36m 你好旅行者，少女为你祈福..\e[0m\n"
fi

clear

#多选菜单示例
echo -e "\e[1;32mYzai-V3 安装插件\e[0m"
echo -e "\e[1;33m更多插件请自己查看插件库\e[0m"
echo -e "\e[1;36mhttps://gitee.com/yhArcadia/Yunzai-Bot-plugins-index\e[0m"
echo -e "—————————————————————————————————————————————"
echo -e "当前插件安装路径:\e[33m$Yz\e[0m"
echo -e "—————————————————————————————————————————————
 输入（\e[33m全部安装\e[0m）即可安装以下全部插件
 输入（\e[33mVits\e[0m）即可安装AI语音本地合成（AMD）
  \e[31mX\e[0m.卸载插件
  \e[33m0\e[0m.退出脚本
  \e[36m1\e[0m.返回脚本主页菜单
  \e[32m2\e[0m.喵喵插件   \e[32m3\e[0m.锅巴插件    \e[32m4\e[0m.逍遥插件
  \e[32m5\e[0m.土块插件   \e[32m6\e[0m.闲心插件    \e[32m7\e[0m.椰奶插件
  \e[32m8\e[0m.抽卡插件   \e[32m9\e[0m.戏天插件   \e[32m10\e[0m.小飞插件
 \e[32m11\e[0m.麟lin插件 \e[32m12\e[0m.小雪插件   \e[32m13\e[0m.止水插件
 \e[32m14\e[0m.虚空插件  \e[32m15\e[0m.冰祈插件   \e[32m16\e[0m.成就插件       
 \e[32m17\e[0m.碎月插件  \e[32m18\e[0m.榴莲插件   \e[32m19\e[0m.白纸插件
 \e[32m20\e[0m.小月插件  \e[32m21\e[0m.l-pugin    \e[32m22\e[0m.图鉴（Atlas）
 \e[32m23\e[0m.修仙插件  \e[32m24\e[0m.小叶插件   \e[32m25\e[0m.自动化插件
 \e[32m26\e[0m.千羽插件  \e[32m27\e[0m.清凉图插件 \e[32m28\e[0m.ap绘图插件
 \e[32m29\e[0m.枫叶插件  \e[32m30\e[0m.脆脆鲨插件 \e[32m31\e[0m.光遇插件
 \e[32m32\e[0m.娱乐插件  \e[32m33\e[0m.windoge    \e[32m34\e[0m.拓展插件
 \e[32m35\e[0m.屁股肉插件\e[32m36\e[0m.WeLM插件   \e[32m37\e[0m.半柠檬插件
 \e[32m38\e[0m.Py插件    \e[32m39\e[0m.FanSky_Qs  \e[32m40\e[0m.崩铁插件 
 \e[32m41\e[0m.阿尔萌插件 \e[32m42\e[0m.阴天插件  \e[32m43\e[0m.ChatGPT插件
—————————————————————————————————————————————"
echo -e "\e[1;32m有颜色的就是编号\e[0m" 数字 中文 英文
echo -e "\e[1;36m可以同时选择多个编号\e[0m"
echo -e "\e[1;33m用空格来分开输入\e[0m"
while true; do
  read -p "请输入对应的编号:" Actions
  for Action in $Actions; do
    case $Action in
        0)
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
echo -e "\e[1;32m 感谢使用 再会~\e[0m"       
        exit
        ;;
#———————————————————————————————————————————————————————————————        
        安装全部|全部安装)
        clear
echo -e "\e[1;31m唉？你这小孩  你被骗啦！\e[0m"
echo -e "\e[1;33m不准偷懒喔！\e[0m"
echo -e "\e[1;32m自己手动输入需要安装插件的对应编号吧~\e[0m"
echo -e "\e[1;36m建议加入QQ交流群453694434让大家笑笑你 嘻嘻\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        Vits|vits|VITS)
        clear
echo -e "\e[1;32m  少女祈祷中..\e[0m"
bash <(curl -sL gitee.com/haanxuan/Vits/raw/master/Vits.sh)
	    exit
        ;;                      
#———————————————————————————————————————————————————————————————
      TRSS|trss)
clear
         cd $Yz
	    echo -e "\e[1;32m开始执行TRSS Yunzai Plugin安装命令.\e[0m"
git clone https://gitee.com/TimeRainStarSky/TRSS-Plugin.git ./plugins/TRSS-Plugin/        
         echo -e "\e[1;32mTRSS Yunzai Plugin安装成功.\e[0m"
         echo -e "\e[1;32m开始执行TRSS依赖安装命令\e[0m"
         pnpm i
         echo -e "\e[1;33m时雨是谁？\e[0m"
         echo -e "\e[1;31m是个秃子 总之非常厉害\e[0m"
        ;;
#———————————————————————————————————————————————————————————————
        X|x)
bash <(curl -sL https://gitee.com/haanxuan/yzai-pd/raw/master/Splugins.sh)
        exit
        ;;
#———————————————————————————————————————————————————————————————
        1)
bash /root/XDM/Help.sh
        exit
        ;;
#———————————————————————————————————————————————————————————————        
        2)
clear
echo -e "\e[1;36m少女祈祷中..\e[0m"
        cd $Yz
        echo -e "\e[1;32m开始安装喵喵插件\e[0m"
git clone https://gitee.com/yoimiya-kokomi/miao-plugin.git ./plugins/miao-plugin/
        echo -e "\e[1;32m开始安装喵喵插件依赖\e[0m"
pnpm add image-size -w
        echo -e "\e[1;32m加载完成..\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        3)
        clear
if [ -d "$Yz/plugins/Guoba-Plugin" ]; then
    echo -e "\e[1;32m锅巴插件文件已存在 需要重装请先删除.\e[0m"
else
         cd $Yz
	    echo -e "\e[1;32m开始执行锅巴插件安装命令.\e[0m"
git clone --depth=1 https://gitee.com/guoba-yunzai/guoba-plugin.git ./plugins/Guoba-Plugin/
fi

if [ -d "$Yz/plugins/Guoba-Plugin" ]; then
    echo -e "\e[1;32m锅巴插件克隆完成\e[0m"
    echo -e "\e[1;33m开始安装锅巴插件所需依赖\e[0m"
    pnpm install --filter=guoba-plugin
    echo -e "\e[1;32m锅巴插件安装成功.\e[0m"
else
    echo -e "\e[1;31m锅巴插件安装失败.\e[0m"
   sleep 1.6 
fi
        ;;
#———————————————————————————————————————————————————————————————        
        4)
clear
cd $Yz
	    echo -e "\e[1;32m开始执行图鉴插件安装命令.\e[0m"
echo -e "\e[1;32m图鉴插件就是逍遥插件.\e[0m"
git clone https://gitee.com/Ctrlcvs/xiaoyao-cvs-plugin.git ./plugins/xiaoyao-cvs-plugin/
echo -e "\e[1;32m图鉴插件安装成功.\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        5)
clear
cd $Yz
echo -e "\e[1;32m开始执行土块插件安装命令.\e[0m"
echo -e "\e[1;31m土块绘图仅爱发电用户可用.\e[0m"
echo -e "\e[1;31m请去发电获取使用绘图的方法.\e[0m"
git clone https://gitee.com/SmallK111407/earth-k-plugin.git ./plugins/earth-k-plugin/
echo -e "\e[1;32m土块插件安装完成.\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        6)
clear
cd $Yz
echo -e "\e[1;32m开始执行闲心插件安装命令.\e[0m"
git clone https://gitee.com/xianxincoder/xianxin-plugin.git ./plugins/xianxin-plugin/
echo -e "\e[1;32m闲心插件安装成功.\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        7)
clear
cd $Yz
	    echo -e "\e[1;32m开始执行椰奶插件安装命令.\e[0m"
git clone https://gitee.com/yeyang52/yenai-plugin.git ./plugins/yenai-plugin
echo -e "\e[1;32m开始执行椰奶插件依赖安装命令\e[0m"
pnpm install
echo -e "\e[1;32m椰奶插件安装成功.\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        8)
clear
cd $Yz
echo -e "\e[1;32m开始执行抽卡插件安装命令.\e[0m"
git clone --depth=1 https://gitee.com/Nwflower/flower-plugin.git ./plugins/flower-plugin/
echo -e "\e[1;32m抽卡插件安装成功.\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        9)
clear
cd $Yz
	    echo -e "\e[1;32m开始执行戏天插件安装命令.\e[0m"
git clone https://gitee.com/XiTianGame/xitian-plugin.git ./plugins/xitian-plugin/
echo -e "\e[1;32m戏天插件安装成功.\e[0m"
        ;;
#———————————————————————————————————————————————————————————————      
        10)
clear
cd $Yz
	    echo -e "\e[1;32m开始执行小飞插件安装命令.\e[0m"
git clone https://gitee.com/xfdown/xiaofei-plugin.git ./plugins/xiaofei-plugin/
echo -e "\e[1;32m小飞插件安装成功.\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        11)
clear
cd $Yz
	    echo -e "\e[1;32m开始执行鳞插件安装命令.\e[0m"
git clone https://gitee.com/go-farther-and-farther/lin-plugin.git ./plugins/lin-plugin/
echo -e "\e[1;32m鳞插件安装成功.\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        12)
clear
cd $Yz
	    echo -e "\e[1;32m开始执行小雪插件安装命令.\e[0m"
git clone https://gitee.com/XueWerY/XiaoXuePlugin.git ./plugins/XiaoXuePlugin/
echo -e "\e[1;32m小雪插件安装成功.\e[0m"    
cd ./plugins/XiaoXuePlugin
echo -e "\e[1;32m开始执行小雪插件依赖安装命令\e[0m"     
echo -e "\e[1;32m只使用pnpm的命令\e[0m"  
echo -e "\e[1;32m如果失败了请手动试试cnpm或npm\e[0m"      
pnpm install -P
echo -e "\e[1;32m执行结束 请主人判断是否成功\e[0m" 
        ;;
#———————————————————————————————————————————————————————————————        
        13)
clear
cd $Yz
	    echo -e "\e[1;32m开始执行止水插件安装命令.\e[0m"
git clone https://gitee.com/fjcq/zhishui-plugin.git ./plugins/zhishui-plugin
echo -e "\e[1;32m止水插件安装成功.\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        14)
clear
cd $Yz
	    echo -e "\e[1;32m开始执行虚空插件安装命令.\e[0m"
git clone https://gitee.com/go-farther-and-farther/akasha-terminal-plugin.git ./plugins/akasha-terminal-plugin/
echo -e "\e[1;32m虚空插件安装成功.\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        15)
        clear
if [ -d "$Yz/plugins/Icepray" ]; then
    echo -e "\e[1;32m冰祈插件文件已存在 需要重装请先删除.\e[0m"
else
         cd $Yz
	    echo -e "\e[1;32m开始执行冰祈插件安装命令.\e[0m"
git clone https://gitee.com/koinori/Icepray.git ./plugins/Icepray
fi

if [ -d "$Yz/plugins/Icepray" ]; then
    echo -e "\e[1;32m冰祈插件安装成功.\e[0m"
else
    echo -e "\e[1;31m冰祈插件安装失败.\e[0m"
   sleep 1.6 
fi
        ;;
#———————————————————————————————————————————————————————————————        
        16)
clear
cd $Yz
	    echo -e "\e[1;32m开始执行成就插件安装命令.\e[0m"
git clone https://gitee.com/zolay-poi/achievements-plugin.git ./plugins/achievements-plugin/
echo -e "\e[1;32m成就插件安装成功.\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        17)
clear
cd $Yz
	    echo -e "\e[1;32m开始执行碎月插件安装命令.\e[0m"
git clone https://gitee.com/Acceleratorsky/suiyue.git ./plugins/suiyue/
echo -e "\e[1;32m碎月插件安装成功.\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        18)
clear
         cd $Yz
	    echo -e "\e[1;32m开始执行榴莲插件安装命令.\e[0m"
	    echo -e "\e[1;33m勇敢者插件 主人太厉害啦\e[0m"
git clone https://gitee.com/huifeidemangguomao/liulian-plugin.git ./plugins/liulian-plugin/
         echo -e "\e[1;32m榴莲插件安装成功.\e[0m"
         echo -e "\e[1;31m遇事不决删榴莲\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        19)
clear
cd $Yz
	    echo -e "\e[1;32m开始执行白纸插件安装命令.\e[0m"
git clone https://gitee.com/headmastertan/zhi-plugin.git ./plugins/zhi-plugin/
echo -e "\e[1;32m白纸插件安装成功.\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        20)
        clear
if [ -d "$Yz/plugins/xiaoyue-plugin" ]; then
    echo -e "\e[1;32m小月插件文件已存在 需要重装请先删除.\e[0m"
else
         cd $Yz
	    echo -e "\e[1;32m开始执行小月插件安装命令.\e[0m"
git clone --depth=1 https://gitee.com/ranyuege/xiaoyue-plugin.git ./plugins/xiaoyue-plugin
fi

if [ -d "$Yz/plugins/xiaoyue-plugin" ]; then
    echo -e "\e[1;32m小月插件安装成功.\e[0m"
else
    echo -e "\e[1;31m小月插件安装失败.\e[0m"
   sleep 1.6 
fi
        ;;
#———————————————————————————————————————————————————————————————        
        21)
        clear
if [ -d "$Yz/plugins/l-plugin" ]; then
    echo -e "\e[1;32mL插件文件已存在 需要重装请先删除.\e[0m"
else
         cd $Yz
	    echo -e "\e[1;32m开始执行L插件安装命令.\e[0m"
git clone https://github.com/liuly0322/l-plugin.git ./plugins/l-plugin/
fi

if [ -d "$Yz/plugins/l-plugin" ]; then
    echo -e "\e[1;33mL开始安装L插件依赖\e[0m"
    cd plugins/l-plugin
    pnpm install
    echo -e "\e[1;32mL插件安装成功.\e[0m"
else
    echo -e "\e[1;31mL插件安装失败.\e[0m"
   sleep 1.6 
fi
        ;;
#———————————————————————————————————————————————————————————————        
        22)
clear
cd $Yz
	    echo -e "\e[1;32m开始执行图鉴（Atlas）插件安装命令.\e[0m"
git clone --depth=1 https://gitee.com/Nwflower/atlas ./plugins/Atlas/
echo -e "\e[1;32m图鉴（Atlas）插件安装成功.\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        23)
clear
echo -e "\e[1;32m  修仙插件版本众多\e[0m"
sleep 1
echo -e "\e[1;33m  脚本实在是太懒了\e[0m"
sleep 1
echo -e "\e[1;31m  以后应该是不会更新修仙插件的安装\e[0m"
sleep 1
echo -e "\e[1;32m  自己去插件库看你需要的修仙插件版本\e[0m"
sleep 1
echo   自己安装即可
sleep 1
echo -e "\e[1;36mhttps://gitee.com/yhArcadia/Yunzai-Bot-plugins-index\e[0m"
sleep 3
        ;;
#———————————————————————————————————————————————————————————————        
        24)
clear
         cd $Yz
	    echo -e "\e[1;32m开始执行小叶插件安装命令.\e[0m"
git clone https://gitee.com/xiaoye12123/xiaoye-plugin.git ./plugins/xiaoye-plugin/ 
         echo -e "\e[1;32m小叶插件安装成功.\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        25)
clear
         cd $Yz
	    echo -e "\e[1;32m开始执行自动化插件Auto-plugin安装命令.\e[0m"
git clone --depth=1 https://gitee.com/Nwflower/auto-plugin.git ./plugins/auto-plugin/
         echo -e "\e[1;32m自动化插件Auto-plugin安装成功.\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        26)
        clear
echo -e "\e[1;32m 千羽\e[0m"
echo -e "\e[1;31m  离开了我们..\e[0m"
sleep 3
        ;;
#———————————————————————————————————————————————————————————————        
        27)
clear
         cd $Yz
	    echo -e "\e[1;32m开始执行清凉图插件安装命令.\e[0m"
git clone https://gitee.com/xwy231321/yunzai-c-v-plugin.git ./plugins/yunzai-c-v-plugin/
         echo -e "\e[1;32m清凉图插件安装成功.\e[0m"
        ;;
#——————————————————————————————————————————————————————————————— 
        28)
clear
         cd $Yz
	    echo -e "\e[1;32m开始执行ap绘图插件安装命令.\e[0m"
git clone https://gitee.com/yhArcadia/ap-plugin.git ./plugins/ap-plugin
         echo -e "\e[1;32m开始安装ap绘图插件依赖axios\e[0m"
         if command -v cnpm >/dev/null; then
     echo -e ${Tip} 开始用cnpm安装OpenAI所需依赖axios
     cnpm install axios -w
else
     echo -e ${Error} 未安装cnpm
     echo -e ${Tip} 开始用npm安装cnpm
     npm install -g cnpm -registry=https://registry.npm.taobao.org
     echo -e ${OK}
     echo -e ${Tip} 开始用cnpm安装OpenAI所需依赖axios
     cnpm install axios -w
fi
         echo -e "\e[1;32map绘图插件安装成功.\e[0m"
        ;;
#———————————————————————————————————————————————————————————————
        29)
clear
         cd $Yz
	    echo -e "\e[1;32m开始执行枫叶插件安装命令.\e[0m"
git clone https://gitee.com/kesally/hs-qiqi-cv-plugin.git  ./plugins/hs-qiqi-plugin
         echo -e "\e[1;32m枫叶插件安装成功.\e[0m"
        ;;
#———————————————————————————————————————————————————————————————
        30)
clear
         cd $Yz
	    echo -e "\e[1;32m开始执行脆脆鲨插件安装命令.\e[0m"
git clone https://gitee.com/JMCCS/jinmaocuicuisha.git ./plugins/Jinmaocuicuisha-plugin
         echo -e "\e[1;32m脆脆鲨插件安装成功.\e[0m"
        ;;
#———————————————————————————————————————————————————————————————
        31)
clear
         cd $Yz
	    echo -e "\e[1;32m开始执行光遇插件安装命令.\e[0m"
git clone https://gitee.com/Tloml-Starry/SKY-GuangYu-plugin.git ./plugins/SKY-GuangYu-plugin/
         echo -e "\e[1;32m光遇插件安装成功.\e[0m"
        ;;
#———————————————————————————————————————————————————————————————
        32)
        clear
if [ -d "$Yz/plugins/recreation-plugin" ]; then
    echo -e "\e[1;32m娱乐插件文件已存在 需要重装请先删除.\e[0m"
else
         cd $Yz
	    echo -e "\e[1;32m开始执行娱乐插件安装命令.\e[0m"
git clone https://github.com/QiuLing0/recreation-plugin.git ./plugins/recreation-plugin/
fi

if [ -d "$Yz/plugins/recreation-plugin" ]; then
    echo -e "\e[1;32m娱乐插件安装成功.\e[0m"
else
    echo -e "\e[1;31m娱乐插件安装失败.\e[0m"
   sleep 1.6 
fi
        ;;
#———————————————————————————————————————————————————————————————
        33)
        clear
if [ -d "$Yz/plugins/windoge-plugin" ]; then
    echo -e "\e[1;32mwindoge插件文件已存在 需要重装请先删除.\e[0m"
else
         cd $Yz
	    echo -e "\e[1;32m开始执行windoge插件安装命令.\e[0m"
git clone https://github.com/gxy12345/windoge-plugin.git ./plugins/windoge-plugin/
fi

if [ -d "$Yz/plugins/windoge-plugin" ]; then
    echo -e "\e[1;32m开始安装windoge插件依赖.\e[0m"
    pnpm install --filter=windoge-plugin
    echo -e "\e[1;32mwindoge插件安装成功.\e[0m"
else
    echo -e "\e[1;31mwindoge插件安装失败.\e[0m"
   sleep 1.6 
fi
        ;;
#———————————————————————————————————————————————————————————————
        34)
        clear
if [ -d "$Yz/plugins/expand-plugin" ]; then
    echo -e "\e[1;32m拓展插件文件已存在 需要重装请先删除.\e[0m"
else
         cd $Yz
	    echo -e "\e[1;32m开始执行拓展插件安装命令.\e[0m"
git clone --depth=1 https://gitee.com/SmallK111407/expand-plugin.git ./plugins/expand-plugin/
fi

if [ -d "$Yz/plugins/expand-plugin" ]; then
    echo -e "\e[1;32m拓展插件安装成功.\e[0m"
else
    echo -e "\e[1;31m拓展插件安装失败.\e[0m"
   sleep 1.6 
fi
        ;;
#———————————————————————————————————————————————————————————————
        35)
        clear
if [ -d "$Yz/plugins/phi-plugin" ]; then
    echo -e "\e[1;32m屁股肉插件文件已存在 需要重装请先删除.\e[0m"
else
         cd $Yz
	    echo -e "\e[1;32m开始执行屁股肉插件安装命令.\e[0m"
git clone https://gitee.com/catrong/phi-plugin.git ./plugins/phi-plugin/
fi

if [ -d "$Yz/plugins/phi-plugin" ]; then
    echo -e "\e[1;32m屁股肉插件安装成功.\e[0m"
else
    echo -e "\e[1;31m屁股肉插件安装失败.\e[0m"
   sleep 1.6 
fi
        ;;
#———————————————————————————————————————————————————————————————
        36)
        clear
if [ -d "$Yz/plugins/WeLM-plugin" ]; then
    echo -e "\e[1;32mWeLM插件文件已存在 需要重装请先删除.\e[0m"
else
         cd $Yz
	    echo -e "\e[1;32m开始执行WeLM插件安装命令.\e[0m"
git clone -b master --depth=1 https://gitee.com/shuciqianye/yunzai-custom-dialogue-welm.git ./plugins/WeLM-plugin
fi

if [ -d "$Yz/plugins/WeLM-plugin" ]; then
    echo -e "\e[1;32mWeLM插件安装成功.\e[0m"
else
    echo -e "\e[1;31mWeLM插件安装失败.\e[0m"
   sleep 1.6 
fi
        ;;
#———————————————————————————————————————————————————————————————        
        37)
        clear
echo -e "\e[1;32m半柠檬离开了我们..\e[0m"
sleep 3
        ;;
#———————————————————————————————————————————————————————————————
        38)
        clear
if [ -d "$Yz/plugins/py-plugin" ]; then
    echo -e "\e[1;32mpy插件文件已存在 需要重装请先删除.\e[0m"
else

#康康你的Python版本
# 获取当前系统Python3的版本号
python_version=$(python3 -c "import sys;print(sys.version_info.major*100+sys.version_info.minor)")

# 判断版本是否 3.8+
if [ $python_version -ge 308 ]; then
  echo "当前Python3版本 $python_version"
else
    echo "当前Python3版本 $python_version "
    echo -e "\e[1;31m没装Python3.8+ 就想玩py插件是吧？\e[0m"
    echo -e "\e[1;33m让我玩玩你的py 嘻嘻~\e[0m"
    sleep 1.6
    bash <(curl -sL https://gitee.com/haanxuan/Python/raw/master/Python3915.sh)
    exit
fi

#康康你私藏的pip3
if command -v pip3 >/dev/null 2>&1; then
    :
else
    python3 -m pip install --upgrade pip
fi

#康康烦人的Poetry
if command -v poetry >/dev/null 2>&1; then
    :
else
    python3 -m pip install poetry
fi

#唉 我又看一次
if command -v poetry >/dev/null 2>&1; then
    :
else
    echo -e "\e[1;32m唉 你这小孩\e[0m"
    sleep 1
    echo -e "\e[1;31mPoetry 安装失败！\e[0m"
    exit
fi

echo -e "\e[1;32m感觉前置环境没什么问题\e[0m"
sleep 1
echo -e "\e[1;32m那试试安装py插件吧\e[0m"
sleep 1
echo -e "\e[1;36m少女祈祷中..\e[0m"

echo -e "\e[1;33m  安装py前置依赖\e[0m"
cd $Yz
pnpm install iconv-lite @grpc/grpc-js @grpc/proto-loader -w
echo -e "\e[1;32m  安装py前置依赖完成\e[0m"
sleep 1
echo -e "\e[1;33m  挂载至目录\e[0m"
cd $Yz/plugins
pwd
sleep 1
echo -e "\e[1;33m  克隆py插件\e[0m"
echo -e "\e[1;31m  使用GitHub\e[0m"
git clone https://gitee.com/realhuhu/py-plugin.git

fi

if [ -d "$Yz/plugins/py-plugin" ]; then
echo -e "\e[1;33m  安装py插件所需依赖\e[0m"
sleep 1
echo -e "\e[1;31m  这可非常久 说要30分钟都是正常\e[0m"
sleep 1
echo -e "\e[1;32m  逗你玩呢~\e[0m"
cd $Yz/plugins/py-plugin
poetry install
    echo -e "\e[1;32mpy插件安装成功.\e[0m"
else
    echo -e "\e[1;31mpy插件安装失败.\e[0m"
   sleep 1.6 
fi
        ;;
#———————————————————————————————————————————————————————————————
        43)
        clear
if [ -d "/root/Yunzai-Bot/plugins/chatgpt-plugin" ]; then
    echo -e "\e[1;31m ChatGPT 插件文件已存在 需要重装请先删除.\e[0m"
    sleep 3
else
         cd /root/Yunzai-Bot
	    echo -e "\e[1;32m开始执行 ChatGPT 插件安装命令.\e[0m"
git clone --depth=1 https://github.com/ikechan8370/chatgpt-plugin.git ./plugins/chatgpt-plugin/
if [ -d "/root/Yunzai-Bot/plugins/chatgpt-plugin" ]; then
    cd plugins/chatgpt-plugin
    echo "" | pnpm install
    echo -e "\e[1;32m ChatGPT 插件安装成功.\e[0m"
else
    echo -e "\e[1;31m ChatGPT 插件安装失败，请尝试特殊上网手段！.\e[0m"
    echo GitHub
    sleep 3 
 fi
fi
        ;;
#———————————————————————————————————————————————————————————————
        39)
        clear
if [ -d "$Yz/plugins/FanSky_Qs" ]; then
    echo -e "\e[1;32mFanSky_Qs插件文件已存在 需要重装请先删除.\e[0m"
else
         cd $Yz
	    echo -e "\e[1;32m开始执行FanSky_Qs插件安装命令.\e[0m"
git clone --depth=1 https://gitee.com/FanSky_Qs/FanSky_Qs.git ./plugins/FanSky_Qs/
fi

if [ -d "$Yz/plugins/FanSky_Qs" ]; then
    cd plugins/FanSky_Qs
    pnpm install
    echo -e "\e[1;32mFanSky_Qs插件安装成功.\e[0m"
else
    echo -e "\e[1;31mFanSky_Qs插件安装失败.\e[0m"
    echo GitHub
   sleep 1.6 
fi
        ;;
#———————————————————————————————————————————————————————————————
       40)
       clear
       cd $Yz
       if [ -d "$Yz/plugins/StarRail-plugin" ]; then
    echo -e "\e[1;32mStarRail-plugin插件文件已存在 需要重装请先删除.\e[0m"
else
       echo -e "\e[1;32m开始执行StarRail-plugin插件安装命令.\e[0m"
       git clone --depth=1 https://gitee.com/hewang1an/StarRail-plugin.git ./plugins/StarRail-plugin
       fi
       if [ -d "$Yz/plugins/StarRail-plugin" ]; then
    echo -e "\e[1;32m铁道插件安装成功.\e[0m"
else
    echo -e "\e[1;31m铁道插件安装失败.\e[0m"
   sleep 1.6 
fi
        ;;
#———————————————————————————————————————————————————————————————
       41)
        clear
       cd $Yz
       if [ -d "$Yz/plugins/armoe-plugin" ]; then
    echo -e "\e[1;32marmoe-plugin插件文件已存在 需要重装请先删除.\e[0m"
else
       echo -e "\e[1;32m开始执行armoe-plugin插件安装命令.\e[0m"
       git clone --depth=1 https://gitee.com/armoe-project/armoe-plugin ./plugins/armoe-plugin
       fi
       if [ -d "$Yz/plugins/armoe-plugin" ]; then
    echo -e "\e[1;32m铁道攻略插件安装成功.\e[0m"
else
    echo -e "\e[1;31m铁道攻略插件安装失败.\e[0m"
   sleep 1.6 
fi
    ;;
#———————————————————————————————————————————————————————————————
        42)
        clear
       cd $Yz
        if [ -d "$Yz/plugins/y-tian-plugin" ]; then
    echo -e "\e[1;32my-tian-plugin插件文件已存在 需要重装请先删除.\e[0m"
else
    echo -e "\e[1;32m开始执行阴天插件安装命令.\e[0m"
    git clone https://gitee.com/wan13877501248/y-tian-plugin.git ./plugins/y-tian-plugin/
    fi
    if [ -d "$Yz/plugins/y-tian-plugin" ]; then
    echo -e "\e[1;32m阴天插件安装成功.\e[0m"
else
    echo -e "\e[1;31m阴天插件安装失败.\e[0m"
   sleep 1.6 
fi
   ;;
#———————————————————————————————————————————————————————————————
    esac
   done
  exit
 done  
exit