#!/bin/bash

for search in $(cat $2);
do
	# Realiza a requisição via HTTP com o curl e captura o valor de retorno
	result=$(curl -s -H "User-Agent: huximptool" -o /dev/null -w "%{http_code}" $1/$search.php)        # Busca por diretórios
	#result2=$(curl -s -o /dev/null -w "%{http_code}" $1/$search)        # Busca por arquivos
	# Verifica se a opção de pesquisa silênciosa foi selecionada
	if [ "$result" == "200" ] 
	#|| [ "$result" == "403" ];
	then
	echo  $1/$search.php
#	else
#		echo -e "\033[0;36m[ `date +"%T"` ]\033[0m $notfound $1/$search/"
	fi
		# Verifica se um diretório foi encontrado e realiza o download do mesmo
#		if [ "$result2" == "200" ]
#			then
#			echo -e "\033[0;36m[ `date +"%T"` ]\033[0m $found2 $1/$search"
#			curl -s $1/$search --output $search
#			fi
done
