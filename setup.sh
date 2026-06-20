#!/bin/bash

set -e

GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
BLUE="\e[34m"
NC="\e[0m"

log() {
  echo -e "${BLUE}[INFO]${NC} $1"
}

success() {
  echo -e "${GREEN}[OK]${NC} $1"
}

warn() {
  echo -e "${YELLOW}[WARN]${NC} $1"
}

error() {
  echo -e "${RED}[ERROR]${NC} $1"
}

check_os() {
  if ! grep -Eq "Ubuntu|Linux Mint" /etc/os-release; then
    error "Este script suporta apenas Ubuntu ou Linux Mint."
    exit 1
  fi
  success "Sistema compatível detectado."
}

MODE="full"

while [[ $# -gt 0 ]]; do
  case $1 in
    --minimal)
      MODE="minimal"
      shift
      ;;
    --full)
      MODE="full"
      shift
      ;;
    *)
      warn "Flag desconhecida: $1"
      shift
      ;;
  esac
done

check_os

log "Atualizando sistema..."
sudo apt update && sudo apt upgrade -y

log "Instalando módulo DEV..."
bash modules/dev.sh

if [[ "$MODE" == "full" ]]; then
  log "Instalando módulo IA..."
  bash modules/ia.sh
fi

success "Setup finalizado!"