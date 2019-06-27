#!/bin/bash
if [ $# = 3 ] && [ $2 = '-o' ]
	then python3 pycool537.py $1 -o $3
	java -jar Mars4_5.jar $3
else
	if [ $# = 1 ]
	then
	python3 pycool537.py $1
	java -jar Mars4_5.jar codigo_cool.asm
else
	echo "El uso corecto de este script es:"
	echo "./compile.sh <archivo a compilar>.cl [-o <archivo compilado>.cl]"
fi
fi
