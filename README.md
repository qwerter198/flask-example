# flask-example

此範例建立一個簡單的Flask框架，並使用tox與pytest進行單元測試。接著，透過Travis進行CI/CD流程，將應用封裝成Docker容器，然後應用Kubernetes(GKE)來實現自動化部署到GCP上，以在多台機器上管理容器。當服務負載變化時，容器可以自動擴展。

1. 參考[travis官網](https://www.travis-ci.com/)將travis連結到github的repository，並設定環境變數
2. 建立.travis.yml 來設置travis需要處理的事
3. 設定環境變數
    a. SSH_KEY : SSH連接密鑰
    b. SERVER_的Server IPerver IP
    c. GCP_KEY : 用來認證GKE服務
    d. DOCKER_USERNAME : dockerHub帳號(用來推送image)
    e. DOCKER_PASSWORD : dockerHub密碼
4. 搭配所需的Shell Script(deploy-k8s.sh)
5. 接下來只需要push commit到github就可以檢視CI/CD的結果