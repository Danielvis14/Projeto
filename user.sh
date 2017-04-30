#!/bin/bash
NOME="/tmp/.nome"
SENHA1="/tmp/.senha1"
SENHA2="/tmp/.senha2"
MENU(){
clear
SELECIONE=$( dialog                 \
	--stdout                    \
	--menu "Selecione Uma Opção"\
	0 0 0                       \
	1 "Criar Usuario"           \
	2 "Remover Usuario"         )

case  $SELECIONE in
	1) CRUO ;;
	2) RMUO ;;
esac

}

CRUO(){
dialog --inputbox "Digite o nome do novo usuario" 7 40 2>$NOME
USUARIO='cat $NOME'

dialog --passwordbox "Digite a senha" 0 0 2>$SENHA1
dialog --passwordbox "Digite novamenta a senha" 0 0 2>$SENHA2

SENHA=$(cat $SENHA1)
if [ "$(cat $SENHA1)" == "$(cat $SENHA2)" ] ; then
dialog --yesno "confirma a criação do usuario $USUARIO ?" 7 45

case $? in
0)
mkdir /etc/skel/Musicas
mkdir /etc/skel/Downloads
mkdir /etc/skel/Documentos
useradd -m -d /home/$USUARIO -s /bin/bash $USUARIO
echo "$USUARIO:$SENHA" | passwd
dialog --msgbox "Usuario criado com sucesso" 7 50 ;;
esac
else
dialog --msgbox "As senhas não se conferem" 7 30
fi
}

MENU
