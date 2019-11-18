#include "stm32f4xx.h"
#include <string.h>
#include<stdio.h>
void printMsg(int a,int b,int c,int d)
{
float a1=*((float*) &a) ;
float b1=*((float*) &b) ;
float c1=*((float*) &c) ;
float d1=*((float*) &d) ;
char Msg1[10];
char Msg2[10];
char Msg3[10];
char Msg4[10];
char *ptr;
sprintf(Msg1, "%f ", a1);
sprintf(Msg2, "%f", b1);
sprintf(Msg3,"%f",c1);
sprintf(Msg4,"%f",d1);
ptr = Msg4 ;
   while(*ptr != '\0'){
      ITM_SendChar(*ptr);
      ++ptr;
   }
ITM_SendChar(',');
ptr=Msg3 ;
 while(*ptr != '\0'){
      ITM_SendChar(*ptr);
      ++ptr;
   }
ITM_SendChar(',');
ptr=Msg2 ;
 while(*ptr != '\0'){
      ITM_SendChar(*ptr);
      ++ptr;
   }
ITM_SendChar(',');
ptr=Msg1 ;
 while(*ptr != '\0'){
      ITM_SendChar(*ptr);
      ++ptr;
   }
ITM_SendChar('\n');
}
void printMsg2p(const int a, const int b)
{
char Msg[100];
char *ptr;
sprintf(Msg, "%x", a);
ptr = Msg ;
   while(*ptr != '\0')
{
      ITM_SendChar(*ptr);
      ++ptr;
   }
sprintf(Msg, "%x", b);
ptr = Msg ;
   while(*ptr != '\0')
{
      ITM_SendChar(*ptr);
      ++ptr;
   }
}

void printMsg4p(const int a, const int b, const int c, const int d, const int e)
{
char Msg[100];
char *ptr;
// Printing the message
sprintf(Msg,"\nPrinting First parameter a:  ");
ptr = Msg ;
   while(*ptr != '\0')
{
      ITM_SendChar(*ptr);
      ++ptr;
   }
//Printing the first parameter
sprintf(Msg, "%x", a);
ptr = Msg ;
   while(*ptr != '\0')
{
      ITM_SendChar(*ptr);
      ++ptr;
   }
// Printing the message
sprintf(Msg,"\nPrinting Second parameter b: ");
ptr = Msg ;
   while(*ptr != '\0')
{
      ITM_SendChar(*ptr);
      ++ptr;
   }
sprintf(Msg, "%x", b);
ptr = Msg ;
   while(*ptr != '\0')
{
      ITM_SendChar(*ptr);
      ++ptr;
   }
// Printing the message
sprintf(Msg,"\nPrinting Third parameter c: ");
ptr = Msg ;
   while(*ptr != '\0')
{
      ITM_SendChar(*ptr);
      ++ptr;
   }
sprintf(Msg, "%x", c);
ptr = Msg ;
   while(*ptr != '\0')
{
      ITM_SendChar(*ptr);
      ++ptr;
   }
// Printing the message
sprintf(Msg,"\nPrinting Four parameter d: ");
ptr = Msg ;
   while(*ptr != '\0')
{
      ITM_SendChar(*ptr);
      ++ptr;
   }
sprintf(Msg, "%x", d);
ptr = Msg ;
   while(*ptr != '\0')
{
      ITM_SendChar(*ptr);
      ++ptr;
}

// Printing the message
sprintf(Msg,"\nPrinting Fifth parameter e (check this value is correct or not): ");
ptr = Msg ;
   while(*ptr != '\0')
{
      ITM_SendChar(*ptr);
      ++ptr;
   }

 sprintf(Msg, "%x", e);
ptr = Msg ;
   while(*ptr != '\0')
{
      ITM_SendChar(*ptr);
      ++ptr;
   }
}

