#!/bin/bash

MENU(){
	SELECIONE=$( dialog				\
		--stdout				\
		--title "Gerenciador de dispositivo"	\
		--menu "Selecione uma opção"		\
		0 0 0					\
		1 "atualização de pacotes"		\
		2 "listar pacotes"			\
		3 "SAIR")

case $SELECIONE in
	1) ATUA ;;
	2) LIST ;;
	3) clear; exit ;;
esac
}

ATUA(){
	CONF=$( dialog				\
	--stdout				\
	--yesno "Deseja atualizar pacotes?"	\
	0 0)
	if (( $? == 0 )); then
	apt-get update
	else
	 dialog --msgbox "então tá =)"
	fi
}
MENU
