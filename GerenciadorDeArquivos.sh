#!/bin/bash

###########################################################
# Projeto Anonymous
# Módulo responsável pelo gerenciamento de Arquivos
# Criadores: Alana; Daniel; Fernando; Francisco; Luiz Henrique; Vanderlei.

###########################################################

# Função Menu responsável pelas rotinas principais deste Módulo.
MENU(){
	SELECIONE=$( dialog				\
		--stdout				\
		--nocancel                              \
		--backtitle "ANONYMOUS"                 \
		--title "Gerenciador de Arquivos"	\
		--menu "Escolha uma opção: "		\
		0 0 0 					\
		1 "Criar um arquivo" 			\
		2 "Criar um diretório" 			\
		3 "Mover arquivo" 			\
		4 "Copiar arquivo"			\
		5 "Listar arquivos"			\
		6 "Compactar arquivos"			\
		7 "Descompactar arquivos"		\
		8 "Permissão de arquivos"		\
		9 "Definir dono do arquivo"		\
		10 "Remover arquivo"			\
		11 "Remover diretório"			\
		12 "Voltar")

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
	12)./menu.sh ;;
	*) PRESSIONE ;;

esac
}
PRESSIONE(){
dialog --msgbox "Pressione [enter] para finalizar" 0 0
dialog --msgbox "Volte Sempre" 0 0
clear
}
#Função responsável pela criação de Arquivos
CRA(){
dialog --title "Aviso"  --yesno "Você Deseja Contunuar ?" 0 0
if [ $? = 0 ]; then
 	ARQ=$( dialog					\
	--stdout					\
	--nocancel                                      \
	--inputbox "Digite um nome para o arquivo"	\
	0 0						)
	>$ARQ
	MENU
	else
	MENU
	fi
}

#Função responsável pela criação de Diretórios
CRD(){
dialog --title "Aviso" --yesno "Você Deseja Continuar ?" 0 0
if [ $? = 0 ]; then
 DIR=$( dialog						\
	--stdout					\
	--nocancel                                      \
	--inputbox "Digite um nome para o diretório"	\
	0 0)
	mkdir $DIR
	MENU
	else
	MENU
	fi
}

#Função incumbida de mover os  Arquivos
MVA(){
dialog --title "Aviso" --yesno "Você Deseja Continuar ?" 0 0
	if [ $? = 0 ]; then
	MOVER=$( dialog			    \
	--stdout			    \
	--nocancel                          \
	--title "O que você deseja mover ? "\
	--fselect /			    \
	0 0				    )

	ONDE=$( dialog			            \
	--stdout			            \
	--nocancel                                  \
	--title "Para onde você deseja mover ?"	    \
	--fselect /			            \
	0 0				            )

	mv $MOVER $ONDE
	MENU
	else
	MENU
	fi


}

#Função responsável pela cópia de Arquivos
COP(){
	dialog --title "Aviso" --yesno "Você Deseja Continuar ?" 0 0
	if [ $? = 0 ]; then
	COPIAR=$( dialog			\
	--stdout			        \
	--nocancel                              \
	--title "O que você deseja copiar ? "	\
	--fselect /			        \
	0 0				       )

	ONDE=$( dialog			\
	--stdout			\
	--nocancel                      \
	--title "Para onde copiar?"	\
	--fselect /			\
	0 0				)

	cp $COPIAR $ONDE
	MENU
	else
	MENU
	fi

}

#Função responsável por listar os Arquivos

# Talvez haja um bug nesse modulo
LSA(){
	dialog --title "Aviso" --yesno "Você Deseja Continuar ?" 0 0
	if [ $? = 0 ]; then
	LIST=$( dialog					\
	--stdout					\
	--nocancel                                      \
	--title "Qual diretório deseja listar?"		\
	--fselect /					\
	0 0						)
	ls -l >.TEMP.txt
	dialog					\
	--title "Lista do diretorio $LIST"	\
	--textbox .TEMP.txt			\
	0 0
	rm .TEMP.txt
	MENU
	else
	MENU
	fi
}

#Função responsável pela compactação dos Arquivos
COM(){
	dialog --title "Aviso" --yesno "Você Deseja Continuar ?" 0 0
	if [ $? = 0 ]; then
	CAMI=$( dialog			    	\
	--stdout			    	\
	--nocancel                              \
	--title "Indique o caminho do arquivo"	\
	--fselect /			    	\
	0 0				    	)

	ARQUIVOS=$( dialog				\
	--stdout					\
	--nocancel                                      \
	--inputbox "Digite o nome dos arquivos"		\
	0 0)

	NAME=$( dialog					\
	--stdout 					\
	--nocancel                                      \
	--inputbox "Digite o nome do novo arquivo"	\
	0 0)

	tar -cf $NAME.tar $ARQUIVOS
	MENU
	else
	MENU
	fi
}

#Função responsável pela descompactação dos Arquivos
DES(){
	dialog --title "Aviso" --yesno "Você Deseja Continuar ?" 0 0
	if [ $? = 0 ]; then
	DIRET=$( dialog			    	\
	--stdout			    	\
	--nocancel                              \
	--title "Indique o caminho do arquivo"	\
	--fselect /			    	\
	0 0				    	)

	NAME=$( dialog					\
	--stdout 					\
	--nocancel                                      \
	--inputbox "Digite o nome do arquivo"		\
	0 0)

	CAMI=$( dialog			    		\
	--stdout			    		\
	--nocancel                                      \
	--title "Indique o diretório onde quer extrair"	\
	--fselect /			    		\
	0 0				    		)
	chmod +x $NAME
	tar -xf $NAME -C $DESCOMP
	MENU
	else
	MENU
	fi

}

#Função responsável pela permissão de Arquivos
PDA(){
	dialog --title "Aviso" --yesno "Você Deseja Continuar ?" 0 0
	if [ $? = 0 ]; then
	DIR=$( dialog					\
	--stdout					\
	--nocancel                                      \
	--title "Indique o diretório do seu arquivo"	\
	--fselect / 					\
	0 0						)
	cd $DIR
	ARQ=$( dialog 				\
	--stdout				\
	-nocancel                               \
	--inputbox "Nome do arquivo"		\
	0 0					)

	PER=$( dialog 				\
	--stdout				\
	--nocancel                              \
	--inputbox "Defina a permissão desejada"\
	0 0					)
	chmod $PER $ARQ
	MENU
	else
	MENU
	fi


}

#Função responsável pela definição do dono do Arquivo
DDA(){
	dialog --title "Aviso" --yesno "Você Deseja Continuar ?" 0 0
	if [ $? = 0 ]; then
	DIRET=$( dialog			\
	--stdout			\
	--nocancel                      \
	--title "Indique o diretório"	\
	--fselect / 			\
	0 0				)
	cd $DIRET
	ARQN=$( dialog				\
	--stdout				\
	--nocancel                              \
	--inputbox "Digite o nome do arquivo"	\
	0 0					)

	DONO=$( dialog					\
	--stdout 					\
	--nocancel                                      \
	--inputbox "Informe o novo dono do arquivo"	\
	0 0						)
	chown $DONO $ARQN
	MENU
	else
	MENU
	fi

}

#Função responsável pela remoção dos Arquivo
RMA(){
	dialog --title "Aviso" --yesno "Você Deseja Continuar ?" 0 0
	if [ $? = 0 ]; then
	REMO=$( dialog					\
	--stdout					\
	--nocancel                                      \
	--title "Selecione o arquivo para removê-lo"	\
	--fselect /					\
	0 0						)
	dialog					\
	--stdout				\
	--title "Confirme"			\
	--yesno "Quer mesmo remover $REMO?"	\
	0 0                                     \
	else
	MENU
	fi
	if [ $? = 0 ]; then
	rm $REMO
	MENU
	else
		MENU
	fi

}

#Função responsável pela remoção do Diretório
RMD(){
	dialog --title "Aviso" --yesno "Você Deseja Continuar ?" 0 0
	if [ $? = 0 ]; then
	REMO=$( dialog					\
	--stdout					\
	--nocancel                                      \
	--title "Selecione o diretório para removê-lo"	\
	--fselect /					\
	0 0						)
	dialog --stdout --title "Confirme" --yesno "Quer mesmo remover $REMO?" 0 0
	else
	MENU
	fi
	if [ $? = 0 ]; then
	rmdir $REMO
	MENU
	else
		MENU
	fi

}

MENU
