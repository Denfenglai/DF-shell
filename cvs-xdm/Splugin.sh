#!/bin/bash

#初始化加载
if [ -f "$HOME/.Yunzai" ]; then
  echo -e "\033[32m校验成功\033[0m"
else
  echo -e "\033[33m初始化文件中\033[0m"
  sleep 0.3
  echo "~/Yunzai-Bot" > "$HOME/.Yunzai"
fi
#定义云崽路径
Yz=$(head -n 1 "${HOME}/.Yunzai")

if [ -d "$Yz/plugins" ]; then
    :
else
clear
    echo 删除插件
    echo -e "\e[1;31m$Yz/plugins文件夹不存在\e[0m"
    echo -e "\e[1;33m请先安装云崽本体\e[0m"
    echo -e "\e[1;32m遇到问题可以加入QQ交流群453694434\e[0m"
 exit   
fi

clear

#必须用root
if [[ $EUID != 0 ]];then
echo -e "\e[31m 当前不是root用户，必须更换root用户才能用。\e[0m\n"
exit
else
：
fi

clear

#多选菜单示例
echo -e "\e[1;31mYzai-V3 卸载插件\e[0m"
echo -e "—————————————————————————————————————————————
 \e[33m注意！这是删除插件的界面！\e[0m
 输入（\e[33mVits\e[0m）即可删除AI语音本地合成
 \e[32mX.\e[0m安装插件
 \e[33m0.\e[0m退出脚本
 \e[36m1.\e[0m返回脚本主页菜单
 \e[31m2.\e[0m喵喵插件    \e[31m3.\e[0m锅巴插件    \e[31m4.\e[0m逍遥插件
 \e[31m5.\e[0m土块插件    \e[31m6.\e[0m闲心插件    \e[31m7.\e[0m椰奶插件
 \e[31m8.\e[0m抽卡插件    \e[31m9.\e[0m戏天插件   \e[31m10.\e[0m小飞插件
 \e[31m11.\e[0m麟lin插件 \e[31m12.\e[0m小雪插件   \e[31m13.\e[0m止水插件
 \e[31m14.\e[0m虚空插件  \e[31m15.\e[0m冰祈插件   \e[31m16.\e[0m成就插件       
 \e[31m17.\e[0m碎月插件  \e[31m18.\e[0m榴莲插件   \e[31m19.\e[0m白纸插件
 \e[31m20.\e[0m小月插件  \e[31m21.\e[0ml-pugin    \e[31m22.\e[0m图鉴（Atlas）
 \e[31m23.\e[0m修仙插件  \e[31m24.\e[0m小叶插件   \e[31m25.\e[0m自动化插件
 \e[31m26.\e[0m千羽插件  \e[31m27.\e[0m清凉图插件 \e[31m28.\e[0map绘图插件
 \e[31m29.\e[0m枫叶插件  \e[31m30.\e[0m脆脆鲨插件 \e[31m31.\e[0m光遇插件
 \e[31m32.\e[0m娱乐插件  \e[31m33.\e[0mwindoge    \e[31m34.\e[0m拓展插件
 \e[31m35.\e[0m屁股肉插件\e[31m36.\e[0mWeLM插件   \e[31m37.\e[0m半柠檬插件
 \e[31m38.\e[0mPy插件    \e[31m39.\e[0m冰析插件   \e[31m40.\e[0mFanSky_Qs
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
        X|x)
bash <(curl -sL https://gitee.com/haanxuan/yzai-pd/raw/master/plugins.sh)     
        exit
        ;;
#———————————————————————————————————————————————————————————————
        Vits|vits|VITS)
clear
cd $Yz/plugins
        rm -rf vits-yunzai-Plugin
        echo -e "\e[1;32m卸载Vits AI语音本地合成完成\e[0m"
        sleep 2
        echo -e "\e[1;31m  骗你的！\e[0m"
        sleep 1
        echo -e "\e[1;33m  只是删了插件文件夹而已 环境没删\e[0m"
        sleep 3
        ;;        
#———————————————————————————————————————————————————————————————
        1)
bash /root/XDM/Help.sh
        exit
        ;;
#———————————————————————————————————————————————————————————————        
        2)
clear
cd $Yz/plugins
        rm -rf miao-plugin
        echo -e "\e[1;32m卸载喵喵完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        3)
clear
         cd $Yz/plugins
        rm -rf Guoba-Plugin
        echo -e "\e[1;32m卸载锅巴完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        4)
clear
cd $Yz/plugins
         rm -rf xiaoyao-cvs-plugin
	    echo -e "\e[1;32m卸载逍遥完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        5)
clear
cd $Yz/plugins
         rm -rf earth-k-plugin
	    echo -e "\e[1;32m卸载土块完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        6)
clear
cd $Yz/plugins
         rm -rf xianxin-plugin
	    echo -e "\e[1;32m卸载闲心完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        7)
clear
         cd $Yz/plugins
         rm -rf yenai-plugin
	    echo -e "\e[1;32m卸载椰奶完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        8)
clear
cd $Yz/plugins
         rm -rf flower-plugin
	    echo -e "\e[1;32m卸载抽卡完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        9)
clear
         cd $Yz/plugins
         rm -rf xitian-plugin
	    echo -e "\e[1;32m卸载戏天完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————     
        10)
clear
         cd $Yz/plugins
         rm -rf xiaofei-plugin
	    echo -e "\e[1;32m卸载小飞完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        11)
clear
         cd $Yz/plugins
         rm -rf lin-plugin
	    echo -e "\e[1;32m卸载麟完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        12)
clear
         cd $Yz/plugins
         rm -rf XiaoXuePlugin
	    echo -e "\e[1;32m卸载小雪完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        13)
clear
         cd $Yz/plugins
         rm -rf zhishui-plugin
	    echo -e "\e[1;32m卸载止水完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        14)
clear
         cd $Yz/plugins
         rm -rf akasha-terminal-plugin
	    echo -e "\e[1;32m卸载虚空完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        15)
clear
         cd $Yz/plugins
         rm -rf Icepray
	    echo -e "\e[1;32m卸载冰祈完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        16)
clear
         cd $Yz/plugins
         rm -rf achievements-plugin
	    echo -e "\e[1;32m卸载成就完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        17)
clear
         cd $Yz/plugins
         rm -rf suiyue
	    echo -e "\e[1;32m卸载碎月完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        18)
clear
         cd $Yz/plugins
         rm -rf liulian-plugin
	    echo -e "\e[1;32m卸载榴莲完成\e[0m"
	    echo -e "\e[1;33m勇敢者游戏结束\e[0m"
	    echo -e "\e[1;31m遇事不决删榴莲\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        19)
clear
         cd $Yz/plugins
         rm -rf zhi-plugin
	    echo -e "\e[1;32m卸载白纸完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        20)
clear
         cd $Yz/plugins
         rm -rf xiaoyue-plugin
	    echo -e "\e[1;32m卸载小月完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        21)
clear
         cd $Yz/plugins
         rm -rf l-plugin
	    echo -e "\e[1;32m卸载L完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        22)
clear
         cd $Yz/plugins
         rm -rf Atlas
	    echo -e "\e[1;32m卸载图鉴（Atlas）完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        23)
clear
echo -e "\e[1;32m  自己手动删除修仙文件夹即可\e[0m"
sleep 2
echo -e "\e[1;33m  作者太懒啦！\e[0m"
sleep 3
        ;;
#———————————————————————————————————————————————————————————————        
        24)
clear
         cd $Yz/plugins
         rm -rf xiaoye-plugin
	    echo -e "\e[1;32m卸载小叶完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        25)
clear
         cd $Yz/plugins
         rm -rf auto-plugin
	    echo -e "\e[1;32m卸载自动化插件完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        26)
clear
         cd $Yz/plugins
         rm -rf qianyu-plugin
	    echo -e "\e[1;32m卸载千羽完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————        
        27)
clear
         cd $Yz/plugins
         rm -rf yunzai-c-v-plugin
	    echo -e "\e[1;32m卸载清凉图插件完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————
        28)
clear
         cd $Yz/plugins
         rm -rf ap-plugin
	    echo -e "\e[1;32m卸载ap绘图插件完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————
        29)
clear
         cd $Yz/plugins
         rm -rf hs-qiqi-plugin
	    echo -e "\e[1;32m卸载枫叶插件完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————
        30)
clear
         cd $Yz/plugins
         rm -rf Jinmaocuicuisha-plugin
	    echo -e "\e[1;32m卸载脆脆鲨插件完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————
        31)
clear
         cd $Yz/plugins
         rm -rf SKY-GuangYu-plugin
	    echo -e "\e[1;32m卸载光遇插件完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————
        32)
clear
         cd $Yz/plugins
         rm -rf recreation-plugin
	    echo -e "\e[1;32m卸载娱乐插件完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————
        33)
clear
         cd $Yz/plugins
         rm -rf windoge-plugin
	    echo -e "\e[1;32m卸载windoge插件完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————
        34)
clear
         cd $Yz/plugins
         rm -rf expand-plugin
	    echo -e "\e[1;32m卸载拓展插件完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————
        35)
clear
         cd $Yz/plugins
         rm -rf phi-plugin
	    echo -e "\e[1;32m卸载屁股肉插件完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————
        36)
clear
         cd $Yz/plugins
         rm -rf WeLM-plugin
	    echo -e "\e[1;32m卸载WeLM插件完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————
        37)
clear
         cd $Yz/plugins
         rm -rf alemon-plugin
	    echo -e "\e[1;32m卸载半柠檬插件完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————
        38)
clear
         cd $Yz/plugins
         rm -rf py-plugin
	    echo -e "\e[1;32m卸载Py插件完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————
        39)
clear
         cd $Yz/plugins
         rm -rf Icepray
	    echo -e "\e[1;32m卸载冰析插件完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————
        40)
clear
         cd $Yz/plugins
         rm -rf FanSky_Qs
	    echo -e "\e[1;32m卸载FanSky_Qs插件完成\e[0m"
        ;;
#———————————————————————————————————————————————————————————————

    esac
   done
  exit
 done  
exit