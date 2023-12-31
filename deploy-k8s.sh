#!/bin/bash

echo "Deploying application to GCP server..."

echo "${SSH_KEY}" | base64 --decode > /tmp/ssh_rsa

echo "${GCP_KEY}" | base64 --decode > /tmp/gcp_key.json

chmod 600 /tmp/ssh_rsa
chmod 600 /tmp/gcp_key.json

# 使用私鑰連接到server並執行更新k8s命令
ssh -o "StrictHostKeyChecking=no" -i /tmp/ssh_rsa zxvc198@${SERVER_IP} 'bash -s' < deploy-remote-k8s.sh

# 清除臨時文件
rm /tmp/ssh_rsa
rm /tmp/gcp_key.json