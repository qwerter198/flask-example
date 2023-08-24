#!/bin/bash

echo "Deploying application to GCP server..."

echo "${SSH_KEY}" | base64 --decode > /tmp/ssh_rsa

chmod 600 /tmp/ssh_rsa

# 使用私鑰連接到server並執行更新k8s命令
ssh -o "StrictHostKeyChecking=no" -i /tmp/ssh_rsa zxvc198@${SERVER_IP} 'bash -s'  << EOF
  cd /temp/flask-example
  git checkout main
  git pull
  docker-compose -f docker-compose.yml down
  docker-compose -f docker-compose.yml up -d
  docker-compose push
  sleep 10
  kubectl apply -f kubernetes/deployment.yaml
  kubectl apply -f kubernetes/service.yaml
  docker rmi zxcv198/flask-example:1.0.3
  echo "Application deployed successfully!"
EOF

# 清除臨時文件
rm /tmp/ssh_rsa