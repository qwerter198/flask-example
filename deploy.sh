#!/bin/bash

echo "Deploying application to GCP server..."

echo "${SSH_KEY}" | base64 --decode > /temp/ssh_rsa
chmod 600 /temp/ssh_rsa

# 使用私钥连接到服务器并执行部署命令
ssh -i /temp/ssh_rsa zxvc198@${SERVER_IP} 'bash -s' < deploy-remote.sh

# 清除臨時文件
rm /temp/ssh_rsa