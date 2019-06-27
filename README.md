# PyCOOL 537

**Integrantes(C-412):**

Marcos Alderete Flores

Roberto Balboa González

Luis Ernesto Martínez Padrón

# Estructura del proyecto

- Lexer : Done! (ANTLR)
- Parser : Done! (ANTLR)
- AST : Done!
- Chequeo Semántico : Done!
- Generación de código itermedio
    - AST de CIL: Seems to be done! To review! The `case` visit!
- Generación de código MIPS:
    - Escribir los métodos `code` de cada nodo CIL para su traducción a MIPS: Almost done
- Testing: Pending 

1. Hacer el copy en MIPS: **Done**
2. Hay que hacer los tipos básicos: Int, Bool, String. No pueden quedar ya los enteros como valores, 
sino como instancias de Int.
    - Tengo que hacer el init de cada uno: **Done**
3. Redefinir los comparadores teniendo en cuenta que los Int están guardados en instancias
4. Implementar la copia de string: **Con substring, indice 0 y length igual al length del string**. Lo hizo Roberto OJO!!!
5. En los assign es necesario saber el tipo de la parte izquierda, en dependencia de eso, lo que quede en la parte derecha 
se guarda como referencia o se le hace una copia a lo que apunta esa referencia. Lo hizo Roberto, OJO!!!
6. Hacer el dynamic dispatch: Le toca a Marcos
7. Usar el diccionario de ocultamiento de variables en el `case`: Pending
