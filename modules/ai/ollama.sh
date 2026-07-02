#!/bin/bash

set -e


echo "[IA] Instalando Ollama..."

curl -fsSL https://ollama.com/install.sh | sh

echo ""
echo "Teste de instalação do Ollama:"

if ! command -v ollama &> /dev/null; then
    echo
    echo "ERRO: Ollama não encontrado."
    exit 1
fi

echo ""
echo "[IA] Ollama instalado com sucesso!"




echo "[IA] Baixando modelo leve para testes..."

ollama pull qwen3:4b

echo ""
echo "[IA] Instalação concluída!"

echo ""
echo "Teste:"
echo "  ollama run qwen3:4b"