#!/bin/bash

###########################################################
# Projeto Anonymous
# Módulo responsável pelo gerenciamento de Arquivos
# Criadores: Alana; Daniel; Fernando; Francisco; Luiz Henrique; Vanderlei.

###########################################################

# Função Menu responsável pelas rotinas principais deste Módulo.
MENU(){
MENU=$( dialog                 		\
	--stdout               		\
	--nocancel                      \
	--backtitle "ANONYMOUS"         \
	--title "Gerenciadores"		\
	--menu ""              		\
	0 0 0                  		\
	1 "Gerenciador de Arquivos"     \
	2 "Gerenciador de Usuários"     \
	3 "Gerenciador de Pacotes"      \
	4 "Gerenciador de Dispositivos" \
	5 "Gerenciador de Rede"         \
	6 "Creditos"                    \
	7 "Sair"                        )


case $MENU in
1) /home/vagrant/Projeto/./GerenciadorDeArquivos.sh    ;;
2) /home/vagrant/Projeto/./GerenciadorDeUsuarios.sh    ;;
3) /home/vagrant/Projeto/./GerenciadorDePacotes.sh     ;;
4) /home/vagrant/Projeto/./GerenciadorDeDispositivo.sh ;;
5) /home/vagrant/Projeto/./GerenciadorDeRede.sh        ;;
6) CRE                           		       ;;
7) SAIR                          		       ;;
255) PRESSIONE			 		       ;;
esac
}

PRESSIONE(){
dialog --msgbox "Pressione [enter] para finalizar" 0 0
dialog --msgbox "Volte Sempre" 0 0
clear
}
CRE(){
dialog --textbox /home/vagrant/Projeto/Creditos.txt 0 0
MENU
}
#função responsável pela saida
SAIR(){
dialog --stdout --msgbox "VOLTE SEMPRE" 0 0
clear; exit 0
}
MENU
