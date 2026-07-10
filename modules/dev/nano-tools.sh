#!/bin/bash

set -e

echo "[DEV] Instalando librewolf browser..."

sudo apt update
sudo apt install extrepo -y

sudo extrepo enable librewolf

sudo apt update
sudo apt install librewolf -y

echo "[DEV] Instalando VLC..."

sudo apt update
sudo apt install --no-install-recommends vlc
