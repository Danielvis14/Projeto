#!/bin/bash

###########################################################
# Projeto Anonymous
# Módulo responsável pelo gerenciamento de Usuários
# Criadores: Alana; Daniel; Fernando; Francisco; Luiz Henrique; Vanderlei.

###########################################################

#Menu geral
MENU(){
SELECIONE=$(dialog 						\
	--stdout 						\
	--nocancel						\
	--menu "Gerenciador de Usuários"			\
	0 0 0 							\
	1 "Criar usuário"					\
	2 "Criar um grupo"					\
	3 "Adicionar um usuário existente a um grupo"		\
	4 "Criar um novo usuário e adicioná-lo a um grupo"	\
        5 "Remover um usuário"					\
	6 "Remover um grupo"					\
	7 "Listar usuários" 					\
	8 "Listar grupos" 					\
        9 "Voltar"            					)
case $SELECIONE in
	1) CRUO 			   ;;
	2) CRUG 			   ;;
	3) ADUG 			   ;;
	4) CNAG 			   ;;
	5) RMUU 			   ;;
	6) RMUG				   ;;
	7) LSUS 			   ;;
	8) LSGS 			   ;;
	9) /home/vagrant/Projeto/./menu.sh ;;
	*) PRESSIONE			   ;;
esac
}

PRESSIONE(){
dialog --msgbox "Pressione [enter] para finalizar" 0 0
dialog --msgbox "Volte Sempre" 0 0
clear
}

# Função responsável pela criação de usuário.
CRUO(){
dialog --title "Aviso" --yesno "Você Deseja Continuar?" 0 0
if [ $? = 0 ]; then
usuario=$( dialog --stdout --nocancel --inputbox "Digite o nome do usuário" 0 0 )
senha1=$( dialog --stdout --nocancel --passwordbox "Digite a senha do usuário" 0 0 )
senha2=$( dialog --stdout --nocancel --passwordbox "Por Favor,confirme a senha: " 0 0 )
SENHA=$( $senha1 == $senha2 )
	if (( $senha1 != $senha2 )); then
	dialog --msgbox "As senhas não se conferem" 0 0
	else
	dialog --msgbox  "Usuário Criado com Sucesso!" 0 0
	mkdir /home/$usuario
	useradd $usuario -p $SENHA -d/home/$usuario
	MENU
	fi
else
MENU
fi
}

# Função responsável pela criação de grupo.
CRUG(){
dialog --title "Aviso" --yesno "Você Deseja Continuar?" 0 0
if [ $? = 0 ]; then
grupo=$( dialog --stdout --nocancel --inputbox "Nome do novo grupo" 0 0 )
addgroup $grupo --force-badname
MENU
else
MENU
fi
}

# Função responsável pela inserção de usuário existente em grupo.
ADUG(){
dialog --title "Aviso" --yesno "Você Deseja Continuar?" 0 0
if [ $? = 0 ]; then
usuario=$( dialog --stdout --nocancel --inputbox "Nome do usuário" 0 0 )
grupo=$( dialog --stdout --nocancel --inputbox "Nome do grupo" 0 0 )
gpasswd -a $usuario $grupo
MENU
else
MENU
fi
}

# Função responsável pela inserção de novo usuário em grupo.
CNAG(){
dialog --title "Aviso" --yesno "Você Deseja Continuar?" 0 0
if [ $? = 0 ]; then
usuario=$( dialog --stdout --nocancel --inputbox "Digite o nome do novo usuário" 0 0 )
senha1=$( dialog --stdout --nocancel --inputbox "Digite a senha do usuário" 0 0 )
senha2=$(dialog --stdout --nocancel --inpubox "Por favor, confirme a senha: " 0 0 )
SENHA=( $senha1 == $senha2)
grupo=$( dialog --stdout --nocancel --inputbox "Digite nome do novo grupo" 0 0 )
	if (( $senha1 != $senha2 )); then
	dialog --msgbox "As senhas não se conferem" 0 0
	else
	dialog --msgbox "Usuário Criado com Sucesso" 0 0
	mkdir /home/$usuario
	useradd $usuario -p $SENHA -d/home/$usuario -g $grupo
	MENU
	fi
else
MENU
fi
}

# Função responsável pela remoção de usuário.
RMUU(){
dialog --title "Aviso" --yesno "Você Deseja Continuar?" 0 0
if [ $? = 0 ]; then
usuario=$( dialog --stdout --nocancel --inputbox "Digite nome do usuário" 0 0 )
userdel $usuario
rmdir /home/$usuario
MENU
else
MENU
fi
}

# Função responsável pela remoção de grupo.
RMUG(){
dialog --title "Aviso" --yesno "Você Deseja Continuar?" 0 0
if [ $? = 0 ]; then
grupo=$( dialog --stdout --nocancel --inputbox "Digite nome do grupo" 0 0 )
groupdel $grupo
MENU
else
MENU
fi
}

# Função responsável pela listagem de usuário.
LSUS(){
grep /home /etc/passwd | cut -d: -f1 > passwd.txt
dialog --stdout --title "Usuários" --textbox passwd.txt 50 60
rm passwd.txt
MENU
}

# Função responsável pela listagem de grupo.
LSGS(){
cat /etc/group > grupo.txt
dialog --stdout --title "Grupos" --textbox grupo.txt 50 60
rm grupo.txt
MENU
}
MENU
