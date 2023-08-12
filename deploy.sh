#!/bin/bash

echo "Deploying application to GCP server..."

echo "${SSH_KEY}" | base64 --decode > /tmp/ssh_rsa

chmod 600 ~/Desktop/id_rsa

# 使用私鑰連接到server並執行佈署命令
ssh -o "StrictHostKeyChecking=no" -i /tmp/ssh_rsa zxvc198@${SERVER_IP} 'bash -s' < deploy-remote.sh
# 清除臨時文件
rm /tmp/ssh_rsa