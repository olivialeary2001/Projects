#Olivia Leary
#Project 2 - Maze Solver
#11/6/2019

#The purpose of this project is to create a program that solves a  20 by 10 maze. The program
#will start at a postition S and goes through the maze, ending at position E.

#Algorithm:

#My code will take an input from a user stating the filename. I have a function that
#takes the file and opens it for reading. My function will then take the characters line by line
#and append the lines into a list. Then the function will take the list and append it to my Maze
#list. 

#Then, I will have two functions for finding the start and end position. These functions
#will both take my maze list and turn it into a string. Then I used the find method to locate the
#S or E. Then it will return the postion for each letter.

#I will have four more functions within my code that will calculate the four directions my maze
#solver needs to move(up,down, left right).They will utilize the current position which is the
#start position. They will then either add one or subtract one to the row or column it is working
#with. This is dependent on the direction as up is concerned with a column position while left
#is concerned with the row position. Then the functions will append the corresponding carrot
#symbol to the designated spot in the row or column.

#In my main function, I have a loop that goes through each of my functions I made that calculate
#the directions. It prints them out each time until the maze is solved.

def main():
#This is used to get the file name from the user.
    try:
        mazeFile = input("Please enter the name of your file: ")
        
        myList1 = get_values_from_file(mazeFile)
        
#These variables mark where the start position is, where the end position, and where the current
#position is. 
        startPos = get_start(myList1)

        currentPos = get_start(myList1)

        Epos = get_end(myList1)

        back = []
#This while loop goes through each created function, printing out what each of them command to be
#done. It also appends the current hcaracter to a list that is used for backtracking. It wil do
#do this until the list is done. 
        
        while(currentPos != Epos):
            if Mleft(myList1, currentPos, startPos, Epos):
                back.append("<")
                printm(myList1)
                
            elif Mright(myList1, currentPos, startPos, Epos):
                back.append(">")
                printm(myList1)
                
            elif Mup(myList1, currentPos, startPos, Epos):
                back.append("^")
                printm(myList1)
                
            elif Mdown(myList1, currentPos, startPos, Epos):
                back.append("v")
                printm(myList1)
#This else statement is used for backtacking.Within it there is an if statement that checks to
#see if the program is back at the start. If so, then it will move into another if statement
#and check to see if all the characters around it are either a wall or a dot. If so, then
#the program will print out an error as there was no way to find the end.
            else:
                if currentPos == startPos:
                    wall = ".#"
                    if myList1[currentPos[0] + 1][currentPos[1]] in wall and myList1[currentPos[0] - 1][currentPos[1]] in wall and myList1[currentPos[0]][currentPos[1] + 1] in wall and myList1[currentPos[0]][currentPos[1] - 1] in wall:
                        raise ZeroDivisionError("Error: No route could be found from start to end. Maze unsolvable.")

#These elifs are used to  backtarck through the maze. It looks at the list
#where all of the moves were appended to. The program will then go through
#each elif and check to see if the character matches up with the previous
#move. If so, the program will the move the opposite direction (left to right,
#right to left, up to down, down to up) and replace to previous move with a
#dot.   
                elif back[-1] == "<":
                    myList1[currentPos[0]][currentPos[1]] = "."
                    currentPos[1] = currentPos[1] + 1
                    back.pop()
                elif back[-1] == ">":
                    myList1[currentPos[0]][currentPos[1]] = "."
                    currentPos[1] = currentPos[1] - 1
                    back.pop()
                    
                elif back[-1] == "^":
                    myList1[currentPos[0]][currentPos[1]] = "."
                    currentPos[0] = currentPos[0] + 1
                    back.pop()
        
                elif back[-1] == "v":
                    myList1[currentPos[0]][currentPos[1]] = "."
                    currentPos[0] = currentPos[0] - 1
                    back.pop()
           
    except ZeroDivisionError as e:
        print(e)

    
#This function is used to combine the list, and convet it into strings. It will go through each
#line, making them all strings.
def printm(list1):
    for i in list1:
        print("".join(i))
    print("\n")

#This function is used to get the file from the user and open it up for reading. It has two empty
#lists that will be used to append values into and string that houses all the valid characters for the maze.
#Within this function, there is a try statement. Within this try statement, there is a for loop that goes
#through each line within the file. Then it replaces the tabs within each line with empty strings. There is
#another for loop that looks to make sure the characters are within the allowed values. If not, then it will
#print an error. Otherwise, it append that line an empty list. Then it appends the list of lists into the maze
#list. It will also add one to the line count. The function then closes the file. There is an if statement
#that checks to see if the newly created list is empty. If so, then it will raise an exception and print
#an error since there is no maze. There is an except statement for it the file is not found which will print an error.    
def get_values_from_file(filename):
    mazeList = []
    charList = []
    syntax = "SE# "
    linenum = 0
    try:
        myFile = open(filename , 'r')
        for line in myFile:
            charList = []
            for i in line.replace("\n","",1):
                if i in syntax:
                    charList.append(i)
                else:
                    raise ZeroDivisionError("Error: Maze contains invalid characters. Line "+str(linenum)+ " contains invalid character '"+str(i)+"'")
            mazeList.append(charList)
            linenum = linenum + 1
        myFile.close()

        if mazeList == []:
            raise ZeroDivisionError("Error: Specified file contains no maze.")
        return mazeList
    except FileNotFoundError:
        raise ZeroDivisionError("Error: Specified file does not exist.")

#This function is used to get the start position for the maze solver. It has an empty string where
#values will be appended to. There is a for loop within the function that looks through the list
#using the range function. There is another for loop that goes through each character within of the
#current position of the list. Then it will add the characted to the string. The function uses the
#find method to locate the S. If it does not return -1, then it will set the start equal to S. If
#there is no S, then the program will print an error.
def get_start(list1):
    myString = ""
    for currList in range(0,len(list1)):
        myString = ""
        for character in list1[currList]:
            myString = myString + (character)
        if myString.find("S") != -1:
            xpos = myString.find("S")
            return [currList,xpos]

    raise ZeroDivisionError("Error: No start position found.")
        
#This function is used to get the end position for the maze solver. It has an empty string where
#values will be appended to. There is a for loop within the function that looks through the list
#using the range function. There is another for loop that goes through each character within of the
#current position of the list. Then it will add the characted to the string. The function uses the
#find method to locate the E. If it does not return -1, then it will set the end equal to E. If there
#is no E, then the program will print an error.
def get_end(list1):
    myString = ""
    for currList in range(0,len(list1)):
        myString = ""
        for character in list1[currList]:
            myString = myString + (character)
        if myString.find("E") != -1:
            xpos = myString.find("E")
            return [currList,xpos]

    raise ZeroDivisionError("Error: No end position found.")
        
#This function is used to calculuate all of the left movements. Since the left movement involvles
#traveling through a row, this function manipulates the y posisiton within the maze. This function
#contains a try statement housing an if statment. Within this if statment, it looks at the
#position of the x and see if it is equal to zero. If so, then it will return false. Then the program
#will move into another if statement and look at the postion of the column and then the position of
#the row - 1 space to see if there is an open area. It will also check to see if the position is
#equal to the end position. If so, then it will move into another if statment and see if the position
#is equal to the start position. If so, then it will subtract one from the position. Otherwise, 
#If the next slot is open, then the function moves into the nested if statement. This one is used
#to make sure that the carrot mark will not replace the S. In the else statement, the program will
#place a carrot in the designated area and return true. If all of this fails, then the program
#will move into the except statment and return false. 
def Mleft(myList,pos,startPos, Epos):
    try:
        if pos[1] == 0:
            return False
        if myList[pos[0]][pos[1]-1] == " " or [pos[0], pos[1] - 1] == Epos:
            if pos == startPos:
                pos[1] = pos[1] - 1
                return True
            
            else:
                myList[pos[0]][pos[1]] = "<"
                pos[1] = pos[1] - 1
                return True
        return False
    except IndexError:
        return False
    
#This function is used to calculuate all of the right movements. Since the right movement involvles
#traveling through a row, this function manipulates the y posisiton within the maze. This function
#contains a try statement housing an if statment. Within this if statment, it looks at the
#position of the x and see if it is equal to the position right outside of the maze. If so,
#then it will return false. Then the program will move into another if statement and look at the
#position of the column and then the position of the row + 1 space to see if there is an open area.
#It will also check to see if the position is equal to the end position. If so, then it will move
#into another if statment and see if the position is equal to the start position. If so, then it
#will add one from the position and return true. Otherwise, it looks at the position of the column and then the
#position of the row + 1 space to see if there is an open area. Then program will will place a carrot symbol
#in the designated spot and return true.
#If all of this fails, then the program will move into the except statment and return false.
def Mright(myList, pos,startPos, Epos):
    try:
        if pos[1] == len(myList[pos[0]])-1:
            return False
        if myList[pos[0]][pos[1] + 1] == " " or [pos[0], pos[1] + 1] == Epos:
            if pos == startPos:
                pos[1] = pos[1] + 1
                return True
            
            else:
                myList[pos[0]][pos[1]] = ">"
                pos[1] = pos[1] + 1
                return True
        
        return False
    except IndexError:
        return False

#This function is used to calculuate all of the upwards movements. Since the up movement involvles
#traveling through a column, this function manipulates the x posisiton within the maze. This function
#contains a try statement housing an if statment. Within this if statment, it looks at the
#position of the y and see if it is equal to the position right outside of the maze. It also looks
#to see if the position is equal to zero. If so, then it will return false. 
#Then the program will move into another if statement and look at the position of the column - 1
#and then the position of the row to see if there is an open area.
#It will also check to see if the position is equal to the end position. If so, then it will move
#into another if statment and see if the position is equal to the start position. If so, then it
#will subtract one from the position and return true. Otherwise, it looks at the position of the column - 1 and then the
#position of the row to see if there is an open area. Then program will will place a carrot symbol
#in the designated spot and return true.
#If all of this fails, then the program will move into the except statment and return false.
def Mup(myList, pos,startPos, Epos):
    try:
        if pos[0] == 0:
            return False
        if pos[1] >= len(myList[pos[0]-1]):
            return False
        if myList[pos[0]-1][pos[1]] == " " or [pos[0]-1, pos[1]] == Epos:
            if pos == startPos:
                pos[0] = pos[0] - 1
                return True
            
            else:
                myList[pos[0]][pos[1]] = "^"
                pos[0] = pos[0] - 1
                return True
        
        return False
    except IndexError:
        return False

#This function is used to calculuate all of the downwards movements. Since the up movement involvles
#traveling through a column, this function manipulates the x posisiton within the maze. This function
#contains a try statement housing an if statment. Within this if statment, it looks at the
#position of the y and see if it is equal to the position right outside of the maze. It also looks
#If so, then it will return false. Then the program will move into another if statement and look at the position of the column + 1
#and then the position of the row to see if there is an open area.
#It will also check to see if the position is equal to the end position. If so, then it will move
#into another if statment and see if the position is equal to the start position. If so, then it
#will add one from the position and return true. Otherwise, it looks at the position of the column + 1 and then the
#position of the row to see if there is an open area. Then program will will place a carrot symbol
#in the designated spot and return true.
#If all of this fails, then the program will move into the except statment and return false.
def Mdown(myList, pos,startPos, Epos):
    try:
        if pos[0] == len(myList) - 1:
            return False
        if pos[1] >= len(myList[pos[0]+1]):
            return False
        if myList[pos[0]+1][pos[1]] == " " or [pos[0]+1, pos[1]] == Epos:
            if pos == startPos:
                pos[0] = pos[0] + 1
                return True
            
            else:
                myList[pos[0]][pos[1]] = "v"
                pos[0] = pos[0] + 1
                return True
        
        return False
    except IndexError:
        return False
main()
