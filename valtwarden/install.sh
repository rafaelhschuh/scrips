#!/bin/bash

# Criar volume para persistência de dados
echo "Criando volume para os dados do Vaultwarden..."
docker volume create vaultwarden_data

# Baixar a imagem do Vaultwarden
echo "Baixando a imagem do Vaultwarden..."
docker pull vaultwarden/server:latest

# Criar e executar o container do Vaultwarden
echo "Criando e executando o container do Vaultwarden..."
docker run -d --name vaultwarden \
  -p 80:80 \
  -p 443:443 \
  -v vaultwarden_data:/data \
  --restart always \
  vaultwarden/server:latest

# Exibir status do container
echo "Container do Vaultwarden em execução:"
docker ps

# Informar o acesso
echo "Instalação concluída. Acesse o Vaultwarden pelo endereço: http://<ip-do-servidor>"
