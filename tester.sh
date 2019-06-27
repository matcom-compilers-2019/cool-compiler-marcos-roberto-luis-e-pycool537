#!/bin/bash
echo "Tester working..."
for i in $(ls -C1)
do
echo "Caso de pueba: ${i}"
python3 pycool537.py $i -o output.asm
java -jar Mars4.5.jar output.asm
done 

echo "Tester done!"
