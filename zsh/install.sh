#!/bin/bash
# Atualizar e instalar o Zsh
sudo apt update
sudo apt install zsh -y

# Alterar o shell padrão para o Zsh
chsh -s /bin/zsh

# Instalar Oh My Zsh!
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Instalar Spaceship Prompt
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/spaceship-prompt" --depth=1
ln -s "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/spaceship-prompt/spaceship.zsh-theme" "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/spaceship.zsh-theme"

# Instalar Zsh Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

# Instalar Zsh Syntax Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

# Excluir o .zshrc existente e baixar o novo
rm -f "$HOME/.zshrc"
curl -fsSL https://raw.githubusercontent.com/rafaelhschuh/scrips/refs/heads/main/zsh/.zshrc -o "$HOME/.zshrc"

# Iniciar o Zsh
exec zsh
