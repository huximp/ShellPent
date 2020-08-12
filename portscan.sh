#!/bin/bash
#port = 1337,37,30,3000,30000;

for ip in {1..254};
do
hping3 -S -p 24 -c 1 $1.$ip 2> /dev/null  
done

