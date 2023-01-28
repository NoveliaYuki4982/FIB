/* 
 * Created:   2021
 * Processor: PIC18F45K22
 * Compiler:  MPLAB XC8
 */

#include <xc.h>
#include <string.h>
#include <stdlib.h>
#include "config.h"
#include "GLCD.h"
#define _XTAL_FREQ 8000000  

const char * T = "L7 GLCD \n";
const char * Noa = "Noa \n";
const char * Jin = "JIN \n";
const char * Nico = "Nico \n";
const char * posX = "X =  \n";
const char * posY = "Y =  \n";

typedef struct posicio {
   byte x;
   byte y;
} posicio;

void writeTxt(byte page, byte y, char * s) {
   int i=0;
   while (*s!='\n' && *s!='\0') 
   {
      putchGLCD(page, y+i, *(s++));
      i++;
   };
}	

int nouP(posicio z[], byte x, byte y,int size, int mes){ //if mes = 0 no s'ha menjat poma. si 1 sí menja
      if ((mes != 0) && (size < 100)){ 
	 z[size] = z[size -1];
	 ++size;
      }
      else {
	 ClearDot(z[size - 1].x, z[size-1].y);
      }
      for(int i = size -1; i > 0; --i){
	 z[i] = z[i -1];
      }
      
      z[0].x = x;
      z[0].y = y;
      SetDot(x, y);
      
      return size;
   
   
}

void main(void)
{
   
   
   ANSELA=0x00; 
   ANSELB=0x00;                  
   ANSELC=0x00;                  
   ANSELD=0x00;                  
   
   TRISA=0xFF;	
   TRISD=0x00;		   
   TRISB=0x80;
   TRISC=0x83;
   
   PORTA=0x00;	
   PORTD=0x00;
   PORTB=0x00;
   PORTC=0x00; 
   
   GLCDinit();		   //Inicialitzem la pantalla
   clearGLCD(0,7,0,127);   //Esborrem pantalla
   setStartLine(0);        //Definim linia d'inici
   
   
   
   byte x = 0;
   byte y = 0;
   int size = 1;
   
   posicio z[100];
   z[0].x = 0;
   z[0].y = 0;
   
   posicio poma;
   poma.x = rand()%64;
   poma.y = rand()%128;

   //writeTxt(7, 0, s1);
   writeTxt(2, 6, T);
   writeTxt(3, 6, Noa);
   writeTxt(4, 6, Jin);
   writeTxt(5, 6, Nico);
   
   __delay_ms(2000);
   clearGLCD(0, 7, 0, 127);
   
   writeTxt(6, 18, posX);
   writeTxt(7, 18, posY);
   
   writeNum(6, 22, x);
   writeNum(7, 22, y);
   
   SetDot(z[0].x, z[0].y);
   SetDot(poma.x, poma.y);
   int m = 0;
   while (1)
   {   
      __delay_ms(50);
      
      
	 if((PORTCbits.RC7) == 1){ //abaix
	    //ClearDot(x, y);
	    x = (x+1)%64;
	    clearGLCD(6, 7, 109, 127);
	    writeNum(6, 22, x);
	    writeNum(7, 22, y);
	    //SetDot(x, y);
	    size = nouP(z, x, y, size, m);
	    m = 0;
	 }
	 if((PORTC & 0x01) == 0x01){ // Dreta
	    //ClearDot(x, y);
	    
	    y = (y+1)%128;
	    clearGLCD(6, 7, 109, 127);
	    writeNum(6, 22, x);
	    writeNum(7, 22, y);
	    //SetDot(x, y);
	    size =nouP(z, x, y, size, m);
	    m = 0;
	    
	    
	    /*clearGLCD(6, 7, 109, 127);
	    writeNum(6, 22, x);
	    writeNum(7, 22, y);
	    SetDot(x, y);*/
	 }
	 if((PORTB & 0x80) == 0x80){ // amunt
	    //ClearDot(x, y);
	    x = (x-1)%64;
	    clearGLCD(6, 7, 109, 127);
	    writeNum(6, 22, x);
	    writeNum(7, 22, y);
	    //SetDot(x, y);
	    size =nouP(z, x, y, size, m);
	    m = 0;
	    /*clearGLCD(6, 7, 109, 127);
	    writeNum(6, 22, x);
	    writeNum(7, 22, y);
	    SetDot(x, y);*/
	 }
	 if((PORTC & 0x02) == 0x02){ //esquerre
	    //ClearDot(x, y);
	   
	    y = (y-1)%128;
	    
	    clearGLCD(6, 7, 109, 127);
	    writeNum(6, 22, x);
	    writeNum(7, 22, y);
	    //SetDot(x, y);
	    size =nouP(z, x, y, size, m);
	    m = 0;
	    
	    /*clearGLCD(6, 7, 109, 127);
	    writeNum(6, 22, x);
	    writeNum(7, 22, y);
	    SetDot(x, y);*/
	 }
	 
      if ((poma.x == z[0].x) &&(poma.y == z[0].y)){
	 m = 1;
	 poma.x = rand()%64;
	 poma.y = rand()%128;
	 SetDot(poma.x, poma.y);
      }
	 
      
      
      
   }
}
