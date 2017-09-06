#!/bin/bash
read -p "Insira o número do lab: " numero

$(gcc lab$numero.c -o lab$numero)

if [ $? -ne 0 ]
	then
	echo "Erro na compilação"
	exit
fi

echo "Compilação OK"
echo ""
