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
<<<<<<< HEAD
		6 "Mostrar informaçãos da cpu"			\
		7 "Informação da placa mãe"			\
		8 "Informação de espaço em disco"		\
		9 "Informação de dispositivo cpi"		\
		10 "Informaçãos do HD"				\


=======
		6 "Sair"					)
>>>>>>> 9819b18cb9365b26f1727e372489829a6570f56e
case $SELECIONE in
1) LSMC  ;;
2) LSMPS ;;
3) INMK  ;;
4) RMMK  ;;
5) MMDM  ;;
<<<<<<< HEAD
6) MICPU ;;
=======
6) clear; exit ;;
>>>>>>> 9819b18cb9365b26f1727e372489829a6570f56e
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
<<<<<<< HEAD
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
=======

>>>>>>> 9819b18cb9365b26f1727e372489829a6570f56e
MENU
