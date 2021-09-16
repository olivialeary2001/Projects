//Olivia Leary (R11616039) | Assignment #3 | 7/23/2021
//
//This is a program that takes input from a file and identifies all the 
//lexemes and matches them to a token group.
//
//

#include <stdio.h>
#include <ctype.h>
#include <string.h>

/* Character classes */
#define LETTER 0
#define DIGIT 1
#define UNKNOWN 99

/* Token codes */
#define INT_LIT 10
#define IDENT 11
#define KEY_READ 12
#define KEY_WRITE 13
#define KEY_WHILE 14
#define KEY_DO 15
#define KEY_OD 16

#define ASSIGN_OP 20
#define ADD_OP 21
#define SUB_OP 22
#define MULT_OP 23
#define DIV_OP 24
#define LEFT_PAREN 25
#define RIGHT_PAREN 26
#define SEMICOLON 27
#define LESSER_OP 28
#define GREATER_OP 29
#define EQUAL_OP 30
#define NEQUAL_OP 31
#define LEQUAL_OP 32
#define GEQUAL_OP 33

/* Global Variable */
int nextToken;
int lex();

/* Local Variables */
static int charClass;
static char lexeme [100];
static char nextChar;
static int lexLen;
static FILE *in_fp;

/* Local Function declarations */
static void addChar();
static void getChar();
static void getNonBlank();
extern int nextToken;

/******************************************************/
/* main driver */
int main(int argc, char *argv[]) 
{
    printf("DanC Analyzer :: R11616039\n");
    /* Open the input data file and process its contents */
    if ((in_fp = fopen(argv[1], "r")) == NULL) {
        printf("ERROR - cannot open file \n");
    } else {
        getChar();
        do {
            lex();
        } while (nextToken != EOF);
    }
    fclose(in_fp);
    
    return 0;
}

/*****************************************************/
/* lookup - a function to lookup operators and parentheses and return the 
 * token */
static int lookup(char ch) {
    switch (ch) {
        case '(':
            addChar();
            nextToken = LEFT_PAREN;
            break;
        case ')':
            addChar();
            nextToken = RIGHT_PAREN;
            break;
        case '+':
            addChar();
            nextToken = ADD_OP;
            break;
        case '-':
            addChar();
            nextToken = SUB_OP;
            break;
        case '<':
            addChar();
            getChar();
            if(nextChar == '=')
            {
                addChar();
                nextToken = LEQUAL_OP;
            }
            else if (nextChar == '>')
            {   
                addChar();
                nextToken = NEQUAL_OP;
            }
            else
            {
                addChar();
                nextToken = LESSER_OP;
            }
            break;
        case '>':
            addChar();
            getChar();
            if(nextChar == '=')
            {
                addChar();
                nextToken = GEQUAL_OP;
            }
            else
            {
                addChar();
                nextToken = GREATER_OP;
            }
            break;
        case '=':
            addChar();
            nextToken = EQUAL_OP;
            break;
        case ':':
            addChar();
            getChar();
            if(nextChar == '=')
            {
                addChar();
                nextToken = ASSIGN_OP;
            }
            break;
        case '*':
            addChar();
            nextToken = MULT_OP;
            break;
        case '/':
            addChar();
            nextToken = DIV_OP;
            break;
        case ';':
            addChar();
            nextToken = SEMICOLON;
            break;
        default:
            addChar();
            nextToken = UNKNOWN;
            break;
    }
    return nextToken;
}

/*****************************************************/
/* addChar - a function to add nextChar to lexeme */
static void addChar() {
    if (lexLen <= 98) {
        lexeme[lexLen++] = nextChar;
        lexeme[lexLen] = 0;
    } else {
        printf("Error - lexeme is too long \n");
    }
}

/*****************************************************/
/* getChar - a function to get the next character of input and determine its 
 * character class */
static void getChar() {
    if ((nextChar = getc(in_fp)) != EOF) {
        if (isalpha(nextChar))
            charClass = LETTER;
        else if (isdigit(nextChar))
        {
            charClass = DIGIT;
        }
        else charClass = UNKNOWN;
    } 
    else {
        charClass = EOF;
    }
}

/*****************************************************/
/* getNonBlank - a function to call getChar until it returns a non-whitespace 
 * character */
static void getNonBlank() {
    while (isspace(nextChar)) getChar();
}

/*****************************************************/
/* lex - a simple lexical analyzer for arithmetic expressions */
int lex() {
    lexLen = 0;
    getNonBlank();

    char key_words[5][6] = {"read", "write", "while", "do", "od"};

    switch (charClass) {
        /* Parse identifiers */
        case LETTER:
        {
            addChar();
            getChar();
            
            while (charClass == LETTER || charClass == DIGIT) 
            {
                addChar();
                getChar();
            }
            /*used to find keywords*/
            if(strcmp(lexeme, key_words[0])== 0)
            {
                nextToken = KEY_READ;
            }
            else if (strcmp(lexeme, key_words[1]) == 0)
            {
                nextToken = KEY_WRITE;
            }
            else if (strcmp(lexeme, key_words[2]) == 0)
            {
                nextToken = KEY_WHILE;
            }
            else if (strcmp(lexeme, key_words[3]) == 0)
            {
                nextToken = KEY_DO;
            }
            else if (strcmp(lexeme, key_words[4]) == 0)
            {
                nextToken = KEY_OD;
            }
            else
                nextToken = IDENT; 
            break;
        }
            
        /* Parse integer literals */
        case DIGIT:
        {
            addChar();
            getChar();
            while (charClass == DIGIT) {
                addChar();
                getChar();
            }
            nextToken = INT_LIT;
            break;
        }

        /* Parentheses and operators */
        case UNKNOWN:
            lookup(nextChar);
            getChar();
            break;
        
        default:
            nextToken = EOF;
            break;
    }

    /*print statements*/
    switch(nextToken)
    {
        case 10:
            printf("%s          INT_LIT\n",lexeme);

            break;
        case 11:
            printf("%s          IDENT\n",lexeme);

            break;
        case 12:
            printf("%s       KEY_READ\n",lexeme);

            break;
        case 13:
            printf("%s      KEY_WRITE\n",lexeme);

            break;
        case 14:
           printf("%s      KEY_WHILE\n",lexeme);

            break;
        case 15:
            printf("%s         KEY_DO\n",lexeme);

            break;
        case 16:
            printf("%s         KEY_OD\n",lexeme);

            break;
        case 20:
            printf("%s         ASSIGN_OP\n",lexeme);

            break;
        case 21:
            printf("%s          ADD_OP\n",lexeme);

            break;
        case 22:
            printf("%s          SUB_OP\n",lexeme);

            break;
        case 23:
            printf("%s          MULT_OP\n",lexeme);

            break;
        case 24:
            printf("%s          DIV_OP\n",lexeme);

            break;
        case 25:
            printf("%s          LEFT_PAREN\n",lexeme);

            break;
        case 26:
            printf("%s          RIGHT_PAREN\n",lexeme);

            break;
        case 27:
            printf("%s          SEMICOLON\n",lexeme);

            break;
        case 28:
            printf("%s          LESSER_OP\n",lexeme);

            break;
        case 29:
            printf("%s          GREATER_OP\n",lexeme);

            break;
        case 30:
            printf("%s          EQUAL_OP\n",lexeme);

            break;
        case 31:
            printf("%s          NEQUAL_OP\n",lexeme);

            break;
        case 32:
            printf("%s         LEQUAL_OP\n",lexeme);

            break;
        case 33:
            printf("%s          GEQUAL_OP\n",lexeme);

            break;
        case 99:
            printf("%s          UNKNOWN\n",lexeme);

            break;
    }
    
    return nextToken;
} 