#!/bin/bash
# Projeto Anonymous
# Este programa é um gerenciador de arquivos
MENU(){
	SELECIONE=$( dialog				\
		--stdout				\
		--title "Gerenciador de arquivos"	\
		--menu "Escolha uma opção: "		\
		0 0 0 					\
		1 "Criar um arquivo" 			\
		2 "Criar um diretorio" 			\
		3 "Mover arquivo" 			\
		4 "Copiar arquivo"			\
		5 "Listar arquivos"			\
		6 "Remover arquivo"			\
		7 "Remover diretorio"			\
		8 "Sair")

case $SELECIONE in
	1) CRA ;;
	2) CRD ;;
	3) MVA ;;
	4) COP ;;
	5) LSA ;;
	6) RMA ;;
	7) RMD ;;
	8) clear; exit ;;
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
	MOVER=$( dialog			    \
	--stdout			    \
	--title "O que você deseja mover ? "\
	--fselect /			    \
	0 0				    )

	ONDE=$( dialog			            \
	--stdout			            \
	--title "Para onde voce deseja mover ?"	    \
	--fselect /			            \
	0 0				            )


mv $MOVER $ONDE
MENU
}

COP(){
	COPIAR=$( dialog			\
	--stdout			        \
	--title "O que você deseja copiar ? "	\
	--fselect /			        \
	0 0				       )

	ONDE=$( dialog			\
	--stdout			\
	--title "Para onde copiar"	\
	--fselect /			\
	0 0				)


cp $COPIAR $ONDE
MENU
}

LSA(){
	LIST=$( dialog					\
	--stdout					\
	--title "Qual diretorio deseja listar:"		\
	--fselect /					\
	0 0						)
	ls -l >.TEMP.txt
	dialog					\
	--title "Lista do diretorio $LIST"	\
	--textbox .TEMP.txt			\
	0 0
	rm .TEMP.txt
MENU
}

RMA(){
	REMO=$( dialog					\
	--stdout					\
	--title "Selecione o arquivo para remove-lo"	\
	--fselect /					\
	0 0						)
	dialog					\
	--stdout				\
	--title "Confirme"			\
	--yesno "Quer mesmo remover $REMO?"	\
	0 0
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
