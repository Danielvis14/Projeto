#!bin/bash
MENU(){
REDE=$( dialog				\
	--stdout                        \
	--title "GERENCIADOR DE REDE"   \
	--menu "Escolha uma opção"      \
	0 0 0				\
	1 "Configurar Uma Rede"		\
	2 "Desligar Rede"		\
	3 "Ligar Rede"			\
	4 "Reiniciar Redes"             \
	5 "SAIR")

case $REDE in
1) CFRR ;;
2) DSRE ;;
3) LGRE ;;
4) RERR ;;
5) exit 0

esac
}
CFRR(){
IP=$( dialog --stdout --inputbox 'Digite o número IP: ' 0 0 )
MASCARA=$( dialog --stdout --inputbox 'Digite a Mascará de Rede: ' 0 0 )
NETWORK=$( dialog --stdout --inputbox 'Digite a Network: ' 0 0 )
BROADCAST=$( dialog --stdout --inputbox 'Digite o Broadcast: ' 0 0 )
echo "   auto lo
   iface lo inet loopback

   # The primary network interface
   auto eth0
   iface eth0 inet static
   address $IP
   netmask $MASCARA
   network $NETWORK
   broadcast $BROADCAST" > /etc/network/interfaces
}
DSRE(){
REDE=$( dialog --stdout --inputbox 'Qual Rede Você Deseja Desligar ? ' 0 0 )
ifdown $REDE > REDE &
echo '10' | dialog --stdout --gauge 'Desligando Aguarde....' 0 0 0
sleep 2
echo '30' | dialog --stdout --gauge 'Desligando Aguarde....' 0 0 0
sleep 2
echo '60' | dialog --stdout --gauge 'Desligando Aguarde....' 0 0 0
sleep 2
echo '100' | dialog --stdout --gauge 'Desligando Aguarde....' 0 0 0
sleep 2

dialog --stdout --msgbox 'Rede Desligada Com Sucesso' 0 0
MENU
}
LGRE(){
REDE=$( dialog --stdout --inputbox 'Qual Rede Você Deseja Ligar ? ' 0 0 0 )
ifup $REDE > REDE &
echo '10' | dialog --stdout --gauge 'Ligando Aguarde....' 0 0 0
sleep 2
echo '30' | dialog --stdout --gauge 'Ligando Aguarde....' 0 0 0
sleep 2
echo '60' | dialog --stdout --gauge 'Ligando Aguarde....' 0 0 0
sleep 2
echo '100' | dialog --stdout --gauge 'Ligando Aguarde....' 0 0 0
sleep 2
dialog --stdout --msgbox 'Rede Ligada Com Sucesso ' 0 0
MENU
}
RERR(){
REINICIAR=$( dialog --stdout --yesno 'Você Deseja Reiniciar As Redes ? ' 0 0 )
if [ $? = 0 ]; then
	service networking restart &
	echo '10' | dialog --stdout --gauge 'Reiniciando Aguarde....' 0 0 0
	sleep 2
	echo '30' | dialog --stdout --gauge 'Reiniciando Aguarde....' 0 0 0
	sleep 2
	echo '60' | dialog --stdout --gauge 'Reiniciando Aguarde....' 0 0 0
	sleep 2
	echo '100' | dialog --stdout --gauge 'Reiniciando Aguarde....' 0 0 0
	sleep 2
	dialog --stdout --msgbox "Reiniciado Com Sucesso" 0 0
else
	dialog --msgbox "Operação Cancelada" 0 0
fi
MENU
}
MENU
