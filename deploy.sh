#!/bin/bash

echo "Deploying application to GCP server..."

echo "${SSH_KEY} | base64 --decode > /tmp/ssh_rsa"
echo "${SSH_KEY}" | base64 --decode > /tmp/ssh_rsa

chmod 600 /tmp/ssh_rsa

# 使用私鑰連接到server並執行佈署命令
echo "ssh -i /tmp/ssh_rsa -o StrictHostKeyChecking=no zxvc198@${SERVER_IP} 'bash -s' < deploy-remote.sh"

ssh -o "StrictHostKeyChecking no" zxvc198@${SERVER_IP} -i /tmp/ssh_rsa "echo test > test.log"
ssh -o "StrictHostKeyChecking no" zxvc198@${SERVER_IP} -i /tmp/ssh_rsa 'bash -s' < deploy-remote.sh

# 清除臨時文件
echo "rm /tmp/ssh_rsa"
rm /tmp/ssh_rsa