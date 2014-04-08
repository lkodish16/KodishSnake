// create instance variables for player x, player y (starting coordinates)
// create a direction variable (integer that holds which button was last pressed. 
// each time through the loop, check the direction.
// if the left button is pressed, decrase x by 1
// if the right button is pressed, add 1 to x
// if the up button is pressed, add 1 to y
// if the down button is pressed, decrease y by 1
// adjust values. 
// create a dot that appears on a random place on the screen.
// if the player touches the dot, increase length of snake by one and put the dot in another random place. 
// if player touches any dot on himself, game over. 
// draw slate, delay, clearslate
    
#include <MeggyJrSimple.h>    // required line of code. Line 1 of 2.

void setup()
{
  MeggyJrSimpleSetup();    // required line of code. Line 2 of 2.
}

int xcoord = 4;
int ycoord = 4;
int dir = 1;


void loop() {
  DrawPx(xcoord, ycoord, 15);
  DisplaySlate();
  delay(150);
  ClearSlate();
  CheckButtonsPress();

  if (Button_Up)   // if up button is pressed, reassign dir to 0.
  {
    dir = 0;
  }
  if (dir == 0)     // if up button was the last button pressed, increase y by 1.
  {
    ycoord++;
  }
  if (ycoord == 8)     // wraps around if it reaches the top of the screen.
  {
    ycoord = 0;
  }
  
  
  
  
  if (Button_Down)    // if down button is pressed, reassign dir to 180.
  {
   dir = 180;
  }
  if (dir == 180)    // if down button was the last button pressed, decrease y by 1.
  {
    ycoord--;
  }
  if (ycoord == -1)    // wraps around if the reaches the bottom of the screen.
  {
    ycoord = 7;
  }
  
  
  
  if (Button_Right)    // if right button is pressed, reassign dir to 90. 
  {
    dir = 90;
  }
  if (dir == 90)    // if right button was the last button pressed, increase x by 1.
  {
    xcoord++;
  }
  if (xcoord == 8)    // wraps around if it reaches the very left of the screen.
  {
    xcoord = 0;
  }
  
  if (Button_Left)    // if left button is pressed, reassign dir to 270.
  {
    dir = 270;
  } 
  if (dir == 270)    // if left button was the last button pressed, decrease x by 1.
  {
    xcoord--;
  }
  if (xcoord == -1)    // wraps around if it reaches the very right of the screen.
  {
    xcoord = 7;
  }
}



