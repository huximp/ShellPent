#!/bin/bash
for palavra in $(cat lista.txt);do
 host -t txt $palavra.$1 | grep -v "NXDOMAIN"
done 
