/*
Group 3 Members
Jeremy Munroe		136276
Jacob Manyara		135747
Andrew Njenga		136338
Lexie Wambui		136672
Nantono Shivan		136640
Joan Chege 		    133977

*/
%{
#include <stdio.h>
int wordCount = 0;
%}

%%
"hate"|"overthrow"|"coup"|"detest"|"despise"|"fascist"   { printf("Possible Hate Speech: %s\n", yytext); } //Flag any hateful words.
[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}  { printf("Email: %s\n", yytext);} //Email: Detect email occurences in an input.
[a-zA-Z]+      { 
    printf("Word: %s\n", yytext); 
    printf("Reversed word: "); 
    wordCount++; 
    for (int i = yyleng - 1; i >= 0; i--) { //Reverse Words.
        putchar(yytext[i]);
    }
    printf("\n"); 
    }   // Words: Detect any notmal words.
[0-9]+         { printf("Number: %s\n", yytext); } // Number: Detecting floating and integer types.
[.,;:?!]       { printf("Punctuation: %s\n", yytext);} // Punctuation: Punctuation within an input.
"=="|"!="|">="|"<="|"+"|"-"|"*"|"/"|"="|"%"|"^"|"&"|"|" { printf("Operator: %s\n", yytext);} //Operator: Detect operators.
[!@#$%^&*()_+\-={}[\]:;<>,.?~\\|]     { printf("Special Character: %s\n", yytext);} // Special: Other special characters.

[ \t\n]        ; // Whitespace.

%%

int main(void) {
    yylex();
    printf("\nNumber of Words: %d\n", wordCount);
    return 0;
}

int yywrap() {
    return 1;
}
