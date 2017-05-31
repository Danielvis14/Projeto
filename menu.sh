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
1) ./GerenciadorDeArquivos.sh    ;;
2) ./GerenciadorDeUsuarios.sh    ;;
3) ./GerenciadorDePacotes.sh     ;;
4) ./GerenciadorDeDispositivo.sh ;;
5) ./GerenciadorDeRede.sh        ;;
6) CRE                           ;;
7) SAIR                          ;;

esac
}

# Função responsável pela saída.
CRE(){
dialog --textbox Creditos.txt 0 0
MENU
}
SAIR(){
dialog --stdout --msgbox "VOLTE SEMPRE" 0 0
clear;exit 0
}
MENU
