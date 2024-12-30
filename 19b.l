%{
#include <stdio.h>
int valid = 0;
%}

%%
(http|https|ftp):\/\/(www\.)?[a-zA-Z0-9-]+(\.[a-zA-Z]{2,})+([\/\?][-a-zA-Z0-9@:%._\+~#=&\/]*)?    { valid = 1; }
.|\n    { }
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter URL to validate: ");
    yylex();
    
    if(valid)
        printf("\nValid URL\n");
    else
        printf("\nInvalid URL\n");
        
    return 0;
}