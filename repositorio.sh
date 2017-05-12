1#!bin/bash
MENU(){
Repositorio=$(dialog                       	     	\
 	--stdout                      	 	   	\
	--title "Repositorio"        	 	   	\
 	--menu  "Escolha uma opção"  	  	   	\
	0 0 0                        	 	   	\
	1 "Atualizar Os Repositórios"              	\
	2 "Atualizar Pacotes"                      	\
	3 "Remover Dependencias De Um Pacote"           \
	4 "Atualizar Pacotes e Remover As Dependências" \
	5 "Atualizar Repositórios e Pacotes"		\
	6 "Instalar Um Pacote" 	         	   	\
	7 "Reinstalar Um Pacote"                        \
	8 "Procurar Um Pacote Instalado" 	   	\
	9 "Remover Um Pacote"        	 	   	\
	10 "Remover Um Pacote e Suas Configurações" 	\
	11 "Listar Pacotes Instalados"              	\
	12 "SAIR")

case $Repositorio in
1) ATOR  ;;
2) ATP   ;;
3) RMDP  ;;
4) ATPD  ;;
5) ATRP  ;;
6) ISUP  ;;
7) REUP  ;;
8) PUPI  ;;
9) RMUP  ;;
10) RMPC ;;
11) LPIS ;;
12) clear; exit 0 ;;
*) echo "Opção Invalida. Digite Novamente"; PRESSIONE ;;
esac
}

PRESSIONE(){
 dialog --msgbox "Pressione [enter] para finalizar" 0 0
}

ATOR(){
dialog --stdout --yesno "Quer Atualizar Os Repositórios ?" 0 0

if [ $? = 0 ]; then
	apt-get update > atualização &
	dialog --tailboxbg atualização 80 90
	dialog --msgbox "Atualizado Com Sucesso! " 0 0
	rm atualização
else
	dialog --msgbox "Operação Cancelada" 0 0
fi

MENU

}
ATP(){
#FALTA OPÇÃO DE SIM E NÃO
dialog --stdout --yesno "Quer Atualizar Os Pacotes ?" 0 0
if [ $? = 0 ]; then
	apt-get upgrade > atualização &
	dialog --tailbox atualização 80 90
	dialog --msgbox "Atualizado Com Sucesso! " 0 0
	rm atualização
else
	dialog --msgbox "Operação Cancelada" 0 0
fi
}
RMDP(){
pacote=$( dialog --stdout --inputbox "Qual O Nome Do Pacote ?" 0 0 )
apt-get remove $pacote > pacotao &
dialog --tailbox pacote 0 0
dialog --msgbox "Removido Com Sucesso" 0 0
MENU
}

MENU
