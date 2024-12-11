#!/bin/bash

# Обновление системы
echo "Updating system..."
sudo apt update && sudo apt upgrade -y

# Установка необходимых пакетов
echo "Installing essential packages..."
sudo apt install -y build-essential pkg-config libssl-dev git-all tmux protobuf-compiler

# Создание tmux-сессии и продолжение работы в ней
echo "Starting tmux session for script continuation..."
tmux new-session -d -s my_session "bash -c ' \
  echo \"Installing Nexus CLI...\"; \
  curl https://cli.nexus.xyz/ | sh; \
  echo \"Setting up Cargo environment...\"; \
  . \"\$HOME/.cargo/env\"; \
  echo \"source \$HOME/.cargo/env\" >> ~/.bashrc; \
  source ~/.bashrc; \
  echo \"Adding protoc to PATH...\"; \
  export PATH=\$PATH:/path/to/protoc/directory; \
  echo \"export PATH=\$PATH:/path/to/protoc/directory\" >> ~/.bashrc; \
  echo \"Checking protoc version...\"; \
  protoc --version; \
  echo \"All tasks completed in tmux session.\"'"

# Присоединение к tmux-сессии
tmux attach -t my_session
