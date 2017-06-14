
#!/bin/bash

###########################################################
# Projeto Anonymous
# Módulo responsável pelo gerenciamento de Rede 
# Criadores: Alana; Daniel; Fernando; Francisco; Luiz Henrique; Vanderlei.

###########################################################

# Função Menu responsável pelas rotinas principais deste Módulo.
MENU(){
REDE=$( dialog					       \
	--stdout                        	       \
	--nocancel                                     \
	--title "Gerenciador de Rede"       	       \
	--menu "Escolha uma opção"      	       \
	0 0 0					       \
	1 "Configurar uma rede"		 	       \
	2 "Configurar duas redes"       	       \
	3 "Configurar três redes"       	       \
	4 "Configurar quatro redes"     	       \
	5 "Desligar rede"		               \
	6 "Ligar rede"			               \
	7 "Reiniciar redes"             	       \
	8 "Remover todos os endereços IPs de uma rede" \
	9 "Mostrar a configuração de um IP"            \
	10 "Mostrar todos IPs configurados"            \
	11 "Configurar uma rede via DHCP"              \
	12 "Pingar um IP configurado"                  \
	13 "Voltar"				       )

case $REDE in
1) CFUR 			    ;;
2) CFDR 			    ;;
3) CFTR 			    ;;
4) CFQR		 		    ;;
5) DSRE 			    ;;
6) LGRE 			    ;;
7) RERR 			    ;;
8) RMTP 			    ;;
9) MCIP 			    ;;
10) MTIP 			    ;;
11) CURD                            ;;
12) PICO 			    ;;
13) /home/vagrant/Projeto/./menu.sh ;;
*) PRESSIONE			    ;;
esac
}
PRESSIONE(){
dialog --msgbox "Pressione [enter] para finalizar" 0 0
dialog --msgbox "Volte Sempre" 0 0
clear
}
# Função responsável pela configuração de uma rede.
CFUR(){
dialog --title "Aviso" --yesno "Você Quer Mesmo Continuar ?" 0 0
if [ $? = 0 ]; then
IP=$( dialog --stdout --nocancel --inputbox 'Digite o número IP do eth0: ' 0 0 )
MASCARA=$( dialog --stdout --nocancel --inputbox 'Digite a Máscara de Rede do eth0: ' 0 0 )
NETWORK=$( dialog --stdout --nocancel --inputbox 'Digite a Network do eth0: ' 0 0 )
BROADCAST=$( dialog --stdout --nocancel --inputbox 'Digite o Broadcast do eth0: ' 0 0 )
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
else
MENU
fi
}

# Função responsável pela configuração de duas rede.
CFDR(){
dialog --title "Aviso" --yesno "Você Quer Mesmo Continuar ?" 0 0
if [ $? = 0 ]; then
IP=$( dialog --stdout --nocancel --inputbox 'Digite o número IP do eth0: ' 0 0 )
MASCARA=$( dialog --stdout --nocancel --inputbox 'Digite a Máscara de rede do eth0: ' 0 0 )
NETWORK=$( dialog --stdout --nocancel --inputbox 'Digite a Network do eth0: ' 0 0 )
BROADCAST=$( dialog --stdout --nocancel --inputbox 'Digite o Broadcast do eth0: ' 0 0 )
IP2=$( dialog --stdout --nocancel --inputbox 'Digite o número IP do eth1: ' 0 0 )
MASCARA2=$( dialog --stdout --nocancel --inputbox 'Digite a Máscara de rede do eth1: ' 0 0 )
NETWORK2=$( dialog --stdout --nocancel --inputbox 'Digite a Network do eth1: ' 0 0 )
BROADCAST2=$( dialog --stdout -nocancel --inputbox 'Digite o Broadcast do eth1: ' 0 0 )
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
else
MENU
fi
}

# Função responsável pela configuração de três rede.
CFTR(){
dialog --title "Aviso" --yesno "Você Quer Mesmo Continuar ?" 0 0
if [ $? = 0 ]; then
IP=$( dialog --stdout --nocancel --inputbox 'Digite o número IP do eth0: ' 0 0 )
MASCARA=$( dialog --stdout --nocancel --inputbox 'Digite a Máscara de rede do eth0: ' 0 0 )
NETWORK=$( dialog --stdout --nocancel --inputbox 'Digite a Network do eth0: ' 0 0 )
BROADCAST=$( dialog --stdout --nocancel --inputbox 'Digite o Broadcast do eth0: ' 0 0 )
IP2=$( dialog --stdout --nocancel --inputbox 'Digite o número IP do eth1: ' 0 0 )
MASCARA2=$( dialog --stdout --nocancel --inputbox 'Digite a Máscara de rede do eth1: ' 0 0 )
NETWORK2=$( dialog --stdout --nocancel --inputbox 'Digite a Network do eth1: ' 0 0 )
BROADCAST2=$( dialog --stdout --nocancel --inputbox 'Digite o Broadcast do eth1: ' 0 0 )
IP3=$( dialog --stdout --nocancel --inputbox 'Digite o número IP do eth2: ' 0 0 )
MASCARA3=$( dialog --stdout --nocancel --inputbox 'Digite a Máscara de rede do eth2: ' 0 0 )
NETWORK3=$( dialog --stdout --nocancel --inputbox 'Digite a Network do eth2: ' 0 0 )
BROADCAST3=$( dialog --stdout --nocancel --inputbox 'Digite o Broadcast do eth2: ' 0 0 )
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
   iface eth2 inet static
   address $IP3
   netmask $MASCARA3
   network $NETWORK3
   broadcast $BROADCAST3" > /etc/network/interfaces
dialog --msgbox "Redes configuradas com sucesso " 0 0
MENU
else
MENU
fi
}

# Função responsável pela configuração de quatro rede.
CFQR(){
dialog --title "Aviso" --yesno "Você Quer Mesmo Continuar ?" 0 0
if [ $? = 0 ]; then
IP=$( dialog --stdout --nocancel --inputbox 'Digite o número IP do eth0: ' 0 0 )
MASCARA=$( dialog --stdout --nocancel --inputbox 'Digite a Máscara de rede do eth0: ' 0 0 )
NETWORK=$( dialog --stdout --nocancel --inputbox 'Digite a Network do eth0: ' 0 0 )
BROADCAST=$( dialog --stdout --nocancel --inputbox 'Digite o Broadcast do eth0: ' 0 0 )
IP2=$( dialog --stdout --nocancel --inputbox 'Digite o número IP do eth1: ' 0 0 )
MASCARA2=$( dialog --stdout --nocancel --inputbox 'Digite a Máscara de rede do eth1: ' 0 0 )
NETWORK2=$( dialog --stdout --nocancel --inputbox 'Digite a Network do eth1: ' 0 0 )
BROADCAST2=$( dialog --stdout --nocancel --inputbox 'Digite o Broadcast do eth1: ' 0 0 )
IP3=$( dialog --stdout --nocancel --inputbox 'Digite o número IP do eth2: ' 0 0 )
MASCARA3=$( dialog --stdout --nocancel --inputbox 'Digite a Máscara de rede do eth2: ' 0 0 )
NETWORK3=$( dialog --stdout --nocancel --inputbox 'Digite a Network do eth2: ' 0 0 )
BROADCAST3=$( dialog --stdout --nocancel --inputbox 'Digite o Broadcast do eth2: ' 0 0 )
IP4=$( dialog --stdout --nocancel --inputbox 'Digite o número IP do eth3: ' 0 0 )
MASCARA4=$( dialog --stdout --nocancel --inputbox 'Digite a Máscara de Rede do eth3: ' 0 0 )
NETWORK4=$( dialog --stdout --nocancel --inputbox 'Digite a Network do eth3: ' 0 0 )
BROADCAST4=$( dialog --stdout --nocancel --inputbox 'Digite o Broadcast do eth3: ' 0 0 )
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
   iface eth2 inet static
   address $IP3
   netmask $MASCARA3
   network $NETWORK3
   broadcast $BROADCAST3
   # Quarta Interface de Rede
   auto eth3
   allow-hotplug eth3
   iface eth3 inet static
   address $IP4
   netmask $MASCARA4
   network $NETWORK4
   broadcast $BROADCAST4" > /etc/network/interfaces

dialog --msgbox "Redes configuradas com sucesso " 0 0
MENU
else
MENU
fi
}

# Função responsável por desligar a rede.
DSRE(){
dialog --title "Aviso" --yesno "Você Quer Mesmo Continuar ?" 0 0
if [ $? = 0 ]; then
REDE=$( dialog --stdout --nocancel --inputbox 'Qual rede você deseja desligar ? ' 0 0 )
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
else
MENU
fi
}

# Função responsável por ligar a rede.
LGRE(){
dialog --title "Aviso" --yesno "Você Quer Mesmo Continuar ?" 0 0
if [ $? = 0 ]; then
REDE=$( dialog --stdout --nocancel --inputbox 'Qual rede você deseja ligar ? ' 0 0 )
ifup $REDE > REDE &
echo '10' | dialog --stdout --nocancel --gauge 'Ligando aguarde....' 0 0 0
sleep 2
echo '30' | dialog --stdout --nocancel --gauge 'Ligando aguarde....' 0 0 0
sleep 2
echo '60' | dialog --stdout --nocancel 'Ligando aguarde....' 0 0 0
sleep 2
echo '100' | dialog --stdout --nocancel 'Ligando aguarde....' 0 0 0
sleep 2
dialog --stdout --msgbox 'Rede ligada com sucesso ' 0 0
rm REDE
MENU
else
MENU
fi
}

# Função responsável por reiniciar a rede.
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
	MENU
else
	dialog --msgbox "Operação cancelada" 0 0
	MENU
fi
}

# Função responsável por remover todos os endereços IPs de uma rede.
RMTP(){
dialog --title "Aviso" --yesno "Você Quer Mesmo Continuar ?" 0 0
if [ $? = 0 ]; then
REDE=$( dialog --stdout --nocancel --inputbox 'Qual rede você deseja remover os endereços IP ? ' 0 0 )
ip addr flush dev $REDE > REDE
dialog --msgbox 'Todos endereços IPs foram removidos com sucesso' 0 0
rm REDE
MENU
else
MENU
fi
}

# Função responsável por mostrar a configuração de um ip.
MCIP(){
dialog --title "Aviso" --yesno "Você Quer Mesmo Continuar ?" 0 0
if [ $? = 0 ]; then
MOSTRAR=$( dialog --stdout --inputbox 'Digite a rede: ' 0 0 )
ip addr show dev $MOSTRAR > MOSTRAR.txt
dialog --textbox MOSTRAR.txt 0 0
rm MOSTRAR.txt
MENU
else
MENU
fi
}

# Função responsável por mostrar todos os ip configurados.
MTIP(){
ip addr > IP.txt
dialog --textbox IP.txt 0 0
rm IP.txt
MENU
}

# Função responsável por configuração de uma rede por DHCP.
CURD(){
dialog --title "Aviso" --yesno "Você Quer Mesmo Continuar ?" 0 0
if [ $? = 0 ]; then
DHCP=$( dialog --stdout --nocancel --inputbox 'Qual rede você deseja configurar ? ' 0 0 )
dhclient $DHCP > DHCP
dialog --msgbox  'Rede configurada com sucesso ' 0 0
rm DHCP
MENU
fi
}

# Função responsável por pingar um ip configurado.
PICO(){
dialog --title "Aviso" --yesno "Você Quer Mesmo Continuar ?" 0 0
if [ $? = 0 ]; then
PINGAR=$( dialog --stdout --nocancel --inputbox 'Qual o IP da rede ? ' 0 0 )
ping -c 6 $PINGAR > PING &
dialog --tailbox PING 70 70
rm PING
MENU
else
MENU
fi
}
MENU
