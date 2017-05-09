#!/bin/bash

MENU(){
	SELECIONE=$( dialog				\
		--stdout				\
		--title "Gerenciador de arquivos"	\
		--menu "Escolha uma opção: "		\
		0 0 0 					\
		1 "Criar um arquivo" 			\
		2 "criar um diretorio" 			\
		3 "Mover arquivo" 			\
		4 "Copiar arquivo"			\
		5 "Remover arquivo"			\
		6 "Remover diretorio"			\
		7 "Sair")

case $SELECIONE in
	1) CRA ;;
	2) CRD ;;
	3) MVA ;;
	4) COP ;;
	5) RMA ;;
	6) RMD ;;
	7) clear; exit ;;
	*) dialog --msgbox "opção invalida" ;;

esac
}

CRA(){
 ARQ=$( dialog						\
	--stdout					\
	--inputbox "Digite um nome para o arquivo"	\
	0 0						)
	>$ARQ
MENU
}

CRD(){
 DIR=$( dialog						\
	--stdout					\
	--inputbox "Digite um nome para o diretorio"	\
	0 0)
	mkdir $DIR
MENU
}


MVA(){
	MOVER=$( dialog			\
	--stdout			\
	--title "Para onde mover"	\
	--fselect /			\
	0 0				)

	ONDE=$( dialog			\
	--stdout			\
	--title "Para onde mover"	\
	--fselect /			\
	0 0				)


mv $MOVER $ONDE
MENU
}

COP(){
	COPIAR=$( dialog			\
	--stdout			\
	--title "Para onde mover"	\
	--fselect /			\
	0 0				)

	ONDE=$( dialog			\
	--stdout			\
	--title "Para onde copiar"	\
	--fselect /			\
	0 0				)


cp $COPIAR $ONDE
MENU
}

RMA(){
	REMO=$( dialog					\
	--stdout					\
	--title "Selecione o arquivo para remove-lo"	\
	--fselect /					\
	0 0						)
	dialog --stdout --title "Confirme" --yesno "Quer mesmo remover $REMO?" 0 0
	if [ $? = 0 ]; then
	rm $REMO
	else
		MENU
	fi
MENU
}

RMD(){
	REMO=$( dialog					\
	--stdout					\
	--title "Selecione o diretorio para remove-lo"	\
	--fselect /					\
	0 0						)
	dialog --stdout --title "Confirme" --yesno "Quer mesmo remover $REMO?" 0 0
	if [ $? = 0 ]; then
	rmdir $REMO
	else
		MENU
	fi
MENU
}

MENU
