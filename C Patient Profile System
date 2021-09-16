//--------------------------------------------------------------------------------------------------------------------------------------------
// Author:          Olivia Leary
//Filename:         Lab 10.c
//Specification:    The purpose of this program is to create a health profile for a patient.
//For:              CS 1412 Programming Principles Section 504

#include <stdio.h>

typedef struct profile{
    char fname[20];     //Gets first name

    char lname[20];     //Gets last name

    char gender[10];    //Gets gender

    int month;          //Gets birth Month

    int day;            //Gets birth day

    int year;           //Gets birth year

    float height;       //Gets height

    float weight;       //Gets weight

}profile_t;

profile_t HealthProfile(void);

int get_age(profile_t info);

int max_heart_rate(int age);

float get_bmi(profile_t info);

void target_heart_rate(int age, int *min, int *max);

int main (void){

    profile_t info;

    info = HealthProfile();

    int age;        //gets age of patient

    int max_heartrate;  //Gets maximum heartrate

    int min_targetheartrate;    //gets minimum target heartrate

    int max_targetheartrate;    //gets maximum target heartrate

    age = get_age(info);

    max_heartrate = max_heart_rate(age);

    target_heart_rate(age, &min_targetheartrate,&max_targetheartrate);

    printf("\n\n\nFirst Name: %s \nLast Name: %s \nGender: %s \nDate of birth: %d/%d/%d \nHeight: %.2fcm \nWeight: %.2fkg\n",info.fname,info.lname,info.gender,info.month,info.day,info.year,info.height,info.weight);
    
    printf("Age: %d\n",age);
    
    printf("BMI: %.2f\n",get_bmi(info));
    
    printf("Maximum heart rate: %d bpm\n",max_heartrate);
    
    printf("Target-heart-rate range: %d - %d bpm\n",min_targetheartrate,max_targetheartrate);   
    
    printf("\nBMI VALUES\nUnderweight:\t less than 18.5\nNormal:\t\t between 18.5 and 24.9\nOverweight:\t between 25 and 29.9\nObese:\t\t 30 or greater\n");

    return(0);
}

// Name:                HealthProfile
// Input Parameters:    none
// Output:              This function returns the info varible, with all of the users information
// Purpose:             This function takes the input from the user and applies it to the structure
profile_t HealthProfile(void)
{
    profile_t info;

    printf("Enter your first name: ");
    
    scanf(" %s", info.fname);

    printf("Enter your last name: ");

    scanf("%s", info.lname);

    printf("Enter your gender: ");

    scanf("%s", info.gender);

    printf("Enter your birth month: ");

    scanf("%d", &info.month);

    printf("Enter your birth day: ");

    scanf("%d", &info.day);

    printf("Enter your year of birth: ");

    scanf("%d", &info.year);

    printf("Enter your height in centimeters: ");

    scanf("%f", &info.height);

    printf("Enter your weight in kilograms: ");

    scanf("%f", &info.weight);

    return(info);
}

// Name:                get_age
// Input Parameters:    info
// Output:              This function outputs the age of the patient
// Purpose:             This function takes the year the user was born and subtracts it from the current year to ge the age of the patient.
int get_age(profile_t info)
{
    int year;

    year = info.year;

    return(2020 - year);
}

// Name:                max_heart_rate
// Input Parameters:    age
// Output:              This function outputs the patient's maximum heartrate.
// Purpose:             This function takes the age of the user and outputs the heart rate that corresponds with that age.
int max_heart_rate(int age)
{
    int Maxhr;
    
    if(age < 21)
    {
        Maxhr= 200;
    }

    else if(age < 31)
    {
        Maxhr = 190;
    }

    else if(age < 36)
    {
        Maxhr = 185;
    }

    else if(age < 41)
    {
        Maxhr = 180;
    }

    else if(age < 46)
    {
        Maxhr = 175;
    }

    else if(age < 51)
    {
        Maxhr = 170;
    }

    else if(age < 56)
    {
        Maxhr = 165;
    }

    else if(age < 61)
    {
        Maxhr = 160;
    }

    else if(age < 66)
    {
        Maxhr = 155;
    }

    else if(age < 71)
    {
        Maxhr = 150;
    }

    return(Maxhr);
}

// Name:                get_bmi
// Input Parameters:    info
// Output:              This function returns the patients bmi
// Purpose:             This function ,takes the weight of the user, the weight of the user divided
//                      by the height, then multiplyed by itself, then divides these two to get the bmi
float get_bmi(profile_t info)
{
    float top = 0.0;

    float bottom = 0.0;
    
    top = (info.weight);

    bottom = ((info.height / 100)*(info.height / 100));

    return(top/bottom);
}

// Name:                target_heart_rate
// Input Parameters:    age, *min, *max
// Output:              This function does not return anything as a pointer is used to get the values
// Purpose:             This function takes the age and uses it to fill the min and max variables with the correct values pertaining to the min and max target
//                      heart rate.
void target_heart_rate(int age, int *min, int *max)
{
    
    if(age < 21)
    {
        *min = 100;
        *max = 170;
    }

    else if(age < 31)
    {
        *min = 95;
        *max = 162;
    }

    else if(age < 36)
    {
        *min = 93;
        *max = 157;
    }

    else if(age < 41)
    {
        *min = 90;
        *max = 153;
    }

    else if(age < 46)
    {
        *min = 88;
        *max = 149;
    }

    else if(age < 51)
    {
        *min = 85;
        *max = 145;
    }

    else if(age < 56)
    {
        *min = 83;
        *max = 140;
    }

    else if(age < 61)
    {
        *min = 80;
        *max = 136;
    }

    else if(age < 66)
    {
        *min = 78;
        *max = 132;
    }

    else if(age < 71)
    {
        *min = 75;
        *max = 128;
    }

}
