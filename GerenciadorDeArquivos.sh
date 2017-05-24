#!/bin/bash
# Projeto Anonymous
# Este programa é um gerenciador de arquivos
MENU(){
	SELECIONE=$( dialog				\
		--stdout				\
		--backtitle "ANONYMOUS"                 \
		--title "Gerenciador de arquivos"	\
		--menu "Escolha uma opção: "		\
		0 0 0 					\
		1 "Criar um arquivo" 			\
		2 "Criar um diretorio" 			\
		3 "Mover arquivo" 			\
		4 "Copiar arquivo"			\
		5 "Listar arquivos"			\
		6 "Compactar arquivos"			\
		7 "Descompactar arquivos"		\
		8 "Permissão de arquivos"		\
		9 "Definir dono de Arquivo"		\
		10 "Remover arquivo"			\
		11 "Remover diretorio"			\
		12 "Sair")

case $SELECIONE in
	1) CRA ;;
	2) CRD ;;
	3) MVA ;;
	4) COP ;;
	5) LSA ;;
	6) COM ;;
	7) DES ;;
	8) PDA ;;
	9) DDA ;;
	10) RMA ;;
	11) RMD ;;
	12) clear; exit ;;
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

COM(){
	CAMI=$( dialog			    	\
	--stdout			    	\
	--title "Indique o caminho do arquivo"	\
	--fselect /			    	\
	0 0				    	)

	ARQUIVOS=$( dialog				\
	--stdout					\
	--inputbox "Digite o nome dos arquivos"		\
	0 0)

	NAME=$( dialog					\
	--stdout 					\
	--inputbox "Digite o nome do novo arquivo"	\
	0 0)

	tar -cf $NAME.tar $ARQUIVOS
MENU
}

DES(){

	DIRET=$( dialog			    	\
	--stdout			    	\
	--title "Indique o caminho do arquivo"	\
	--fselect /			    	\
	0 0				    	)

	NAME=$( dialog					\
	--stdout 					\
	--inputbox "Digite o nome do arquivo"		\
	0 0)

	CAMI=$( dialog			    		\
	--stdout			    		\
	--title "Indique o diretorio onde quer extrair"	\
	--fselect /			    		\
	0 0				    		)
	chmod +x $NAME
	tar -xf $NAME -C $DESCOMP

}

PDA(){
	DIR=$( dialog					\
	--stdout					\
	--title "Indique o diretorio do seu arquivo"	\
	--fselect / 					\
	0 0						)

	ARQ=$( dialog 				\
	--stdout				\
	--inputbox "Nome do arquivo"		\
	0 0					)

	PER=$( dialog 				\
	--stdout				\
	--inputbox "Defina a permissão desejada"\
	0 0					)
	chmod $PER $ARQ
MENU
}
DDA(){
	DIRET=$( dialog			\
	--stdout			\
	--title "Indique o diretorio"	\
	--fselect / 			\
	0 0				)

	ARQN=$( dialog				\
	--stdout				\
	--inputbox "Digite o nome do arquivo"	\
	0 0					)

	DONO=$( dialog					\
	--stdout 					\
	--inputbox "Informe o novo dono do arquivo"	\
	0 0						)
	chown $ARQN $DONO
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
