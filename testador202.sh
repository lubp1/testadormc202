#!/bin/bash
read -p "Insira o número do lab: " numero

$(gcc lab$numero.c -o lab$numero)

if [ $? -ne 0 ]
	then
	echo "Erro na compilação"
	exit
fi

echo "Sem erros de compilação"
echo ""

for file in testes/*.in
do
	echo Teste $file
	file="${file%.*}"
	./lab$numero < $file.in > $file.res
	$(diff $file.out $file.res > diff.txt)

	if [ $? -eq 0 ]
	then echo "teste $file OK"
	else
	echo "erro no teste $file"
	cat diff.txt
	fi

	echo ""

done
