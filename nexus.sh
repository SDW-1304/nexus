#!/bin/bash

# Обновление и установка базового ПО
echo "Updating system and installing essential packages..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y build-essential pkg-config libssl-dev git-all tmux protobuf-compiler

# Создание tmux-сессии и выполнение оставшихся команд внутри
echo "Starting tmux session and continuing script..."
tmux new-session -d -s nexus_setup "bash -c ' \
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
  echo \"Reinstalling Nexus CLI (if necessary)...\"; \
  curl https://cli.nexus.xyz/ | sh; \
  echo \"Setup completed!\"'"

# Присоединение к tmux-сессии
tmux attach -t nexus_setup
