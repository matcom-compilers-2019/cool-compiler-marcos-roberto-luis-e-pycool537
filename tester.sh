#!/bin/bash
echo "Tester working..."
for i in $(ls test/ -C1)
do
echo "Caso de pueba: ${i}"
python3 pycool537.py test/$i -o output.asm
java -jar Mars4_5.jar output.asm
done 

echo "Tester done!"
