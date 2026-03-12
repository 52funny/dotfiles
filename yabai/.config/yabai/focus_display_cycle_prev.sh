#!/bin/bash

# 一次性查询所有显示器并计算目标索引
target_index=$(yabai -m query --displays | jq -r '
  . as $all | 
  (map(select(."has-focus" == true)) | .[0].frame.x) as $cx |
  (map(select(.frame.x < $cx)) | sort_by(.frame.x) | reverse | .[0] // ($all | sort_by(.frame.x) | reverse | .[0])) | .index
')

# 仅在获取到有效索引时执行聚焦
if [ "$target_index" != "null" ] && [ -n "$target_index" ]; then
  yabai -m display --focus "$target_index"
fi
