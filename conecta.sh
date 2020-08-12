#!/bin/bash
src=("1238" "2879" "2116" "1863")
dst=("13" "37" "30000" "3000")
rede="172.16.1"
for ip in {1..254}; do
	for i in {0..3}; do
		hping3 -S -s ${src[$i]} -p ${dst[$i]} -c 1 $rede.$ip 2>&-;
	done
	nc -w2 -vC $rede.$ip 1337 2>&- && clear;
	if [ $? -eq "0" ]; then
		echo -e "conexao aceita por: \033[31;1m $rede.$ip\033[m"
		echo -e "GET/HTTP/1.0\r\n\r\n" | nc -vC $rede.$ip 1337;
		exit 0
	fi
done
