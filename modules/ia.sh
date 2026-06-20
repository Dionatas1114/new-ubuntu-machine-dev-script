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

echo "[IA] Instalando Ollama..."

curl -fsSL https://ollama.com/install.sh | sh

echo "[IA] Baixando modelo leve para testes..."

ollama pull qwen3:8b

echo ""
echo "[IA] Instalação concluída!"
echo ""
echo "Teste:"
echo "  ollama run qwen3:8b"