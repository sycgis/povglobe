# povglobe
Arduino based POV Globe
Automatically exported from code.google.com/p/povglobe

Overview
Arduino based POV globe capable of displaying monocolour bitmaps upto 72 pixels high and x width. (uses 72 LEDs, and one input to get rotation speed)

Arduino byte array for images are generated using the c# program included in this project

Image displayed is synch'd to speed of motor using a reed switch, this allows image to display around hole globe correctly, and maintain a constant position.

Code has been added to move the image slowly (so globe rotates nicely)
