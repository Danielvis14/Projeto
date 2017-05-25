#!bin/bash
MENU(){
REDE=$( dialog					       \
	--stdout                        	       \
	--title "GERENCIADOR DE REDE"       \
	--menu "Escolha uma opção"      	       \
	0 0 0					       \
	1 "Configurar uma rede"		 	       \
	2 "Configurar duas redes"       	       \
	3 "Configurar três redes"       	       \
	4 "Configurar quatro redes"     	       \
	5 "Desligar rede"		               \
	6 "Ligar rede"			               \
	7 "Reiniciar redes"             	       \
	8 "Remover todos os endereços IPs de uma rede"  \
	9 "Mostrar a configuração de um IP"            \
	10 "Mostrar todos IPs configurados"            \
	11 "Configurar uma rede via DHCP"              \
	12 "Pingar um IP configurado"                 \
	13 "SAIR")

case $REDE in
1) CFUR ;;
2) CFDR ;;
3) CFTR ;;
4) CFQR ;;
5) DSRE ;;
6) LGRE ;;
7) RERR ;;
8) RMTP ;;
9) MCIP ;;
10) MTIP ;;
11) CURD ;;
12) PICO ;;
13) exit 0

esac
}
CFUR(){
IP=$( dialog --stdout --inputbox 'Digite o número IP do eth0: ' 0 0 )
MASCARA=$( dialog --stdout --inputbox 'Digite a Máscara de Rede do eth0: ' 0 0 )
NETWORK=$( dialog --stdout --inputbox 'Digite a Network do eth0: ' 0 0 )
BROADCAST=$( dialog --stdout --inputbox 'Digite o Broadcast do eth0: ' 0 0 )
echo "   auto lo
   iface lo inet loopback

   # Primeira Interface de Rede
   auto eth0
   allow-hotplug eth0
   iface eth0 inet static
   address $IP
   netmask $MASCARA
   network $NETWORK
   broadcast $BROADCAST" > /etc/network/interfaces
dialog --stdout --msgbox "Rede configurada com sucesso " 0 0
MENU
}
CFDR(){
IP=$( dialog --stdout --inputbox 'Digite o número IP do eth0: ' 0 0 )
MASCARA=$( dialog --stdout --inputbox 'Digite a Máscara de rede do eth0: ' 0 0 )
NETWORK=$( dialog --stdout --inputbox 'Digite a Network do eth0: ' 0 0 )
BROADCAST=$( dialog --stdout --inputbox 'Digite o Broadcast do eth0: ' 0 0 )
IP2=$( dialog --stdout --inputbox 'Digite o número IP do eth1: ' 0 0 )
MASCARA2=$( dialog --stdout --inputbox 'Digite a Máscara de rede do eth1: ' 0 0 )
NETWORK2=$( dialog --stdout --inputbox 'Digite a Network do eth1: ' 0 0 )
BROADCAST2=$( dialog --stdout --inputbox 'Digite o Broadcast do eth1: ' 0 0 )
echo "   auto lo
   iface lo inet loopback

   # Primeira Interface de Rede
   auto eth0
   allow-hotplug eth0
   iface eth0 inet static
   address $IP
   netmask $MASCARA
   network $NETWORK
   broadcast $BROADCAST
   # Segunda Interface de Rede
   auto eth1
   allow-hotplug eth1
   iface eth1 inet static
   address $IP2
   netmask $MASCARA2
   network $NETWORK2
   broadcast $BROADCAST2" > /etc/network/interfaces
dialog --msgbox "Redes configuradas com sucesso " 0 0
MENU
}
CFTR(){
IP=$( dialog --stdout --inputbox 'Digite o número IP do eth0: ' 0 0 )
MASCARA=$( dialog --stdout --inputbox 'Digite a Máscara de rede do eth0: ' 0 0 )
NETWORK=$( dialog --stdout --inputbox 'Digite a Network do eth0: ' 0 0 )
BROADCAST=$( dialog --stdout --inputbox 'Digite o Broadcast do eth0: ' 0 0 )
IP2=$( dialog --stdout --inputbox 'Digite o número IP do eth1: ' 0 0 )
MASCARA2=$( dialog --stdout --inputbox 'Digite a Máscara de rede do eth1: ' 0 0 )
NETWORK2=$( dialog --stdout --inputbox 'Digite a Network do eth1: ' 0 0 )
BROADCAST2=$( dialog --stdout --inputbox 'Digite o Broadcast do eth1: ' 0 0 )
IP3=$( dialog --stdout --inputbox 'Digite o número IP do eth2: ' 0 0 )
MASCARA3=$( dialog --stdout --inputbox 'Digite a Máscara de rede do eth2: ' 0 0 )
NETWORK3=$( dialog --stdout --inputbox 'Digite a Network do eth2: ' 0 0 )
BROADCAST3=$( dialog --stdout --inputbox 'Digite o Broadcast do eth2: ' 0 0 )
echo "   auto lo
   iface lo inet loopback

   # Primeira Interface de Rede
   auto eth0
   allow-hotplug eth0
   iface eth0 inet static
   address $IP
   netmask $MASCARA
   network $NETWORK
   broadcast $BROADCAST
   # Segunda Interface de Rede
   auto eth1
   allow-hotplug eth1
   iface eth1 inet static
   address $IP2
   netmask $MASCARA2
   network $NETWORK2
   broadcast $BROADCAST2
   # Terceira Interface de Rede
   auto eth2
   allow-hotplug eth2
   iface eth1 inet static
   address $IP3
   netmask $MASCARA3
   network $NETWORK3
   broadcast $BROADCAST3" > /etc/network/interfaces
dialog --msgbox "Redes configuradas com sucesso " 0 0
MENU
}
CFQR(){
IP=$( dialog --stdout --inputbox 'Digite o número IP do eth0: ' 0 0 )
MASCARA=$( dialog --stdout --inputbox 'Digite a Máscara de rede do eth0: ' 0 0 )
NETWORK=$( dialog --stdout --inputbox 'Digite a Network do eth0: ' 0 0 )
BROADCAST=$( dialog --stdout --inputbox 'Digite o Broadcast do eth0: ' 0 0 )
IP2=$( dialog --stdout --inputbox 'Digite o número IP do eth1: ' 0 0 )
MASCARA2=$( dialog --stdout --inputbox 'Digite a Máscara de rede do eth1: ' 0 0 )
NETWORK2=$( dialog --stdout --inputbox 'Digite a Network do eth1: ' 0 0 )
BROADCAST2=$( dialog --stdout --inputbox 'Digite o Broadcast do eth1: ' 0 0 )
IP3=$( dialog --stdout --inputbox 'Digite o número IP do eth2: ' 0 0 )
MASCARA3=$( dialog --stdout --inputbox 'Digite a Máscara de rede do eth2: ' 0 0 )
NETWORK3=$( dialog --stdout --inputbox 'Digite a Network do eth2: ' 0 0 )
BROADCAST3=$( dialog --stdout --inputbox 'Digite o Broadcast do eth2: ' 0 0 )
IP4=$( dialog --stdout --inputbox 'Digite o número IP do eth3: ' 0 0 )
MASCARA4=$( dialog --stdout --inputbox 'Digite a Máscara de Rede do eth3: ' 0 0 )
NETWORK4=$( dialog --stdout --inputbox 'Digite a Network do eth3: ' 0 0 )
BROADCAST4=$( dialog --stdout --inputbox 'Digite o Broadcast do eth3: ' 0 0 )
echo "   auto lo
   iface lo inet loopback

   # Primeira Interface de Rede
   auto eth0
   allow-hotplug eth0
   iface eth0 inet static
   address $IP
   netmask $MASCARA
   network $NETWORK
   broadcast $BROADCAST
   # Segunda Interface de Rede
   auto eth1
   allow-hotplug eth1
   iface eth1 inet static
   address $IP2
   netmask $MASCARA2
   network $NETWORK2
   broadcast $BROADCAST2
   # Terceira Interface de Rede
   auto eth2
   allow-hotplug eth2
   iface eth1 inet static
   address $IP3
   netmask $MASCARA3
   network $NETWORK3
   broadcast $BROADCAST3
   # Quarta Interface de Rede
   auto eth2
   allow-hotplug eth2
   iface eth1 inet static
   address $IP4
   netmask $MASCARA4
   network $NETWORK4
   broadcast $BROADCAST4" > /etc/network/interfaces

dialog --msgbox "Redes configuradas com sucesso " 0 0
MENU
}
DSRE(){
REDE=$( dialog --stdout --inputbox 'Qual rede você deseja desligar ? ' 0 0 )
ifdown $REDE > REDE &
echo '10' | dialog --stdout --gauge 'Desligando aguarde....' 0 0 0
sleep 2
echo '30' | dialog --stdout --gauge 'Desligando aguarde....' 0 0 0
sleep 2
echo '60' | dialog --stdout --gauge 'Desligando aguarde....' 0 0 0
sleep 2
echo '100' | dialog --stdout --gauge 'Desligando aguarde....' 0 0 0
sleep 2
dialog --stdout --msgbox 'Rede desligada com sucesso' 0 0
rm REDE
MENU
}
LGRE(){
REDE=$( dialog --stdout --inputbox 'Qual rede você deseja ligar ? ' 0 0 )
ifup $REDE > REDE &
echo '10' | dialog --stdout --gauge 'Ligando aguarde....' 0 0 0
sleep 2
echo '30' | dialog --stdout --gauge 'Ligando aguarde....' 0 0 0
sleep 2
echo '60' | dialog --stdout --gauge 'Ligando aguarde....' 0 0 0
sleep 2
echo '100' | dialog --stdout --gauge 'Ligando aguarde....' 0 0 0
sleep 2
dialog --stdout --msgbox 'Rede ligada com sucesso ' 0 0
rm REDE
MENU
}
RERR(){
REINICIAR=$( dialog --stdout --yesno 'Você deseja reiniciar as redes ? ' 0 0 )
if [ $? = 0 ]; then
	service networking restart &
	echo '10' | dialog --stdout --gauge 'Reiniciando aguarde....' 0 0 0
	sleep 2
	echo '30' | dialog --stdout --gauge 'Reiniciando aguarde....' 0 0 0
	sleep 2
	echo '60' | dialog --stdout --gauge 'Reiniciando aguarde....' 0 0 0
	sleep 2
	echo '100' | dialog --stdout --gauge 'Reiniciando aguarde....' 0 0 0
	sleep 2
	dialog --stdout --msgbox "Reiniciado com sucesso" 0 0
else
	dialog --msgbox "Operação cancelada" 0 0
fi
MENU
}
RMTP(){
REDE=$( dialog --stdout --inputbox 'Qual rede você deseja remover os endereços IP ? ' 0 0 )
ip addr flush dev $REDE > REDE
dialog --msgbox 'Todos endereços IPs foram removidos com sucesso' 0 0
rm REDE
MENU
}
MCIP(){
MOSTRAR=$( dialog --stdout --inputbox 'Digite a rede: ' 0 0 )
ip addr show dev $MOSTRAR > MOSTRAR.txt
dialog --textbox MOSTRAR.txt 0 0
rm MOSTRAR.txt
MENU
}
MTIP(){
ip addr > IP.txt
dialog --textbox IP.txt 0 0
rm IP.txt
MENU
}
CURD(){
DHCP=$( dialog --stdout --inputbox 'Qual rede você deseja configurar ? ' 0 0 )
dhclient $DHCP > DHCP
dialog --msgbox  'Rede configurada com sucesso ' 0 0
rm DHCP
MENU
}
PICO(){
PINGAR=$( dialog --stdout --inputbox 'Qual o IP da rede ? ' 0 0 )
ping -c 6 $PINGAR > PING &
dialog --tailbox PING 70 70
rm PING
MENU
}
MENU
