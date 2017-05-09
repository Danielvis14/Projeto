#!/bin/bash
MENU(){
clear
SELECIONE=$( dialog                 \
	--stdout                    \
	--menu "Selecione Uma Opção"\
	0 0 0                       \
	1 "Criar Usuario"           \
	2 "Remover Usuario"         \
        3 "Sair"                    )

case  $SELECIONE in
	1) CRUO ;;
	2) RMUO ;;
	3) clear; exit 0 ;;
esac
}

CRUO(){
grupo=$( dialog					   \
	--stdout                                   \
	--menu " Escolha Uma Hierarquia Abaixo : " \
	0 0 0                                      \
 	"Alunos" Aluno				   \
	"Professores" Professor                    \
	"Coordenadores" Cordenador                 \
	"Diretoria" Diretor )

	usuario=$( dialog --stdout --inputbox 'Digite Nome Do Novo Usuario' 0 0 )
	senha=$( dialog --stdout --passwordbox 'Digite Sua Senha' 0 0 )
	dialog --msgbox "Usuario Criado Com Sucesso"
	mkdir /home/$usuario
	gruoupadd $grupo
	useradd $usuario -p $senha -d/home/$usuario -g $grupo
	MENU
}

RMUO(){
usuario=$( dialog --stdout --inputbox 'Digite Nome Do Usuario Que Deseja Remover' 0 0 )
userdel $usuario
dialog --msgbox 'Usuario Removido Com Sucesso' 7 50
MENU
}
MENU
