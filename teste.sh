#!/bin/bash
while true
do

OPCFILE="/tmp/.opcmenu"
NOME="/tmp/.nome"
SENHA1="/tmp/.senha1"
SENHA2="/tmp/.senha2"

dialog --menu "escolha uma opção abaixo" 10 30 3 \
"1" "Adicione Usuario" \
"2" "Remover Usuarios" 2> $OPCFILE

case $? in
1)
break ;;

255)
break ;;
esac

adicionar(){
dialog --inputbox "Digite o login do novo usuario" 7 40 2> $NOME
USUARIO ='cat $NOME'
if grep $USUARIO /etc/passwd; then
dialog --msgbox "USUARIO $USUARIO já existe" 7 45
else
dialog --passwordbox "Digite a senha" 00 2>SENHA1
dialog --passwordbox "Repita a senha" 00 2>SENHA2

SENHA=$(cat $SENHA1)

if(("$(cat $SENHA1)"="$(cat $SENHA2)")); then
dialog --yesno "Confirma a criação do Usuario $USUARIO ?" 7 45

case $? in
0)
useradd -m -d /home/$USUARIO -s /bin/bash $USUARIO
echo "$USUARIO:$SENHA" | chpasswd
dialog --msgbox "Usuario criado com sucesso" 7 50 ;;
esac
else
dialog --msgbox "As senhas Não Conferem" 7 30
fi
fi
}

remover(){
dialog --inputbox "Digite o nome do usuario a ser excluido" 7 50 2> $FDELUSER
DELUSER=$(cat $FDELUSER)
deluser $DELUSER

case $? in
0)
dialog --msgbox "O usuario foi excluido com sucesso" 5 40
*)
dialog --msgbox "Nome do usuario incorreto ou inexistente "
esac
}

case $(cat $OPCFILE) in
1)
adicionar;;
2)
remover;;
esac

done

rm -f "$OPCFILE"
rm -f "$NOME"
rm -f "$SENHA1"
rm -f "$SENHA2"
rm -f "$FDELUSER"
