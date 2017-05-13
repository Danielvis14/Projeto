#!/bin/bash
MENU(){
	SELECIONE=$( dialog					\
		--stdout					\
		--title "Gerenciador de Dispositivos"		\
		--menu "Selecione uma opção"			\
		0 0 0						\
		1 "Listar modulos carregados"			\
		2 "Listar modulos psmouse"			\
		3 "inserir um módulo no kernel"			\
		4 "Remover módulo do kernel"			\
		5 "Mostrar mapa das dependencias dos modulos"	\
		6 "Sair"					)
case $SELECIONE in
1) LSMC  ;;
2) LSMPS ;;
3) INMK  ;;
4) RMMK  ;;
5) MMDM  ;;
6) clear; exit ;;
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

MENU
