#!/bin/bash

# MySQL连接信息
MYSQL_HOST="10.11.166.5"
MYSQL_USER="root"
MYSQL_PASS="UYi2023.."
MYSQL_DB="uossysmig"

# 读取IP地址文件
IP_FILE=~/V_ip.txt

# 检查文件是否存在
if [ ! -f "$IP_FILE" ]; then
  echo "IP文件 $IP_FILE 不存在"
  exit 1
fi

# 遍历每个IP地址并执行删除操作
while IFS= read -r AGENT_IP; do
  if [[ -z "$AGENT_IP" ]]; then
    continue
  fi

  echo "正在删除IP地址为 $AGENT_IP 的记录..."

  # 构建SQL语句
  SQL="
  DELETE FROM abi_check WHERE agent_ip='$AGENT_IP';
  DELETE FROM agent_info WHERE agent_ip='$AGENT_IP';
  DELETE FROM api_task WHERE agent_ip='$AGENT_IP';
  DELETE FROM app_check WHERE agent_ip='$AGENT_IP';
  DELETE FROM bak_res_info WHERE agent_ip='$AGENT_IP';
  DELETE FROM base_agent_info WHERE agent_ip='$AGENT_IP';
  DELETE FROM override_info WHERE agent_ip='$AGENT_IP';
  DELETE FROM report_info WHERE agent_ip='$AGENT_IP';
  DELETE FROM risk_assessment WHERE agent_ip='$AGENT_IP';
  DELETE FROM scripts WHERE agent_ip='$AGENT_IP';
  DELETE FROM whitelist WHERE agent_ip='$AGENT_IP';
  "

  # 执行SQL语句
  mysql -h "$MYSQL_HOST" -u "$MYSQL_USER" -p"$MYSQL_PASS" "$MYSQL_DB" -e "$SQL"

  if [ $? -eq 0 ]; then
    echo "IP地址 $AGENT_IP 的记录删除成功。"
  else
    echo "IP地址 $AGENT_IP 的记录删除失败。"
  fi

done < "$IP_FILE"

