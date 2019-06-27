# Documantación: PyCOOL 537

| Nombre                       | Grupo | Github          |
| ---------------------------- | ----- | --------------- |
| Luis Ernesto Martínez Padrón | C412  | @lemartinez2245 |
| Roberto Balboa González      | C412  | @Roberbg97      |
| Marcos Alderete Flores       | C412  |                 |

Para ejecutar el compilador escribir en la línea de comandos la siguiente línea:

```bash
./compile.sh <archivo a compilar>.cl [-o <nombre del archivo compilado>.cl]
```

Para correr el tester de los casos de prueba que hay en la carpeta **test**, utilizar el siguiente script:

```
./tester.sh
```

## Requerimientos:

Para satisfacer los requerimientos de nuestra aplicación ejecutar la siguiente línea:

```bash
make install
```

Estas dependencias son las especificadas en el archivo `requirements.txt` y el Java Runtime Environment 8 para el uso de `Mars4.5.jar`

Para otras opciones con el makefile escriba `make help`