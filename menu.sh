#!/bin/bash
MENU(){
MENU=$( dialog                 		\
	--stdout               		\
	--backtitle "ANONYMOUS"         \
	--title "Gerenciadores"		\
	--menu ""              		\
	0 0 0                  		\
	1 "Gerenciador de Arquivos"     \
	2 "Gerenciador de Usuários"     \
	3 "Gerenciador de Pacotes"      \
	4 "Gerenciador de Dispositivos" \
	5 "Gerenciador de Rede"         \
	6 "Sair"                        )

case $MENU in
1) ./GerenciadorDeArquivos.sh    ;;
2) ./GerenciadorDeUsuarios.sh    ;;
3) ./GerenciadorDePacotes.sh     ;;
4) ./GerenciadorDeDispositivo.sh ;;
5) ./GerenciadorDeRede.sh        ;;
6) SAIR                          ;;

esac
}

SAIR(){
dialog --stdout --msgbox "VOLTE SEMPRE" 0 0
clear;exit 0
}
MENU
