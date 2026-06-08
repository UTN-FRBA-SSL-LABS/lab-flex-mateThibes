%pointer
%option noyywrap

%{
#include <stdio.h>
#include "misfunciones.h"

 /* Variable global para contar los tokens reconocidos */
int contadorTokens = 0;
%}

letra           [a-zA-Z_]
digito          [0-9]
identificador   {letra}({letra}|{digito})*

%%

{identificador}  {
    contadorTokens++; /* TODO 1 — Incrementar contadorTokens en 1 */
    printf("identificador: %s\n", yytext); /* TODO 2 — Imprimir el identificador reconocido */
}

[ \t\n]         { }

.               { printf("caracter no reconocido: %s\n", yytext); }

%%

int main(void) {
    yylex();

    printf("Tokens totales: %d\n", contadorTokens);          /* TODO 3 — Imprimir el total de tokens al finalizar */
    printf("El doble es: %d\n", duplicar(contadorTokens));   /* TODO 4 — Imprimir el doble del total usando la función duplicar() */

    return 0;
}
