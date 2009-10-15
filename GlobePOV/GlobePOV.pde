#include "WProgram.h"

#include <avr/pgmspace.h>

#include "Defines.h"

//#include "Test.h"

#include "World72PixelBMPData.h"

//#include "Pumpkin.h"

//#include "World2BitmapReverse.h"

//#include "TestImage1.h"

#include "Globals.h"

#include "HackADaySmall.h"

//#include "Us.h"

void setup() 
{
 // Serial.begin(9600);
 
 CurrentColumns = ImageColumns;
 
  pinMode(SpinInput, INPUT);
  
  lastImageChange = millis();
  lastSpinTime = micros();

  pinMode(col0, OUTPUT);
  pinMode(col1, OUTPUT);
  pinMode(col2, OUTPUT);
  pinMode(col3, OUTPUT);
  pinMode(col4, OUTPUT);
  pinMode(col5, OUTPUT);
  pinMode(col6, OUTPUT);
  pinMode(col7, OUTPUT);
  pinMode(col8, OUTPUT);

  pinMode(row0, OUTPUT);
  pinMode(row1, OUTPUT);
  pinMode(row2, OUTPUT);
  pinMode(row3, OUTPUT);
  pinMode(row4, OUTPUT);
  pinMode(row5, OUTPUT);
  pinMode(row6, OUTPUT);
  pinMode(row7, OUTPUT);

  Clear();
  
  //ALL ON
  for(int j = 0; j < ImageRows; j++)
  {
     for(int j = 0; j < ImageRows; j++)
    {
      digitalWrite(pins[j][0], LEDOrientation);
      digitalWrite(pins[j][1], !LEDOrientation);
    }
    digitalWrite(pins[j][0], !LEDOrientation);
    digitalWrite(pins[j][1], LEDOrientation);
    delay(30);
  }
  
  attachInterrupt(SpinInterrupt, spinInterrupt, FALLING);

}

bool inInterrupt = false;
unsigned long spinTime = 0;
void spinInterrupt()
{
  if(lastSpinTime == 0)
  {
    lastSpinTime = micros();
    return;
  }
  if(!inInterrupt && micros() - lastSpinTime > inturruptDebounce)
  {
    inInterrupt = true;
    unsigned long newSpinTime = micros() - lastSpinTime;
    
    if(spinTime != 0 && (newSpinTime > spinTime*2 || newSpinTime < spinTime/2))
    {
      inInterrupt = false;
      return;
    }
    spinTime = newSpinTime;
    
    if(millis() - lastImageChange > ImageDisplayTime)
    {
        lastImageChange = millis();
        image++;
        if(image > 1)
        {
          image = 0;
        }
        switch(image)
        {
        case 0:
          CurrentColumns = ImageColumns;
        case 1:
           CurrentColumns = Image2Columns;
        }
        spinCount = 0;
    }
    
    microsPerPixelColumn = spinTime / CurrentColumns;
    microsPerPixelEight = microsPerPixelColumn / LEDEights;
   
    
    spinCount++;
    if(spinCount > 20)
    {
      columnOffset++;
      if(columnOffset >= CurrentColumns)
      {
        columnOffset = 0;
      }
      spinCount = 0;
    }
    
    
    
    column = columnOffset;
    LEDEight = 0;
    
    lastSpinTime = micros();
    inInterrupt = false;
  }
}

void loop()
{
  for(column = 0; column < CurrentColumns; column++)
  {
    for(LEDEight = 0; LEDEight < LEDEights ; LEDEight++)
    {
      DrawLEDGroupsAtOnce(LEDEight, column);
    }
    //delayMicroseconds(microsPerPixelColumn);
  }

}

void Clear()
{
  for(int j = 0; j < ImageRows; j++)
  {
    digitalWrite(pins[j][0], LEDOrientation);
    digitalWrite(pins[j][1], !LEDOrientation);
  }
}


char GetImageLEDEights(int eight, int column)
{
  switch(image)
  {
  case 0:
    return pgm_read_byte(&(Image[column][eight])); 
  case 1:
     return pgm_read_byte(&(Image2[column][eight])); 
  }
}

void DrawLEDGroupsAtOnce(int eight, int column)
{
  //digitalWrite(eightpins[lastEightOn][1], LEDOrientation);
  
  prog_uint8_t imageEights = GetImageLEDEights(eight, column);
  
  PORTB = (PORTB | B00110000) & ((imageEights << 4) | B11001111);
  PORTC = (PORTC | B00111111) & ((imageEights >> 2) | B11000000);
    
  digitalWrite(eightpins[eight][1], !LEDOrientation);
  
  if(microsPerPixelEight > 20)//18
  {
    delayMicroseconds(microsPerPixelEight - 20);//18
  }
  
  digitalWrite(eightpins[eight][1], LEDOrientation);
  //lastEightOn = eight;
}


