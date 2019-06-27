# Incluya aquí las instrucciones necesarias para ejecutar su compilador

INPUT_FILE=$1
OUTPUT_FILE=${INPUT_FILE:0: -2}mips

echo "PyCool537 v2.1"
echo "Copyright (c) 2019: Luis E Martinez, Marcos Alderete, Roberto Balboa"

./compile.sh INPUT_FILE -o OUTPUT_FILE

# Llamar al compilador
# echo "Compiling $INPUT_FILE into $OUTPUT_FILE"

