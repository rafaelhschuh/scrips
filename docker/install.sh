#!/bin/bash

# Atualizar pacotes do sistema
echo "Atualizando pacotes..."
apt update -y && apt upgrade -y

# Instalar Docker e Docker Compose
echo "Instalando docker.io e docker-compose..."
apt install -y docker.io docker-compose

# Adicionar o usuário ao grupo docker
echo "Adicionando usuário ao grupo docker..."
usermod -aG docker $USER

# Exibir versão do Docker para confirmação
echo "Versões instaladas:"
docker --version
docker-compose --version

# Avisar sobre a necessidade de logout para aplicar permissões
echo "Instalação concluída. Faça logout e login novamente ou use 'newgrp docker' para aplicar as permissões."
