#!/bin/bash

# Обновление системы
echo "Updating system..."
sudo apt update && sudo apt upgrade -y

# Установка необходимых пакетов
echo "Installing essential packages..."
sudo apt install -y build-essential pkg-config libssl-dev git-all tmux protobuf-compiler

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

# Запуск tmux и выполнение установки Nexus CLI
echo "Starting tmux session for Nexus CLI installation..."
tmux new-session -d -s nexus_install 'curl https://cli.nexus.xyz/ | sh'

# Присоединение к tmux-сессии
tmux attach -t nexus_install
