#!bin/bash
MENU(){
REDE=$( dialog				\
	--stdout                        \
	--title "GERENCIADOR DE REDE"   \
	--menu "Escolha uma opção"      \
	0 0 0				\
	1 "Configurar Rede"		\
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

MENU
