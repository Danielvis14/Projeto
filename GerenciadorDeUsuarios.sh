#!bin/bash
#GERENCIADOR DE USUARIOS
MENU(){
SELECIONE=$(dialog \
	--stdout \
	--menu "Gerenciador de usuário"\
	0 0 0 \
	1 "Criar usuário"\
	2 "Criar um grupo"\
	3 "Adicionar um usuário existente a um grupo"\
	4 "Criar um novo usuário e adicioná-lo a um grupo"\
        5 "Remover um usuário"\
	6 "Remover um grupo"\
	7 "Listar usuários" \
	8 "Listar grupos" \
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
	*) echo "Opção Inválida, digite novamente"; PRESSIONE ;;
esac
}

PRESSIONE(){
dialog --msgbox "Pressione [enter] para finalizar" 0 0
}

CRUO(){
usuario=$( dialog --stdout --inputbox "Digite o nome do usuário" 0 0 )
senha1=$( dialog --stdout --passwordbox "Digite a senha do usuário" 0 0 )
senha2=$( dialog --stdout --passwordbox "Por Favor,confirme a senha: " 0 0 )
SENHA=$( $senha1 == $senha2 )
if (( $senha1 != $senha2 )); then
dialog --msgbox "As senhas não se conferem" 0 0
else
dialog --yesno "Confirma a criação do usuário ?" 0 0
fi
mkdir /home/$usuario
useradd $usuario -p $SENHA -d/home/$usuario
MENU
}

CRUG(){
grupo=$( dialog --stdout --inputbox "Nome do novo grupo" 0 0 )
addgroup $grupo --force-badname
MENU
}

ADUG(){
usuario=$( dialog --stdout --inputbox "Nome do usuário" 0 0 )
grupo=$( dialog --stdout --inputbox "Nome do grupo" 0 0 )
gpasswd -a $usuario $grupo
MENU
}

CNAG(){
usuario=$( dialog --stdout --inputbox "Digite o nome do novo usuário" 0 0 )
senha1=$( dialog --stdout --inputbox "Digite a senha do usuário" 0 0 )
senha2=$(dialog --stdout --inpubox "Por favor, confirme a senha: " 0 0 )
SENHA=( $senha1 == $senha2)
grupo=$( dialog --stdout --inputbox "Digite nome do novo grupo" 0 0 )
if (( $senha1 != $senha2 )); then
dialog --msgbox "As senhas não se conferem" 0 0
else
dialog --yesno "Deseja confirmar a criação do novo usuário ?" 0 0
fi

mkdir /home/$usuario
useradd $usuario -p $SENHA -d/home/$usuario -g $grupo
MENU
}
RMUU(){
usuario=$( dialog --stdout --inputbox "Digite nome do usuário" 0 0 )
userdel $usuario
rmdir /home/$usuario
MENU
}
RMUG(){
grupo=$( dialog --stdout --inputbox "Digite nome do grupo" 0 0 )
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
