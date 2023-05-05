#!/bin/bash

# 清屏
clear

# 获取主目录
homedir=$(eval echo "~${USER}")

# 输出提示信息和分割线
echo "当前主目录下的目录"
echo "--------------------------------"

# 获取所有非隐藏的目录名，并按名称排序
dir_str=$(find "${homedir}" -maxdepth 1 -type d ! -name ".*" -printf "%f ")
dirs=($dir_str)
echo "可用的目录："
for index in "${!dirs[@]}"; do
  echo " $((index+1)). ${dirs[$index]}"
done

# 使用选择菜单，获取用户选择的目录名称
PS3="请选择一个目录（输入 # 或 q 退出）："
select dir in "${dirs[@]}"; do
  case "$dir" in
    "")
      echo "无效的目录编号，请重试！"
      ;;
    "#"|"q")
      echo "已退出，未作更改" > "${homedir}/.Yunzai"
      exit
      ;;
    *)
      if [ -d "${dir}/plugins" ]; then
        echo "$dir" > "/root/${homedir}/.Yunzai"
        echo -e "\033[32m修改成功！\033[0m"
        break
      else
        echo -e "\033[31m你选择的似乎不是一个 Yunzai-BOT 根目录，已取消修改\033[0m"
        exit
      fi
      ;;
  esac
done