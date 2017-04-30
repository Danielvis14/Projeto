#!bin/bash
dialog --inputbox "NOME DO USUARIO" 2>$USUARIO
dialog --inputbox "Digite Sua Senha" 2>$SENHA
mkdir /etc/skel/Musicas
mkdir /etc/skel/Downloads
mkdir /etc/skel/Documentos
useradd -m -d/home/$USUARIO
passwd $USUARIO
