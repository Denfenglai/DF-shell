#!/bin/bash

# 交互式添加自定义别名脚本

echo "欢迎使用自定义别名添加脚本"

while true; do
  read -p "请输入别名（输入'q'退出）: " alias_name

  if [ "$alias_name" == "q" ]; then
    echo "退出脚本"
    exit 0
  fi

  read -p "请输入对应的指令: " command

  # 添加别名
  echo "alias $alias_name='$command'" >> ~/.bashrc

  echo "别名 $alias_name 添加成功！"

  read -p "继续添加别名？(y/n): " continue_add

  if [ "$continue_add" != "y" ]; then
    break
  fi
done

# 重新加载 .bashrc
source ~/.bashrc

echo "添加完成"