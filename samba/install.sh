#!/bin/bash

# Pergunta o nome da pasta de compartilhamento
read -p "Digite o nome da pasta para o compartilhamento: " PASTA

# Pergunta o nome do usuário que terá acesso
read -p "Digite o nome do usuário para o Samba: " USUARIO

# Cria o usuário no sistema sem diretório home (se não existir)
if id "$USUARIO" &>/dev/null; then
    echo "Usuário $USUARIO já existe no sistema."
else
    sudo adduser --no-create-home --disabled-login --disabled-password --gecos "" "$USUARIO"
    echo "Usuário $USUARIO criado para o Samba!"
fi

# Define a senha do usuário para o Samba
echo "Digite a senha para o usuário no Samba:"
sudo smbpasswd -a "$USUARIO"

# Atualiza pacotes do sistema
sudo apt update

# Instala o Samba
sudo apt install samba -y

# Cria o diretório para compartilhamento
DIRETORIO="/srv/samba/$PASTA"
sudo mkdir -p "$DIRETORIO"

# Define permissões para o compartilhamento
sudo chown "$USUARIO":"$USUARIO" "$DIRETORIO"
sudo chmod 770 "$DIRETORIO"

# Faz backup da configuração original
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bkp

# Configura o compartilhamento no Samba
echo "[$PASTA]
   path = $DIRETORIO
   valid users = $USUARIO
   browseable = yes
   read only = no
   create mask = 0770
   directory mask = 0770" | sudo tee -a /etc/samba/smb.conf

# Reinicia o serviço Samba
sudo systemctl restart smbd

# Habilita o Samba na inicialização
sudo systemctl enable smbd

echo "Instalação e configuração inicial do Samba concluída!"
echo "Para configuraçõs adicionais, acesse: /etc/samba/smb.conf"
echo "Pasta compartilhada: $DIRETORIO"
echo "Usuário permitido: $USUARIO"
