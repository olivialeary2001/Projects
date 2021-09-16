//-----------------------------------------------------------------------
// AUTHOR:          Olivia Leary
// FILENAME:        Lab 9.cpp
// SPECIFICATION:   This lab changes utilizes hashing to create a table
// FOR:             CS 2413 Data Structures Section 504

#include <iostream>

#include <iomanip>

#include <stdlib.h>

using namespace std;

struct node
{
    int data;           //value in node

    struct node *next;  //pointer to next node
};

// --------------------------------------------------------------------------------
// NAME:            insert_end
// INPUT Param.:    *start, num
// OUTPUT Param.:   This function does not return anything
// PURPOSE:         Used to insert node at the end of the linked list.
struct node *insert_end(struct node *aStart,int num)
{
    struct node *new_node, *ptr;    

    new_node = (node *)malloc(sizeof( struct node));  

    new_node -> data= num;                      

    new_node -> next = NULL;   

    ptr = aStart;

    if (ptr == NULL)
    {
        aStart = new_node;
    }
    else
    {
        while(ptr ->next != NULL)  
        {
            ptr = ptr ->next;
        }     
        ptr ->next = new_node;
    }

    return aStart;
}

// --------------------------------------------------------------------------------
// NAME:            get_hash_position
// INPUT Param.:    key, mem_num
// OUTPUT Param.:   This function returns the position of the key
// PURPOSE:         Implements the h(k) = k mod m formula, used to get
//                  the position of the key.
int get_hash_position(int key, int mem_num)
{
    return (key % mem_num);
}

// --------------------------------------------------------------------------------
// NAME:            create_chain
// INPUT Param.:    *start, mem_num, hash, new_hash
// OUTPUT Param.:   This function does not return anything
// PURPOSE:         This function takes a list of keys, gets the key, position of the
//                  key, iterates through the list of keys, and the goes through a switch
//                  to determine which position the key should get added to. Then, it adds
//                  key to the end of the linked list for that position in the new list
//                  in order to create the chain.
void create_chain(struct node*new_hash[],int hash[], int mem_num, struct node *aStart)
{
    struct node *root =aStart;

    int num;    //the position of the key

    int lnum;   //the key

    for(int i = 0; i < mem_num-1; i++)
    {
        lnum=hash[i];

        num = get_hash_position(lnum,mem_num);

        switch(num)
        {
            case 0:
                root = new_hash[0];
                new_hash[0] = insert_end(root, lnum);

                break;
            case 1:
                root = new_hash[1];
                new_hash[1]= insert_end(root, lnum);

                break;
            case 2:
                root = new_hash[2];
                new_hash[2]= insert_end(root, lnum);

                break;
            case 3:
                root = new_hash[3];
                new_hash[3]= insert_end(root, lnum);

                break;
            case 4:
                root = new_hash[4];
                new_hash[4]=insert_end(root, lnum);

                break;
            case 5:
                root = new_hash[5];
                new_hash[5]= insert_end(root, lnum);

                break;
            case 6:
                root = new_hash[6];
                new_hash[6]= insert_end(root, lnum);

                break;
            case 7:
                root = new_hash[7];
                new_hash[7]= insert_end(root, lnum);

                break;
            case 8:
                root = new_hash[8];
                new_hash[8]= insert_end(root, lnum);

                break;
        }
    }
}

// --------------------------------------------------------------------------------
// NAME:            display
// INPUT Param.:    new_hash, root, mem_num
// OUTPUT Param.:   This function does not return anything
// PURPOSE:         This function prints out the created array of linked lists.
void display(struct node *new_hash[], struct node *root, int mem_num)
{
    root = NULL;

    for(int i =0; i < mem_num; i++)
    {
        root = new_hash[i];
        cout << i << ":";
        while(root != NULL)
            {
            if(root->next != NULL)
            {
                cout << root->data<< " -> "; 
            }
            else
            {
                cout << root->data; 
            }
            root = root->next;                       
            }
        cout << endl;
    }
}

int main(void)
{
    struct node *root = NULL;                       //used to make linked list

    int hash[]={7, 24, 18, 52, 36, 54, 11, 23};     //array of keys

    int mem_num= 9;                                 //number of memory positions

    struct node* new_array[9];                      //used to print array
    for (int i = 0; i < 9; i++)
    {
        new_array[i] = NULL;
    }
    
    create_chain(new_array,hash, mem_num,root);

    display(new_array, root, mem_num);

    return(0);
}
