#!/bin/bash
if [ "$1" == "" ]
	then
	echo "Curso de pentest profissional - Desec Security"
	echo "Exemplo de uso: $0 seq X a Y 192.168.0"
else
	for ip in $(seq $1 $2);
do
 host -t ptr $3.$ip | grep -v "eu" | cut -d " " -f 5 | grep -v "NXDOMAIN"
done  
fi
