#!bin/bash
#GERENCIADOR DE USUARIOS
MENU(){
SELECIONE=$(dialog \
	--stdout \
	--menu "Gerenciador De Usuario"\
	0 0 0 \
	1 "Criar Usuario"\
	2 "Criar Um Grupo"\
	3 "Adicionar Um Usuario Existente A Um Grupo"\
	4 "Criar Um Novo Usuario e Adiciona-lo a Um Grupo"\
        5 "Remover Um Usuario"\
	6 "Remover Um Grupo"\
	7 "Listar Usuarios" \
	8 "Listar Grupos" \
        9 "Sair"            )
case $SELECIONE in
	1) CRUO ;;
	2) CRUG ;;
	3) ADUG ;;
	4) CNAG ;;
	5) RMUU ;;
	6) RMUG ;;
	7) LSUS ;;
	8) LSGS ;;
	9) clear; exit 0 ;;
	*) echo "Opção Invalida, Digite novamente"; PRESSIONE ;;
esac
}

PRESSIONE(){
dialog --msgbox "Pressione [enter] para finalizar" 0 0
}

CRUO(){
usuario=$( dialog --stdout --inputbox "Digite O Nome Do Usuario" 0 0 )
senha1=$( dialog --stdout --passwordbox "Digite A Senha Do Usuario" 0 0 )
senha2=$( dialog --stdout --passwordbox "Por Favor,Confirme A Senha: " 0 0 )
SENHA=$( $senha1 == $senha2 )
if (( $senha1 != $senha2 )); then
dialog --msgbox "As Senhas Não Se Conferem" 0 0
else
dialog --yesno "Confirma A Criação Do Usuario ?" 0 0
fi
mkdir /home/$usuario
useradd $usuario -p $SENHA -d/home/$usuario
MENU
}

CRUG(){
grupo=$( dialog --stdout --inputbox "Nome Do Novo Grupo" 0 0 )
addgroup $grupo --force-badname
MENU
}

ADUG(){
usuario=$( dialog --stdout --inputbox "Nome Do Usuario" 0 0 )
grupo=$( dialog --stdout --inputbox "Nome Do Grupo" 0 0 )
gpasswd -a $usuario $grupo
MENU
}

CNAG(){
usuario=$( dialog --stdout --inputbox "Digite Nome Do Novo Usuario" 0 0 )
senha1=$( dialog --stdout --inputbox "Digite A Senha Do Usuario" 0 0 )
senha2=$(dialog --stdout --inpubox "Por Favor Confirme A Senha: " 0 0 )
SENHA=( $senha1 == $senha2)
grupo=$( dialog --stdout --inputbox "Digite Nome Do Novo Grupo" 0 0 )
if (( $senha1 != $senha2 )); then
dialog --msgbox "As Senhas Não Se Conferem" 0 0
else
dialog --yesno "Confirma A Criação Do Usuario ?" 0 0
fi

mkdir /home/$usuario
useradd $usuario -p $SENHA -d/home/$usuario -g $grupo
MENU
}
RMUU(){
usuario=$( dialog --stdout --inputbox "Digite Nome Do Usuario" 0 0 )
userdel $usuario
rmdir /home/$usuario
MENU
}
RMUG(){
grupo=$( dialog --stdout --inputbox "Digite Nome Do Grupo" 0 0 )
groupdel $grupo
MENU
}
LSUS(){
grep /home /etc/passwd | cut -d: -f1 > passwd.txt
dialog --stdout --title "Usuários" --textbox passwd.txt 50 60
MENU
}
LSGS(){
cat /etc/group > grupo.txt
dialog --stdout --title "Grupos" --textbox grupo.txt 50 60
MENU
}
MENU
