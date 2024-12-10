#!/bin/bash

# Обновление и установка базового ПО
sudo apt update && sudo apt upgrade -y
sudo apt install -y build-essential pkg-config libssl-dev git-all
sudo apt install -y tmux

# Запуск tmux
tmux

# Установка Nexus CLI
curl https://cli.nexus.xyz/ | sh

# Настройка окружения Cargo
. "$HOME/.cargo/env"
echo 'source $HOME/.cargo/env' >> ~/.bashrc
source ~/.bashrc

# Установка дополнительных инструментов
sudo apt install -y build-essential
sudo apt install -y protobuf-compiler

# Проверка версии protoc
protoc --version

# Добавление protoc в PATH
export PATH=$PATH:/path/to/protoc/directory
echo 'export PATH=$PATH:/path/to/protoc/directory' >> ~/.bashrc

# Установка Nexus CLI (повторно, если нужно)
curl https://cli.nexus.xyz/ | sh
