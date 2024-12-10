#!/bin/bash

# Обновление системы
echo "Updating system..."
sudo apt update && sudo apt upgrade -y

# Установка необходимых пакетов
echo "Installing essential packages..."
sudo apt install -y build-essential pkg-config libssl-dev git-all tmux protobuf-compiler

# Установка Nexus CLI
echo "Installing Nexus CLI..."
curl https://cli.nexus.xyz/ | sh

# Настройка Cargo
echo "Setting up Cargo environment..."
. "$HOME/.cargo/env"
echo 'source $HOME/.cargo/env' >> ~/.bashrc
source ~/.bashrc

# Добавление protoc в PATH
echo "Adding protoc to PATH..."
export PATH=$PATH:/path/to/protoc/directory
echo 'export PATH=$PATH:/path/to/protoc/directory' >> ~/.bashrc

# Проверка версии protoc
echo "Checking protoc version..."
protoc --version

# Создание и запуск tmux-сессии
echo "Starting tmux session..."
tmux new-session -d -s my_session 'bash <(curl -s https://raw.githubusercontent.com/SDW-1304/nexus/main/nexus.sh)'
tmux attach -t my_session
