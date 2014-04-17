
#include <MeggyJrSimple.h>  // required line of code. Line 1 of 2.

void setup()
{
  MeggyJrSimpleSetup();  // required line of code. Line 2 of 2.
}

int dir = 1;  // placeholder value for dir so it doesn't move until the player presses a directional button.
int xapple, yapple;  
boolean ateApple = true;
int score = 0;
int length = 0;
struct Point {  // name for the class.
  int x;  // x coordinate.
  int y;  // y coordinate
};

Point s1 = {4,3};  // coordinates for first point on the snake.
Point s2 = {5,3};  // coordinates for second point on the snake.
Point s3 = {6,3};  // coordinates for third point on the snake.
Point s4 = {7,3};  // coordinates for fourth point on the snake.

Point snakeArray[64] = {s1, s2, s3, s4};  // array that holds the coordinates of the points on the snake. 


void loop() {
  drawSnake(); 
  directions();
  snakeUpdate();
  drawApple();
  DisplaySlate();
  ClearSlate();
  delay(100);
}

void drawSnake() {  // draws first 4 points of the snake. 
    DrawPx(snakeArray[0].x, snakeArray[0].y, Green); 
}
  
  
void directions() { 
  CheckButtonsPress();  // allows button input. 

  if (Button_Up) {  // if up button is pressed, reassign dir to 0.
    dir = 0;
  }  
  if (Button_Down) {  // if down button is pressed, reassign dir to 180.
    dir = 180;
  } 
  if (Button_Right)  { // if right button is pressed, reassign dir to 90. 
    dir = 90;
  } 
  if (Button_Left) {  // if left button is pressed, reassign dir to 270.
    dir = 270;
  } 
  
  if (dir == 0) {  // if up button was the last button pressed, increase y by 1.
    snakeArray[0].y++; 
  }  
  if (dir == 180) {  // if down button was the last button pressed, decrease y by 1.
    snakeArray[0].y--;
  } 
  if (dir == 90) {  // if right button was the last button pressed, increase x by 1.
    snakeArray[0].x++;
  }
  if (dir == 270) {  // if left button was the last button pressed, decrease x by 1.
    snakeArray[0].x--;
  }
  
  
  if (snakeArray[0].x == -1) {  // snake wraps around from left to right.
    snakeArray[0].x = 7;
  } 
  if (snakeArray[0].x == 8) {  // snake wraps around from right to left.
    snakeArray[0].x = 0;
  }
  if (snakeArray[0].y == -1) {  // snake wraps around from bottom to top.  
    snakeArray[0].y = 7;
  }
  if (snakeArray[0].y == 8) {  // snake wraps around from top to bottom.
    snakeArray[0].y = 0;
  }
}
void drawApple() {
  if (ateApple) {  // sets random coordinates for apple. 
    xapple = random(8);  // x-coordinate is random.
    yapple = random(8);  // y-coordinate is random.
    ateApple = false;
  }
  DrawPx(xapple, yapple, Red);    // draws apple
  if (snakeArray[0].x == xapple && snakeArray[0].y == yapple) {  // if snake touches apple, reset coordinates of apple.
        ateApple = true;
        score++;
        length++;
        Tone_Start(5000, 50);       
  } 
}

void snakeUpdate() { 
  for (int i = length; i > 0; i--) {
    snakeArray[i].x = snakeArray[i-1].x;
    snakeArray[i].y = snakeArray[i-1].y;   
    DrawPx(snakeArray[i].x, snakeArray[i].y, 15);
  } 
} 


