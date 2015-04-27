# POV Globe using arduino (atmega328P) and 72 SMD Leds #

<img src='http://povglobe.googlecode.com/files/DSC05853.JPG' width='660'>

<h2>Overview</h2>
Arduino based POV globe capable of displaying monocolour bitmaps upto 72 pixels high and x width. (uses 72 LEDs, and one input to get rotation speed)<br>
<br>
Arduino byte array for images are generated using the c# program included in this project<br>
<br>
Image displayed is synch'd to speed of motor using a reed switch, this allows image to display around hole globe correctly, and maintain a constant position.<br>
<br>
Code has been added to move the image slowly (so globe rotates nicely)<br>
<br>
Some Images I have displayed on globe are shown below<br>
<br>
<table><tr>
<td>
<img src='http://povglobe.googlecode.com/files/world%2072%20pixels%202.bmp?test.jpg' />
</td>
<td>
<img src='http://povglobe.googlecode.com/files/hackaday2.bmp?test.jpg' />
</td>
<td>
<img src='http://povglobe.googlecode.com/files/pumpkin.bmp?test.jpg' />
</td>
<td>
<img src='http://povglobe.googlecode.com/files/us.bmp?test.jpg' />
</td>
</tr></table>

Here's a picture of the globe showing the Hack a Day symbol.<br>
<br>
<img src='http://povglobe.googlecode.com/files/DSC05856.JPG' width='660'>

At present I have the code rotating through 2 images showing each for a minute (this was done quickly and was a bit of a hack so needs doing properly still, I don't like the code)<br>
<br>
<h2>Circuit</h2>

Here is a schematic of the POV globe circuit, I tried to keep this as simple and with as few components for a few reasons, firstly I didn't want to spend anything making this (it is just a bit of fun), also I wanted to keep the weight of the rotating parts to a minimum. So for example you might notice the lack of resistors on the LED's, with my setup  this hasn't caused problems (yet), but I know I should have included them.<br>
<br>
<img src='http://povglobe.googlecode.com/files/POVGlobeSchematic.png' width='960'>

There is a eagle schematic in the downloads section also.<br>
<br>
The LED's I found at work being thrown out, hence I didn't choose the colour etc.<br>
I soldered them with common anode/cathode (cant remember) in eights, soldered other side of first banck of LED's to individual long wires, these were then folded and soldered to matching LED on following 9 banks, its great working with the varnished wire, no stripping etc, just heat the wire with solder and it burns of the varnish at that point. Another tip, soldering the LED's I stuck them face down onto masking tape to keep them in place, image of soldering in progress below and mounted (using messy hot glue after failing with super glue, hence its a bit of a mess, but works).<br>
<br>
<img src='http://povglobe.googlecode.com/files/IMG_0719.JPG' width='360'>
<img src='http://povglobe.googlecode.com/files/DSC05839.jpg' width='360'>

I went through a number of designs to transfer power to the rotating parts, my second most successful solution was on a different frame (using a big drill motor) to pass ground through the motor to the base of the cylinder, and use washers to pas +12v to the top of the cylinder, problem with this design was that it would occasionally loose contact, resetting the atmega. I thought about using a super cap as a backup battery, but didn't have any, so went to a smaller frame design (far nicer) and used a audio jack and socket, this design is working perfectly never skipping. Picture Below:<br>
<br>
<img src='http://povglobe.googlecode.com/files/DSC05842.jpg' width='360'>

With the new frame I wanted a quite easy to mount/use motor, so I hacked apart a cheap 2 wire computer fan (Highest power I had 20mA I think), these are brushless motors with there own driver circuit built in, very quite, but also low power.<br>
Here is a picture of the fan motor with fins and housing cut away, and bolt hot glued to the centre of the top ready for the globe cylinder to be attached.<br>
<br>
<img src='http://povglobe.googlecode.com/files/IMG_0757.JPG' width='360'>
<img src='http://povglobe.googlecode.com/files/DSC05840.jpg' width='360'>

The globe cylinder was made from the lid of a DVD stack, again it was lying around and was the perfect circumference for my 72 soldered LEDs. Also very light weight and as a bonus a bit see through. DVD stack lid incase you dont know what one looks like :-)<br>
<br>
<img src='http://povglobe.googlecode.com/files/IMG_0759.JPG' width='360'>

The headphone socket was soldered to the circuit, this was then put through a hole melted in the DVD case cylinder and screwed into place, this is them simply plugged into the headphone plug screwed into a threaded hole in the metal frame, ground is provided through the frame, +5V runs to a pin on the headphone plug through a wire going up the frame back, from the regulator circuit soldered onto the back of the on off switch bolted to the frame.<br>
<br>
<img src='http://povglobe.googlecode.com/files/DSC05835.jpg' width='360'>
<img src='http://povglobe.googlecode.com/files/DSC05834.jpg' width='360'>
<img src='http://povglobe.googlecode.com/files/DSC05844.jpg' width='360'>
<img src='http://povglobe.googlecode.com/files/DSC05843.jpg' width='360'>
<img src='http://povglobe.googlecode.com/files/DSC05827.jpg' width='360'>
<img src='http://povglobe.googlecode.com/files/DSC05833.jpg' width='360'>

Reed switch was simply hot glued to globe cylinder, the magnet to activate this holds itself in place on the inside of the frame (can be seen in some of the photos, its a thin bendable magnet I took from a dead dc motor, but any magnet that would close the reed switch at the distance etc. would have done)<br>
<br>
<img src='http://povglobe.googlecode.com/files/DSC05838.jpg' width='360'>

So here are some pictures of the initial working globe<br>
<br>
<img src='http://povglobe.googlecode.com/files/DSC05827.jpg' width='360'>
<img src='http://povglobe.googlecode.com/files/DSC05847.jpg' width='360'>
<img src='http://povglobe.googlecode.com/files/DSC05844.jpg' width='360'>
<img src='http://povglobe.googlecode.com/files/DSC05831.jpg' width='360'>

And here are some low res sometimes blurry images of it working I tried videoing it but with the frame rates etc it looked rubbish.<br>
<br>
<img src='http://povglobe.googlecode.com/files/IMG_0760.JPG' width='360'>
<img src='http://povglobe.googlecode.com/files/IMG_0761.JPG' width='360'>
<img src='http://povglobe.googlecode.com/files/IMG_0762.JPG' width='360'>
<img src='http://povglobe.googlecode.com/files/IMG_0763.JPG' width='360'>
<img src='http://povglobe.googlecode.com/files/IMG_0764.JPG' width='360'>
<img src='http://povglobe.googlecode.com/files/IMG_0765.JPG' width='360'>
<img src='http://povglobe.googlecode.com/files/IMG_0766.JPG' width='360'>
<img src='http://povglobe.googlecode.com/files/IMG_0767.JPG' width='360'>
<img src='http://povglobe.googlecode.com/files/IMG_0768.JPG' width='360'>
<img src='http://povglobe.googlecode.com/files/IMG_0769.JPG' width='360'>
<img src='http://povglobe.googlecode.com/files/IMG_0770.JPG' width='360'>
<img src='http://povglobe.googlecode.com/files/IMG_0771.JPG' width='360'>
<img src='http://povglobe.googlecode.com/files/IMG_0772.JPG' width='360'>
<img src='http://povglobe.googlecode.com/files/IMG_0773.JPG' width='360'>
<img src='http://povglobe.googlecode.com/files/IMG_0774.JPG' width='360'>
<img src='http://povglobe.googlecode.com/files/IMG_0775.JPG' width='360'>
<img src='http://povglobe.googlecode.com/files/IMG_0776.JPG' width='360'>