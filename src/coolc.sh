#!/usr/bin/env bash

echo "PyCool537 v2.1"
echo "Copyright (c) 2019: Luis E Martinez, Marcos Alderete, Roberto Balboa"

if [[ $# = 1 ]]
then
INPUT_FILE=$1
OUTPUT_FILE=${INPUT_FILE:0: -2}mips

./compile.sh $INPUT_FILE $OUTPUT_FILE

else
echo "El uso correcto de este compilador es:"
echo "./coolc.sh <direccion_del_archivo_cool>"
fi
