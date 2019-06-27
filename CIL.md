# PyCIL reference

```text
.TYPES
type A {
    attribute A_a;
    method A_f: def_A_f;
}
type B {
    attribute A_a;
    ...
}

.DATA
...

.CODE
function def_A_f{
    ...
}
function{
    x = ALLOCATE B;
    ...
    CALL init_B;
    
}
```

# `.TYPES`
```text
type <type_name> {
    attribute <attribute_name>;
    method <method_name_for_type>:<method_name_on_code_section>;
}
```
Si el tipo `A` es padre del tipo `B` entonces:
```text
type A{
    attribute a;
    method f:f1;
}
type B{
    attribute a;
    attribute b;
    method f:f2;
    method g:f3;
}
```
En este caso también hay otro atributo `b` y un método nuevo `g` propios del tipo `B`.

Aquí se redefine el método `f` con la definición que hay en el método `f2`.

# `.DATA`
```text
<variable_name1> = "Any string of any kind";
<variable_name2> = 12;
```
Aquí se guardan constantes, o sea, variables globales inmutables.

# `.CODE`
## Declaración de funciones
```text
function f1 {
    ARG x;
    ARG y;
    LOCAL a;
    LOCAL b;
    ...
}
function f2 {
    ...
}
```
`ARG <name>` son los argumentos que recibe la función, de esta forma se sacan de la pila los valores 
que se pusieron para el llamado de la función.

`LOCAL <name>` es la manera de definir variables propias de la función.

# Instrucciones de CIL

- Asignación: `x = y;` donde `x` e `y` son variables
- Operaciones aritméticas: `x = y + z;`
- Acceso a atributos: `x = GETATTR y b;` que es el equivalente a hacer `x = y.b` en python, por ejemplo
- Asignación de atributos: `SETATTR y b x;` que es el equivalente de `y.b = x` 
- Indización en arrays y strings: `x = GETINDEX a i;`(`x = a[i]`) y `SETINDEX a i x`(`a[i]=x`)
- Memoria para una variable: `x = ALLOCATE T;` donde `T` es un tipo definido
- Memoria para un array: `x = ARRAY y;` donde `y` es ...
- _Tipeof_: `t = TYPEOF x;` donde `x` es una variable instanciada
- Etiquetas: `LABEL <label_name>;`
- Saltos incondicionales: `GOTO <label_name>;`
- Saltos condicionales: `IF x GOTO <label_name>;`, donde `x` se toma como FALSE si `x==0` y como TRUE en otro caso
- Llamado estático: `x = CALL f;` donde `f` es una función definida. 
Siempre recordar que es necesario hacer `PARAM <param_name>` para las funciones que reciben argumentos 
- Llamado dinámico: `x = VCALL T f;` donde `T` es un tipo definido
- Paso de parámetros para llamados: `PARAM a;` donde `a` es una varible definida
- Retorno: `RETURN <constante>;`, `RETURN <variable>;`, `RETURN;`
- Cargar dirección: `x = LOAD msg;` Esto se utiliza para cargar alguna de las constantes predefinidas
- Funciones predefinidas:
    - Length: `x = LENGTH y;`
    - Concatenación: `x = CONCAT z w;`
    - Prefijo: `x = PREFIX y n;`
    - Subcadena: `x = SUBSTRING y n;`
    - Conversión a STR: `x = STR y;`
    - Entrada: `x = READ;`
    - Salida: `PRINT x;`

# Ejecución de un programa CIL
Siempre se empieza por la ejecución de la `function main`.

