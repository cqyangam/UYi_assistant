#!/bin/bash

# 获取当前正在运行的内核版本
current_kernel=$(uname -r)

# 获取所有已安装的旧内核，排除当前运行的内核
old_kernels=$(rpm -qa kernel | grep -v "$current_kernel")

# 检查是否存在旧内核
if [ -z "$old_kernels" ]; then
    echo "没有旧内核需要删除。"
else
    echo "以下内核将被删除："
    echo "$old_kernels"
    
    # 逐个删除旧内核
    for kernel in $old_kernels; do
        echo "正在删除: $kernel"
        yum remove -y "$kernel"
    done
fi
