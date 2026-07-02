#!/bin/bash

set -e

echo "[IA] Instalando dependências..."

sudo apt update

sudo apt install -y \
  python3 \
  python3-pip \
  python3-venv \
  git \
  curl \
  wget \
  htop \
  nvtop
