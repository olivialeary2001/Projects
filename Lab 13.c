//--------------------------------------------------------------------------------------------------------------------------------------------
// Author:          Olivia Leary
//Filename:         Lab 13.c
//Specification:    The purpose of this program is to make a program that performs infix-to-postfix operations on expressions.
//For:              CS 1412 Programming Principles Section 504

#include <stdio.h>

#include <stdlib.h>

#include <string.h>

typedef struct stackNode
{
    char data;
    struct stackNode *nextPtr;
}StackNode;

typedef struct stackNode StackNode;

typedef StackNode *StackNodePtr;

int numPrecedence(char operator);

void convertToPostfix( char infix[], char postfix[] );

int isOperator( char c );

int precedence( char operator1, char operator2 );

void push( StackNodePtr *topPtr, char value );

char pop( StackNodePtr *topPtr );

char stackTop( StackNodePtr topPtr );

int isEmpty( StackNodePtr topPtr );

void printStack( StackNodePtr topPtr);

int main(void){
    char postfix[50];

    char infix[50];

    printf("Enter an infix  expression: \n");

    scanf("%s",infix);

    convertToPostfix(infix,postfix);

    printf("Infix: %s\nPostfix: %s\n",infix,postfix);

    return(0);
}

//convert the infix expression to postfix notation
void convertToPostfix(char infix[], char postfix[]){
    StackNode* stack = NULL;
    push(&stack,'(');
   
    strcat(infix,")");
  
    int i = 0;
    int j = 0;
    char check;
   
    while(!isEmpty(stack) && infix[i] != '\0')
    {
        check = infix[i];
        if(isdigit(check))
        {
            postfix[j++] = check;
        }
        else if(check == '(')
        {
            push(&stack,check);
        }
        else if(isOperator(check))
        {
            while(precedence(check,stack->data) < 0 )
            {
                postfix[j++] = pop(&stack);
            }
            push(&stack,check);
        }
        else if(check == ')')
        {
            while(stackTop(stack) != '(')
            {
                postfix[j++] = pop(&stack);
            }
            pop(&stack);
        }
        i++;
    }
    postfix[j] = '\0';
    infix[strlen(infix)-1] = '\0';
    
}

//determine if c is an operator
int isOperator(char c){
    if(c == '+' || c == '-' || c == '*' || c == '/' || c == '^' || c == '%')
    {
        return 1;
    }
    return 0;
}

int numPrecedence(char operator)
{
    if(operator == '+' || operator == '-')
    {
        return 0;
    }
    else if(operator == '/' || operator == '*' || operator == '%')
    {
        return 1;
    }
    else if(operator == '^')
    {
        return 2;
    }
    return -1;
}
//determine if the precedence of operator1 is less than, equal to, or greater
//than the precedence of operator2
int precedence(char operator1, char operator2){
    if(numPrecedence(operator1) < numPrecedence(operator2))
    {
        return -1;
    }
    else if(numPrecedence(operator1) == numPrecedence(operator2))
    {
        return 0;
    }
    if(numPrecedence(operator1) > numPrecedence(operator2))
    {
        return 1;
    }
    
    return -2;
}

//push a value on the stack
void push(StackNodePtr *topPtr, char value){
    if(topPtr == NULL)
    {
        printf("That's a NULL pointer. Failure\n");
        return;
    }
    StackNode *newHead = (StackNode*)malloc(sizeof(StackNode));
    if(newHead == NULL)
    {
        printf("SHOOOT!!! Memory Allocation Failure.\n");
        return;
    }
    newHead->data = value;
    newHead->nextPtr = *topPtr;
    *topPtr = newHead;
}

//Pop a value on the stack
char pop( StackNodePtr *topPtr){
    if(topPtr == NULL)
    {
        printf("Thats a null pointer. Failure\n");
        return '\0';
    }
    StackNodePtr head = *topPtr, newHead;
    if(head == NULL)
    {
        printf("That's an empty stack. Failure!\n");
        return '\0';
    }
    newHead = head->nextPtr;
    const char out = head->data;
    *topPtr = newHead;
    free(head);
    return out;
}

//return the top value of the stack without popping the stack
char stackTop( StackNodePtr topPtr){
    return(topPtr->data);
}

//determine if the stack is empty
int isEmpty( StackNodePtr topPtr){
    return(topPtr == NULL);
}

//print the stack
void printStack( StackNodePtr topPtr){
     while(topPtr != NULL)
    {
        printf("%c, ",topPtr->data);
        topPtr = topPtr->nextPtr;
        printf("\n");
    }
}