#!/usr/bin/env bash

if [[ $# = 2 ]]
	then python3 pycool537.py $1 -o $2
	java -jar ../Mars4_5.jar $2
else
	if [[ $# = 1 ]]
	then
	python3 pycool537.py $1
	java -jar ../Mars4_5.jar codigo_cool.asm
else
	echo "El uso correcto de este script es:"
	echo "./compile.sh <archivo a compilar>.cl [-o <archivo compilado>.cl]"
fi
fi
