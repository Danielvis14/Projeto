#!/bin/bash

###########################################################
# Projeto Anonymous
# Módulo responsável pelo gerenciamento de Dispositivos 
# Criadores: Alana; Daniel; Fernando; Francisco; Luiz Henrique; Vanderlei.

###########################################################

# Função Menu responsável pelas rotinas principais deste Módulo.  
MENU(){
	SELECIONE=$( dialog					\
		--stdout					\
		--backtitle "ANONYMOUS"                         \
		--title "Gerenciador de Dispositivos"		\
		--menu "Selecione uma opção"			\
		0 0 0						\
		1 "Listar módulos carregados"			\
		2 "Listar módulos psmouse"			\
		3 "Inserir um módulo no kernel"			\
		4 "Remover módulo do kernel"			\
		5 "Mostrar mapa das dependências dos módulos"	\
		6 "Mostrar informações da cpu"			\
		7 "Informação da placa mãe"			\
		8 "Informação de espaço em disco"		\
		9 "Informações da Memória RAM"		        \
		10 "Voltar"                                       )

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
10) ./menu.sh ;;
*) PRESSIONE ;;
esac
}
PRESSIONE(){
dialog --msgbox "Pressione [enter] para finalizar" 0 0
dialog --msgbox "Volte Sempre" 0 0
clear
}

# Função responsável pela listagem dos módulos carregados no sistema.  
LSMC(){
	lsmod > listagem.txt
	echo "30" | dialog --gauge "Carregando Aguarde .." 0 0 0
	sleep 3
	echo "100" | dialog --gauge "Carregando Aguarde .." 0 0 0
	sleep 2

	dialog 					\
	--title "Módulos carregados no sistema"	\
	--textbox listagem.txt			\
	0 0
	rm listagem.txt
MENU
}

# Função responsável por listar módulos psmouse.  
LSMPS(){
	modinfo psmouse > lista.txt
	echo "30" | dialog --gauge "Carregando Aguarde .." 0 0 0
	sleep 3
	echo "100" | dialog --gauge "Carregando Aguarde .." 0 0 0
	sleep 2
	dialog 					\
	--title "Módulo psmouse"		\
	--textbox lista.txt			\
	0 0
	rm lista.txt

MENU
}

# Função responsável pela inserção de módulo no kernel.  
INMK(){
	INSER=$( dialog 					\
		--stdout					\
		--title "Inserir módulo no kernel"		\
		--fselect / 					\
		0 0						)
	insmod $INSER
MENU
}

# Função responsável pela remoção de módulo no kernel.
RMMK(){
	REMO=$( dialog	 					\
		--stdout					\
		--title "Remover módulo no kernel"		\
		--inputbox "Digite o nome do módulo" 		\
		0 0						)
	rmmod $REMO
MENU
}

# Função responsável por mostrar mapa de dependências de módulos.
MMDM(){
	depmod --all --verbose >lis.txt
	echo "10" | dialog --gauge "Carregando Aguarde..." 0 0 0
	sleep 3
	echo "30" | dialog --gauge "Carregando Aguarde..." 0 0 0
	sleep 2
	echo "70" | dialog --gauge "Carregando Aguarde..." 0 0 0
	sleep 2
	echo "100" | dialog --gauge "Carregando Aguarde..." 0 0 0
	sleep 1
	
	dialog						\
	--title "Mapa das dependências dos módulos"	\
	--textbox lis.txt				\
	0 0
	rm lis.txt
MENU
}

# Função responsável por mostrar informações da cpu em utilização.
MICPU(){
	lscpu >maquina.txt
	dialog --title "Informações da CPU" --textbox maquina.txt 0 0
	rm maquina.txt
MENU
}

# Função responsável por mostrar informações da placa mãe (motherboard) .
IFDPM(){
 	lspci >placamae.txt
	dialog --title "Informações da Placa Mãe " --textbox placamae.txt 0 0
	rm placamae.txt
MENU
}

# Função responsável por mostrar informações do espaço em disco utilizado.
IFEED(){
	df -h >hd.txt
	dialog --title "Espaço do Disco" --textbox hd.txt 0 0
	rm hd.txt
MENU
}

# Função responsável por mostrar informações da memória RAM.
IFMR(){
	cat /proc/meminfo > memoria.txt
	dialog --title "Memoria Ram" --textbox memoria.txt 0 0
	rm memoria.txt
MENU
}
MENU
