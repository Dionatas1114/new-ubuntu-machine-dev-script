#!/bin/bash

set -e

echo "[DEV] Instalando ferramentas base..."

sudo apt install -y \
  build-essential \
  git \
  curl \
  wget \
  python3 python3-pip python3-venv \
  jq \
  openssl

echo "[DEV] Instalando Docker..."

sudo install -m 0755 -d /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo $VERSION_CODENAME) stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

sudo usermod -aG docker $USER

echo "[DEV] Instalando VS Code..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | \
gpg --dearmor | sudo tee /usr/share/keyrings/packages.microsoft.gpg > /dev/null

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | \
sudo tee /etc/apt/sources.list.d/vscode.list

sudo apt update
sudo apt install -y code

echo "[DEV] Instalando DBeaver..."
wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | \
gpg --dearmor | sudo tee /usr/share/keyrings/dbeaver.gpg > /dev/null

echo "deb [signed-by=/usr/share/keyrings/dbeaver.gpg] https://dbeaver.io/debs/dbeaver-ce /" | \
sudo tee /etc/apt/sources.list.d/dbeaver.list

sudo apt update
sudo apt install -y dbeaver-ce