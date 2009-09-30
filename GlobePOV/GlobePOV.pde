#include <avr/pgmspace.h>

#include "Defines.h"

#include "World72PixelBMPData.h"

//#include "World2BitmapReverse.h"

//#include "TestImage1.h"

#include "Globals.h"

void setup() 
{
 // Serial.begin(9600);
  pinMode(2, INPUT);
  attachInterrupt(SpinInterrupt, spinInterrupt, FALLING);

  pinMode(SpinInput, INPUT);


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

  for(int j = 0; j < ImageRows; j++)
  {
    digitalWrite(pins[j][0], LEDOrientation);
    digitalWrite(pins[j][1], !LEDOrientation);
  }
  
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
    delay(100);
  }
  lastSpinTime = micros();

}

bool inInterrupt = false;
void spinInterrupt()
{
  if(!inInterrupt)
  {
    inInterrupt = true;
    if(micros()  - lastSpinTime < inturruptDebounce)
    {
      unsigned long spinTime = micros() - lastSpinTime;
      microsPerPixelColumn = spinTime / ImageColumns;
      microsPerPixelEight = microsPerPixelColumn / LEDEightsCount;
      inturruptDebounce = max(10, spinTime / 2);
      
      column = 0;
      row = 0;
      
      lastSpinTime = micros();
    }
    inInterrupt = false;
  }
}

bool GetImagePoint(int row, int column)
{
  int picbit = pgm_read_byte(&(Image[row][column])); 
  return picbit == 1;
}

void loop()
{
//  for(column = 0; column < ImageColumns; column++)
//  {
//    lastColumnTime = micros();
//   // while(micros() - lastColumnTime < microsPerPixelColumn)
//   // {
//      for(row = 0; row < ImageRows ; row++)
//      {
//        DrawLED(column, row);
//      }
//   // }
//  }
  for(column = 0; column < ImageColumns; column++)
  {
    for(LEDEight = 0; row < LEDEights ; LEDEight++)
    {
      DrawLEDGroupsAtOnce(LEDEight, column);
    }
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

int lastRowOn = 0;

//columns are width
//rows are hight (72 for 72 LEDS)
void DrawLED(int column, int row)
{
//  //ROWS First for pins
  digitalWrite(pins[lastRowOn][0], LEDOrientation);
  digitalWrite(pins[lastRowOn][1], !LEDOrientation);
  
  //Serial.println("in draw led");
  if(GetImagePoint(row, column))
  {
      //Serial.println(column);
    digitalWrite(pins[row][0], !LEDOrientation);
    digitalWrite(pins[row][1], LEDOrientation);
    lastRowOn = row;
  }
}

char GetImageLEDEights(int eight, int column)
{
  return pgm_read_byte(&(Image[eight][column])); 
}

void DrawLEDGroupsAtOnce(int eight, int column)
{
//  //ROWS First for pins
  digitalWrite(pins[lastRowOn][0], LEDOrientation);
  
  char imageEights = GetImageLEDEights(eight, column);
  
  PORTB = PORTB & (imageEights & B11000000);
  PORTC = imageEights >> 2;
  
//  digitalWrite(eightpins[0], bitRead(imageEights, 7));
//  digitalWrite(eightpins[1], bitRead(imageEights, 6));
//  digitalWrite(eightpins[2], bitRead(imageEights, 5));
//  digitalWrite(eightpins[3], bitRead(imageEights, 4));
//  digitalWrite(eightpins[4], bitRead(imageEights, 3));
//  digitalWrite(eightpins[5], bitRead(imageEights, 2));
//  digitalWrite(eightpins[6], bitRead(imageEights, 1));
//  digitalWrite(eightpins[7], bitRead(imageEights, 0));
    
  digitalWrite(pins[row][0], !LEDOrientation);
     
  delayMicroseconds(microsPerPixelEight);
  
  lastRowOn = row;
  
}

