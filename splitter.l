%{
#include <stdio.h>
%}

%%
"hate"|"overthrow"|"coup"|"detest"|"despise"|"fascist"   { printf("Possible Hate Speech: %s\n", yytext); } //Flag
[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}  { printf("Email: %s\n", yytext); } //Email
[a-zA-Z]+      { printf("Word: %s\n", yytext); }   // Words
[0-9]+         { printf("Number: %s\n", yytext); } // Number
[.,;:?!]       { printf("Punctuation: %s\n", yytext); } // Punctuation
"=="|"!="|">="|"<="|"+"|"-"|"*"|"/"|"="|"%"|"^"|"&"|"|" { printf("Operator: %s\n", yytext); } //Operator
[!@#$%^&*()_+\-={}[\]:;<>,.?~\\|]     { printf("Special Character: %s\n", yytext); } // Special

[ \t\n]        ; // Whitespace.

%%

int main(void) {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
