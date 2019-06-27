#!/bin/bash
if $# = 2 
	then python3 pycool537.py $1 -o $2
		 java -jar Mars4.5.jar $2
elif $# = 1
	python3 pycool537.py $1
	java -jar Mars4.5.jar codigo_cool.asm
else
	echo "El uso corecto de este script es:"
	echo "./compile.sh <archivo a compilar>.cl [-o <archivo compilado>.cl]"
fi
