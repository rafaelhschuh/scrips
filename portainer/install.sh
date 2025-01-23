#!/bin/bash

# Baixar a imagem do Portainer
echo "Baixando a imagem do Portainer..."
docker pull portainer/portainer-ce

# Criar e executar o container do Portainer
echo "Criando e executando o container do Portainer..."
docker volume create portainer_data
docker run -d -p 9000:9000 -p 9443:9443 \
  --name portainer \
  --restart always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  portainer/portainer-ce

# Exibir status do container
echo "Container do Portainer em execução:"
docker ps
