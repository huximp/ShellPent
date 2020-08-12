#!/bin/bash
if [ "$1" == "" ]
then
        echo "DESEC SECURITY - PORTSCAN NETWORK"
        echo "Modo de uso: $0 REDE PORTA"
        echo "Exemplo: $0 192.168.1"
else
        for ip in $(seq 1 254);
        do
                for port in 13 37 30000 3000;
                do
                        hping3 -S -p $port -c 1 $1.$ip 2> /dev/null
                done
        done
        echo ""
        echo ""
        for ip in $(seq 1 254); do
                flag=$(hping -S -p 1337 $1.$ip 2> /dev/null | grep "flags=SA" | cut -d " "  -f 2 | cut -d "=" -f 2)
        done
        for host in {$flag}; do
                code=$(curl -v $host:1337)
                if [ "$code" == "200" ];then
                        echo "Conectado a porta $port do host $host."
                fi
        done
fi