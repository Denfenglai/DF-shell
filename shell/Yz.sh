#!/bin/bash

# 清屏
clear

# 获取主目录
homedir=$(eval "echo ~${USER}")

# 输出提示信息和分割线
echo -e "\e[35m当前主目录下的云崽根目录\e[0m"
echo -e "--------------------------------\e[1;32m"

# 获取所有非隐藏、合法的 Yunzai-BOT 根目录名，并按名称排序
dirs=$(find "${homedir}" -maxdepth 1 -type d ! -name ".*" -exec test -d '{}/lib' ';' -print | sort)

# 输出所有 Yunzai-BOT 根目录名，并使用 select 提供选择菜单
PS3="请选择一个目录（输入 # 或 q 退出）："
select dir in ${dirs}; do
  case "$dir" in
    "")
      echo -e "\e[31m无效的目录编号，请重试！\e[0m"
      ;;
    "#"|"q")
      echo "\e[32m已退出，未作更改\e[0m" > "${homedir}/.Yunzai"
      exit
      ;;
    *)
      if [ -d "${dir}/plugins" ]; then
        echo "$dir" > "${homedir}/.Yunzai"
        echo -e "\033[32m修改成功！\033[0m"
        break
      else
        echo -e "\033[31m你选择的似乎不是一个 Yunzai-BOT 根目录，已取消修改\033[0m"
        exit
      fi
      ;;
  esac
done