#!/bin/bash
if [ "$1" == "" ]
then
echo "Curso de pentest profissional - Desec Security"
echo "Exemplo de uso: $0 10.0.0"
else
for host in {1..254};do
ping -c 1 $1.$host | grep "64 bytes" | cut -d ":" -f1 | cut -d " " -f4
done
fi
