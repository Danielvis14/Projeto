#!/bin/bash
MENU(){
	SELECIONE=$( dialog					\
		--stdout					\
		--backtitle "ANONYMOUS"                         \
		--title "Gerenciador de Dispositivos"		\
		--menu "Selecione uma opção"			\
		0 0 0						\
		1 "Listar modulos carregados"			\
		2 "Listar modulos psmouse"			\
		3 "inserir um módulo no kernel"			\
		4 "Remover módulo do kernel"			\
		5 "Mostrar mapa das dependencias dos modulos"	\
		6 "Mostrar informaçãos da cpu"			\
		7 "Informação da placa mãe"			\
		8 "Informação de espaço em disco"		\
		9 "Informaçãos da Memoria Ram"		        \
		10 "SAIR"                                       )

case $SELECIONE in
1) LSMC  ;;
2) LSMPS ;;
3) INMK  ;;
4) RMMK  ;;
5) MMDM  ;;
6) MICPU ;;
7) IFDPM ;;
8) IFEED ;;
9) IFMR ;;
10) clear; exit ;;
esac
}

LSMC(){
	lsmod > listagem.txt &
	dialog 					\
	--title "Módulos carregados no sistema"	\
	--textbox listagem.txt			\
	0 0
	rm listagem.txt
MENU
}

LSMPS(){
	modinfo psmouse > lista.txt &
	dialog 					\
	--title "Módulo psmouse"		\
	--textbox lista.txt			\
	0 0
	rm lista.txt

MENU
}
INMK(){
	INSER=$( dialog 					\
		--stdout					\
		--title "Inserir modulo no kernel"		\
		--fselect / 					\
		0 0						)
	insmod $INSER
MENU
}
RMMK(){
	REMO=$( dialog	 					\
		--stdout					\
		--title "Remover modulo no kernel"		\
		--inputbox "digite o nome do modulo" 		\
		0 0						)
	rmmod $REMO
MENU
}
MMDM(){
	depmod --all --verbose >lis.txt
	dialog						\
	--title "Mapa das dependencias dos modulos"	\
	--textbox lis.txt				\
	0 0
	rm lis.txt
MENU
}
MICPU(){
	lscpu >maquina.txt
	dialog --title "Informações da CPU" --textbox maquina.txt 0 0
	rm maquina.txt
}
IFDPM(){
 	lspci >placamae.txt
	dialog --title "Informações da Placa Mãe " --textbox placamae.txt 0 0
	rm placamae.txt
}
IFEED(){
	df -h >hd.txt
	dialog --title "Espaço do Disco" --textbox hd.txt 0 0
	rm hd.txt
}
IFMR(){
	cat /proc/meminfo > memoria.txt
	dialog --title "Informação da Memoria Ram" --textbox memoria.txt 0 0
	rm memoria.txt
}
MENU
