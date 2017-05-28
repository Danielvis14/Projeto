#!/bin/bash

###########################################################
# Projeto Anonymous
# Módulo responsável pelo gerenciamento de Usuários
# Criadores: Alana; Daniel; Fernando; Francisco; Luiz Henrique; Vanderlei.

###########################################################

#Janelas de Diálogo responsável pelo cadastro.
 dialog	--stdout --yesno "Você já tem cadastro ?" 0 0  

if [ $? = 0 ]; then
 dialog --stdout --title "Login" --inputbox "Coloque o usuário:" 0
 dialog --stdout --title "Senha" --passwordbox "Coloque a senha:" 0 0 )


else
 dialog --stdout --inputbox "Digite o nome desejado:" 0 0 )
	
 dialog --stdout --title "Nova senha" --passwordbox "Coloque sua senha:" 0 0 )
	$SENHA >>Users.txt

 dialog --stdout --title "Login" --inputbox "Coloque o usuário" 0 0 )
 dialog --stdout --title "Login" --passwordbox "Coloque a senha:" 0 0 )

fi


