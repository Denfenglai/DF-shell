#!/bin/bash

YUNZAI_PATH="$HOME/Yunzai-Bot"
EXCLUDED_DIRS=("example" "genshin" "system" "other" "bin")

# 检查插件目录是否存在
if [ ! -d "$YUNZAI_PATH/plugins" ]; then
    printf "目标文件夹不存在：%s/plugins\n" "$YUNZAI_PATH"
    exit 1
fi

# 初始化加载
if [ ! -f "$HOME/.Yunzai" ]; then 
    printf "文件不存在，正在初始化...\n"
    echo "$YUNZAI_PATH" > "$HOME/.Yunzai"
else
    printf "校验成功\n"
fi

# 清屏
clear

YUNZAI_PATH=$(cat "$HOME/.Yunzai")

# 获取所有插件目录
plugin_dirs=()
counter=1
while IFS= read -r folder; do
    folder_name=$(basename "$folder")
    if [[ ! "${EXCLUDED_DIRS[@]}" =~ "$folder_name" ]]; then
        plugin_dirs+=("$folder")
        printf "%d. %s\n" "$counter" "$folder_name"
        counter=$((counter+1))
    fi
done < <(find "$YUNZAI_PATH/plugins" -mindepth 1 -maxdepth 1 -type d)

# 用户选择要删除的序号并确认
if [ ${#plugin_dirs[@]} -eq 0 ]; then
    printf "未找到要删除的目录"
    exit 1
fi


printf "\n请输入你要删除的目录的编号，多个请用空格隔开: "
read -r chosen_indexes
chosen_indexes=($chosen_indexes)

if [ ${#chosen_indexes[@]} -eq 0 ]; then
    printf "未选择任何要删除的目录\n"
    exit 1
fi

chosen_dirs=()
for chosen_index in "${chosen_indexes[@]}"; do
    chosen_dir="${plugin_dirs[$chosen_index-1]}"
    if [ -d "$chosen_dir" ]; then
        chosen_dirs+=("$chosen_dir")
    else
        printf "%s 目录不存在\n" "$chosen_dir"
    fi
done

if [ ${#chosen_dirs[@]} -eq 0 ]; then
    printf "未找到任何要删除的目录\n"
    exit 1
fi

printf "\n你将要删除以下目录：\n"
for chosen_dir in "${chosen_dirs[@]}"; do
    printf "%s\n" "$chosen_dir"
done

printf "\n是否继续删除？[y/n] "
read -r confirm
if [[ ! $confirm =~ ^[Yy]$ ]]; then
    printf "删除操作已取消"
    exit 0
fi

# 删除选中的目录
for chosen_dir in "${chosen_dirs[@]}"; do
    printf "正在删除目录 %s ...\n" "$chosen_dir"
    rm -rf "$chosen_dir"
    printf "\n%s 已被永久删除\n" "$chosen_dir"
done