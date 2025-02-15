#!/bin/bash
# Atualizar e instalar o Zsh
sudo apt update
sudo apt install zsh -y

# Alterar o shell padrão para o Zsh
chsh -s /bin/zsh

# Instalar Oh My Zsh!
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Iniciar o Zsh
exec zsh
