#!bin/bash
MENU(){
Repositorio=$(dialog                       	     	\
 	--stdout                      	 	   	\
	--title "GERENCIADOR DE REPOSITÓRIOS"           \
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
12) clear;exit 0 ;;
*) echo "Opção Invalida. Digite Novamente"; PRESSIONE ;;
esac
}

PRESSIONE(){
 dialog --msgbox "Pressione [enter] para finalizar" 0 0
}

ATOR(){
dialog --stdout --yesno "Quer Atualizar Os Repositórios ?" 0 0

if [ $? = 0 ]; then
	apt-get update --assume-yes > atualização &
	echo "10" | dialog --gauge " ATUALIZANDO AGUARDE..." 0 0 0
	sleep 2
	echo "30" | dialog --gauge " ATUALIZANDO AGUARDE..." 0 0 0
	sleep 2
	echo "50" | dialog --gauge " ATUALIZANDO AGUARDE..." 0 0 0
	sleep 2
	echo "70" | dialog --gauge " ATUALIZANDO AGUARDE..." 0 0 0
	sleep 2
	echo "100" | dialog --gauge " ATUALIZANDO AGUARDE..." 0 0 0
	sleep 2
	dialog --msgbox "Atualizado Com Sucesso! " 0 0
else
	dialog --msgbox "Operação Cancelada" 0 0
fi

MENU
}
ATP(){
dialog --stdout --yesno "Quer Atualizar Os Pacotes ?" 0 0
if [ $? = 0 ]; then
	apt-get upgrade --assume-yes > atualização &
	echo "10" | dialog --gauge "ATUALIZANDO AGUARDE ..." 0 0 0
	sleep 2
	echo "30" | dialog --gauge "ATUALIZANDO AGUARDE ..." 0 0 0
	sleep 2
	echo "50" | dialog --gauge "ATUALIZANDO AGUARDE ..." 0 0 0
	sleep 2
	echo "70" | dialog --gauge "ATUALIZANDO AGUARDE ..." 0 0 0
	sleep 2
	echo "90" | dialog --gauge "ATUALIZANDO AGUARDE ..." 0 0 0
	sleep 2
	echo "100" | dialog --gauge "ATUALIZANDO AGUARDE ..." 0 0 0
	sleep 2
	dialog --msgbox "Atualizado Com Sucesso! " 0 0
	rm atualização
else
	dialog --msgbox "Operação Cancelada" 0 0
fi
MENU
}
RMDP(){
pacote=$( dialog --stdout --inputbox "Qual O Nome Do Pacote ?" 0 0 )
dialog --yesno "Você Quer Mesmo Remover ?" 0 0
if [ $? = 0 ]; then
apt-get purge $pacote --assume-yes > pacotao &
	echo "10" | dialog --gauge "REMOVENDO AGUARDE ..." 0 0 0
	sleep 2
	echo "30" | dialog --gauge "REMOVENDO AGUARDE ..." 0 0 0
	sleep 2
	echo "50" | dialog --gauge "REMOVENDO AGUARDE ..." 0 0 0
	sleep 2
	echo "70" | dialog --gauge "REMOVENDO AGUARDE ..." 0 0 0
	sleep 2
	echo "90" | dialog --gauge "REMOVENDO AGUARDE ..." 0 0 0
	sleep 2
	echo "100" | dialog --gauge "REMOVENDO AGUARDE ..." 0 0 0
	sleep 2
	dialog --msgbox "Removido Com Sucesso" 0 0
	rm pacotao
else
	dialog --msgbox "OPERAÇÃO CANCELADA" 0 0
fi
MENU
}
ATPD(){
dialog --stdout --yesno "Quer Atualizar Os Pacotes e Remover Dependências Antiga ?" 0 0
if [ $? = 0 ]; then
	apt-get dist-upgrade --assume-yes > atualização &
	echo "10" | dialog --gauge "ATUALIZANDO PACOTES E REMOVENDO DEPENDÊNCIAS AGUARDE ..." 0 0 0
	sleep 2
	echo "30" | dialog --gauge "ATUALIZANDO PACOTES E REMOVENDO DEPENDÊNCIAS AGUARDE ..." 0 0 0
	sleep 2
	echo "50" | dialog --gauge "ATUALIZANDO PACOTES E REMOVENDO DEPENDÊNCIAS AGUARDE ..." 0 0 0
	sleep 2
	echo "70" | dialog --gauge "ATUALIZANDO PACOTES E REMOVENDO DEPENDÊNCIAS AGUARDE ..." 0 0 0
	sleep 2
	echo "90" | dialog --gauge "ATUALIZANDO PACOTES E REMOVENDO DEPENDÊNCIAS AGUARDE ..." 0 0 0
	sleep 2
	echo "100" | dialog --gauge "ATUALIZANDO PACOTES E REMOVENDO DEPENDÊNCIAS AGUARDE ..." 0 0 0
	sleep 2
	dialog --msgbox "Atualizado Com Sucesso! " 0 0
	rm atualização
else
	dialog --msgbox "OPERAÇÃO CANCELADA" 0 0
fi
MENU
}
ATRP(){
dialog --stdout --yesno "Quer Atualizar Os Pacotes e Repositórios ? " 0 0
if [ $? = 0 ]; then
	apt-get update && apt-get upgrade --assume-yes > atualização &
	echo "10" | dialog --gauge "ATUALIZANDO PACOTES E REPOSITÓRIOS AGUARDE ..." 0 0 0
	sleep 2
	echo "30" | dialog --gauge "ATUALIZANDO PACOTES E REPOSITÓRIOS AGUARDE ..." 0 0 0
	sleep 2
	echo "50" | dialog --gauge "ATUALIZANDO PACOTES E REPOSITÓRIOS AGUARDE ..." 0 0 0
	sleep 2
	echo "70" | dialog --gauge "ATUALIZANDO PACOTES E REPOSITÓRIOS AGUARDE ..." 0 0 0
	sleep 2
	echo "90" | dialog --gauge "ATUALIZANDO PACOTES E REPOSITÓRIOS AGUARDE ..." 0 0 0
	sleep 2
	echo "100" | dialog --gauge "ATUALIZANDO PACOTES E REPOSITÓRIOS AGUARDE ..." 0 0 0
	sleep 2
	dialog --tailbox atualização 80 90
	dialog --msgbox "Atualizado Com Sucesso! " 0 0
	rm atualização
else
	dialog --msgbox "Operação Cancelada" 0 0
fi
MENU
}
ISUP(){
INSTALAR=$( dialog --stdout --inputbox 'Digite Nome Do Pacote' 0 0 )
dialog --yesno "Realmente Deseja Instalar O Pacote ?" 0 0
if [ $? = 0 ]; then
apt-get install $INSTALAR > INSTALANDO &
	echo "10" | dialog --gauge "INSTALANDO PACOTE AGUARDE ..." 0 0 0
	sleep 3
	echo "30" | dialog --gauge "INSTALANDO PACOTE AGUARDE ..." 0 0 0
	sleep 5
	echo "50" | dialog --gauge "INSTALANDO PACOTE AGUARDE ..." 0 0 0
	sleep 3
	echo "70" | dialog --gauge "INSTALANDO PACOTE AGUARDE ..." 0 0 0
	sleep 3
	echo "80" | dialog --gauge "INSTALANDO PACOTE AGUARDE ..." 0 0 0
	sleep 2
	echo "90" | dialog --gauge "INSTALANDO PACOTE AGUARDE ..." 0 0 0
	sleep 2
	echo "100" | dialog --gauge "INSTALANDO PACOTE AGUARDE ..." 0 0 0
	sleep 1
	rm INSTALANDO
	--msgbox "INSTALADO COM SUCESSO"
else
	dialog --msgbox "OPERAÇÃO CANCELADA" 0 0
fi
MENU
}
REUP(){
REINSTALAR=$( dialog --stdout --inputbox 'Digite Nome Do Pacote' 0 0 )
dialog --yesno "Você Quer Reinstalar O Pacote ? " 0 0
if [ $? = 0 ]; then
	apt-get install $REINSTALAR --reinstall --assume-yes > REINSTALL &
	echo "10" | dialog --gauge "REINSTALANDO PACOTE AGUARDE ..." 0 0 0
	sleep 5
	echo "30" | dialog --gauge "REINSTALANDO PACOTE AGUARDE ..." 0 0 0
	sleep 3
	echo "50" | dialog --gauge "REINSTALANDO PACOTE AGUARDE ..." 0 0 0
	sleep 3
	echo "70" | dialog --gauge "REINSTALANDO PACOTE AGUARDE ..." 0 0 0
	sleep 2
	echo "90" | dialog --gauge "REINSTALANDO PACOTE AGUARDE ..." 0 0 0
	sleep 2
	echo "100" | dialog --gauge "REINSTALANDO PACOTE AGUARDE ..." 0 0 0
	sleep 1
	dialog --msgbox "REINSTALADO COM SUCESSO"
else
	dialog --msgbox "OPERAÇÃO CANCELADA" 0 0
fi
	rm REINSTALL
MENU
}
PUPI(){
PESQUISA=$( dialog --stdout --inputbox "Digite O Nome Do Pacote: " 0 0 )
apt-cache search $PESQUISA >> PESQUISA.txt
dialog --textbox PESQUISA.txt 90 80
rm PESQUISA.txt
MENU
}

RMUP(){
REMOVER=$( dialog --stdout --inputbox "Digite O Nome Do Pacote: " 0 0 )
dialog --yesno "Você Realmente Deseja Remover O Pacote ? " 0 0
if [ $? = 0 ]; then
	apt-get remove $REMOVER > REMOVER &
	echo "10" | dialog --gauge "REMOVENDO PACOTE AGUARDE ..." 0 0 0
	sleep 3
	echo "30" | dialog --gauge "REMOVENDO PACOTE AGUARDE ..." 0 0 0
	sleep 2
	echo "50" | dialog --gauge "REMOVENDO PACOTE AGUARDE ..." 0 0 0
	sleep 2
	echo "90" | dialog --gauge "REMOVENDO PACOTE AGUARDE ..." 0 0 0
	sleep 2
	echo "100" | dialog --gauge "REMOVENDO PACOTE AGUARDE ..." 0 0 0
	sleep 1
	dialog --msbox "REMOVIDO COM SUCESSO " 0 0


else
	dialog --msgbox "OPERAÇÃO CANCELADA" 0 0

fi
	rm REMOVER
MENU
}
RMPC(){
PACOTE=$( dialog --stdout --inputbox "Digite O Nome Do Pacote : " 0 0 )
dialog --yesno "Você Realmente Deseja Remover O Pacote E Suas Configurações ? " 0 0

if [ $? = 0 ]; then
	apt-get autoremove $PACOTE > PACOTAO &
	echo "10" | dialog --gauge "REMOVENDO PACOTE E SUAS CONFIGURAÇÕES AGUARDE ..." 0 0 0
	sleep 3
	echo "30" | dialog --gauge "REMOVENDO PACOTE E SUAS CONFIGURAÇÕES AGUARDE ..." 0 0 0
	sleep 3
	echo "50" | dialog --gauge "REMOVENDO PACOTE E SUAS CONFIGURAÇÕES AGUARDE ..." 0 0 0
	sleep 3
	echo "70" | dialog --gauge "REMOVENDO PACOTE E SUAS CONFIGURAÇÕES AGUARDE ..." 0 0 0
	sleep 3
	echo "90" | dialog --gauge "REMOVENDO PACOTE E SUAS CONFIGURAÇÕES AGUARDE ..." 0 0 0
	sleep 2
	echo "100" | dialog --gauge "REMOVENDO PACOTE E SUAS CONFIGURAÇÕES AGUARDE ..." 0 0 0
	sleep 1
	dialog --msbox "Pacote Removido Com Sucesso " 0 0
else
	dialog --msgbox "OPERAÇÃO CANCELADA " 0 0
fi
	rm PACOTAO
MENU
}
LPIS(){
dpkg --get-selections >> LISTA.txt
dialog --textbox LISTA.txt 150 200
rm LISTA.txt
MENU
}
MENU
