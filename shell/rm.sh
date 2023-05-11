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

cd ~/$Yz

# 清屏
clear

# 获取 plugins 目录下的所有子目录（不包括隐藏目录）
plugin_dirs=$(find plugins/* -maxdepth 0 -type d -not -name ".*")

# 定义要排除的目录
excluded_dirs=("example" "genshin" "system" "other")

# 开始循环输出目录
echo -e "\033[34m以下目录可以删除：\033[0m"
echo -e "\033[31m注意！删除是不可逆的！请谨慎操作！\033[0m"
count=0
for dir in $plugin_dirs; do
  # 检查这个目录是否需要排除
  excluded=false
  for excluded_dir in "${excluded_dirs[@]}"; do
    if [ "$(basename "$dir")" = "$excluded_dir" ]; then
      excluded=true
      break
    fi
  done
  
  # 如果需要排除就跳过这个目录
  if [ "$excluded" = true ]; then
    continue
  fi
  
  # 输出目录序号和名称
  count=$((count + 1))
  echo "$count. $(basename "$dir")"
done

# 循环输入，直到用户输入了非空字符串
while true; do
  # 获取用户输入并删除相应目录
    echo "请输入要删除的目录序号（多选可用空格隔开，输入空格退出）："
    read to_be_deleted
  if [ "$to_be_deleted" = "" ] || [ "$to_be_deleted" = "0" ]; then
    exit 1
  fi
  if [[ ! "$to_be_deleted" =~ ^[1-9][0-9]*(\s+[1-9][0-9]*)*$ ]]; then
    echo "输入格式错误，请重新输入。"
  else
    break
  fi
done

IFS=" " read -ra to_be_deleted_arr <<< "$to_be_deleted"
for i in "${to_be_deleted_arr[@]}"; do
  index=$((i - 1))
  if [ "${plugin_dirs[index]}" = "" ]; then
    continue
  fi
  rm -rf "${plugin_dirs[index]}"
done

# 输出删除完成信息
echo -e "\033[32m删除完成\033[0m"