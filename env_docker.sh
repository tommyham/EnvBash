sudo apt-get update
sudo-apt-get upgrade -y

sudo apt-get install ca-certificates curl gnupg
# 権限を指定しつつGPGキーをダウンロードするフォルダを作成。
sudo install -m 0755 -d /etc/apt/keyrings
# GPGキーをダウンロード。
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# GPGキーの権限を変更。
sudo chmod a+r /etc/apt/keyrings/docker.gpg
# リポジトリのセットアップ
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo docker run hello-world