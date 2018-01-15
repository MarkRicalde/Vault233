//In this game the goal is to get to the end without touching the walls. Everytime you touch the walls your score goes up. If your score reaches 250, you must retsart from the beginning


//booleans
boolean puzzle_ball = false;
boolean puzzle_ball_check = false;

void ball_game() //calls each function
{
  movement();  
  wallsandthebouncingball();
  collision();
}

void collision() {

  // determines whether the ball that the user collides with any of the rectangles
  boolean collisionDetected = isCollidingCircleRectangle(circleLocationX, circleLocationY, 
  circleRadius, rectangleLocationX, rectangleLocationY, rectangleWidth, rectangleHeight);

  boolean collisionDetected2 = isCollidingCircleRectangle(circleLocationX, circleLocationY, 
  circleRadius, rectangleLocationX2, rectangleLocationY2, rectangleWidth2, rectangleHeight2);

  boolean collisionDetected3 = isCollidingCircleRectangle(circleLocationX, circleLocationY, 
  circleRadius, rectangleLocationX3, rectangleLocationY3, rectangleWidth3, rectangleHeight3);

  boolean collisionDetected4 = isCollidingCircleRectangle(circleLocationX, circleLocationY, 
  circleRadius, rectangleLocationX4, rectangleLocationY4, rectangleWidth4, rectangleHeight4);   

  boolean collisionDetected5 = isCollidingCircleRectangle(circleLocationX, circleLocationY, 
  circleRadius, rectangleLocationX5, rectangleLocationY5, rectangleWidth5, rectangleHeight5);  

  boolean collisionDetected6 = isCollidingCircleRectangle(circleLocationX, circleLocationY, 
  circleRadius, rectangleLocationX6, rectangleLocationY6, rectangleWidth6, rectangleHeight6);  

  boolean collisionDetected7 = isCollidingCircleRectangle(circleLocationX, circleLocationY, 
  circleRadius, rectangleLocationX7, rectangleLocationY7, rectangleWidth7, rectangleHeight7);  

  boolean collisionDetected8 = isCollidingCircleRectangle(circleLocationX, circleLocationY, 
  circleRadius, rectangleLocationX8, rectangleLocationY8, rectangleWidth8, rectangleHeight8);  

  boolean collisionDetected9 = isCollidingCircleRectangle(circleLocationX, circleLocationY, 
  circleRadius, rectangleLocationX9, rectangleLocationY9, rectangleWidth9, rectangleHeight9);

  boolean collisionDetected10 = isCollidingCircleRectangle(circleLocationX, circleLocationY,  
  circleRadius, rectangleLocationX10, rectangleLocationY10, rectangleWidth10, rectangleHeight10);

  boolean collisionDetected11 = isCollidingCircleRectangle(circleLocationX, circleLocationY, 
  circleRadius, rectangleLocationX11, rectangleLocationY11, rectangleWidth11, rectangleHeight11);
  
   boolean collisionDetected12 = isCollidingCircleRectangle(circleLocationX, circleLocationY,  
  circleRadius, rectangleLocationX12, rectangleLocationY12, rectangleWidth12, rectangleHeight12);
  
  boolean collisionDetected13 = isCollidingCircleRectangle(circleLocationX, circleLocationY,  
  circleRadius, rectangleLocationX13, rectangleLocationY13, rectangleWidth13, rectangleHeight13);

  // if the ball does collide with one of the rectangles, this if statement will determine what will happen
  if ((collisionDetected == true) || (collisionDetected2 == true) || (collisionDetected3 == true) || (collisionDetected4 == true) || (collisionDetected5 == true) || (collisionDetected6 == true) || (collisionDetected7 == true) || (collisionDetected8 == true) || (collisionDetected9 == true) || (collisionDetected10 == true) || (collisionDetected12 == true) || (collisionDetected13 == true)) {
    text(count_touch, 30, 200);
    count_touch++;
  } else {
    fill(255);     // white for no collision
    text(count_touch, 30, 200);
  }

  if ((collisionDetected11 == true)) {
    text("You won!!!!!", 30, 200);
    puzzle_ball = false;
    circleLocationX = 10;
    circleLocationY = 10;
    count_touch = 0;
    hero.position.x = 130;
    hero.position.y = 290;
    fire_buff = true;
    puzzle_ball_check = true;
    puzzle_finished.play();
    puzzle_finished.rewind();
    stage = 2;
  } else {
    fill(255);     // white for no collision
    text(count_touch, 30, 200);
  }

  if (count_touch == 250) {
    circleLocationX = 10;
    circleLocationY = 10;
    count_touch = 0;
  }

  ellipse(circleLocationX, circleLocationY, circleRadius*2.0, circleRadius*2.0);
}



//this is the code that determines whether the ball that the user is controlling collided with one of the rectangles on the screen.
boolean isCollidingCircleRectangle(
float circleX, 
float circleY, 
float radius, 

float rectangleX, 
float rectangleY, 
float rectangleWidth, 
float rectangleHeight)
{
  float circleDistanceX = abs(circleX - rectangleX - rectangleWidth/2);
  float circleDistanceY = abs(circleY - rectangleY - rectangleHeight/2);

  if (circleDistanceX > (rectangleWidth/2 + radius)) { 
    return false;
  }
  if (circleDistanceY > (rectangleHeight/2 + radius)) { 
    return false;
  }

  if (circleDistanceX <= (rectangleWidth/2)) { 
    return true;
  }
  if (circleDistanceY <= (rectangleHeight/2)) { 
    return true;
  }

  float cornerDistance_sq = pow(circleDistanceX - rectangleWidth/2, 2) +
    pow(circleDistanceY - rectangleHeight/2, 2);

  return (cornerDistance_sq <= pow(radius, 2));
}

void movement() {



  // move the ball that the user is controlling to the mouse coordinates

  if (mouseX>circleLocationX) {
    circleLocationX+=2;
  }

  if (mouseX<circleLocationX) {
    circleLocationX+=-2;
  }
  if (mouseY<circleLocationY) {
    circleLocationY+=-2;
  }
  if (mouseY>circleLocationY) {
    circleLocationY+=2;
  }
}

//Variables
int x_ball = 450; //x coordinate of where the shape will start
int y_ball = 200; //y coordinate of where the shape will start
int xchange = 10; // How much the shape will move in the x direction  
int ychange = 25; //How much the shape will move in the y direction, having this more than xchange will give it the sporratic "flying object" motion.


int count_touch = 0; //wil count the score. If the score reaches 250, the user will have to restart from the beginning

float circleLocationX =10;  //location of the circle and its radius
float circleLocationY = 10;
float circleRadius = 10.0;

// This is the code for all the rectangles, including their width, height, and location
float rectangleLocationX = 0.0;
float rectangleLocationY = 65.0;
float rectangleWidth = 25.0;
float rectangleHeight = 350.0;

float rectangleLocationX2 = 0.0;
float rectangleLocationY2 = 45.0;
float rectangleWidth2 = 455.0;
float rectangleHeight2 = 20.0;

float rectangleLocationX3 = 120.0;
float rectangleLocationY3 = 95.0;
float rectangleWidth3 = 555.0;
float rectangleHeight3 = 20.0;

float rectangleLocationX4 = 0.0;
float rectangleLocationY4 = 145.0;
float rectangleWidth4 = 555.0;
float rectangleHeight4 = 20.0;

float rectangleLocationX5 = 120.0;
float rectangleLocationY5 = 195.0;
float rectangleWidth5 = 555.0;
float rectangleHeight5 = 20.0;

float rectangleLocationX6 = 0.0;
float rectangleLocationY6 = 245.0;
float rectangleWidth6 = 555.0;
float rectangleHeight6 = 20.0;

float rectangleLocationX7 = 120.0;
float rectangleLocationY7 = 295.0;
float rectangleWidth7 = 555.0;
float rectangleHeight7 = 20.0;

float rectangleLocationX8 = 0.0;
float rectangleLocationY8 = 345.0;
float rectangleWidth8 = 555.0;
float rectangleHeight8 = 20.0;

float rectangleLocationX9 = 120.0;
float rectangleLocationY9 = 405.0;
float rectangleWidth9 = 555.0;
float rectangleHeight9 = 20.0;

float rectangleLocationX10 = 0.0;
float rectangleLocationY10 = 495.0;
float rectangleWidth10 = 555.0;
float rectangleHeight10 = 20.0;

float rectangleLocationX12 = 120.0;
float rectangleLocationY12 = 580.0;
float rectangleWidth12 = 555.0;
float rectangleHeight12 = 20.0;

float rectangleLocationX13 = 0.0;
float rectangleLocationY13 = 415.0;
float rectangleWidth13 = 25.0;
float rectangleHeight13 = 350.0;

float rectangleLocationX11 = 620;
float rectangleLocationY11 = 640.0;
float rectangleWidth11 = 15.0;
float rectangleHeight11 = 20.0;






int xdistractor = 450; //x coordinate of where the shape will start
int ydistractor = 200; //y coordinate of where the shape will start
int xchangedistractor = 10; // How much the shape will move in the x direction  
int ychangedistractor = 25; //How much the shape will move in the y direction, having this more than xchange will give it the sporratic "flying object" motion.

void wallsandthebouncingball() {
  background(0); //resets the background

  text("For this game you have to get to the end square without touching the walls! Use the mouse to control where you go!!", 20, 20);
  text("The more you touch the wall the higher the score will go! No points are added for touching the circles. If the score reaches 250, you have to restart!!", 20, 40);


  // draw the rectangles, these are the walls that the user is not allowed to touch
  fill((int)random(0, 255), (int)random(0, 255), (int)random(0, 255));
  rect(rectangleLocationX, rectangleLocationY, rectangleWidth, rectangleHeight);

  fill((int)random(0, 255), (int)random(0, 255), (int)random(0, 255));
  rect(rectangleLocationX2, rectangleLocationY2, rectangleWidth2, rectangleHeight2);

  fill((int)random(0, 255), (int)random(0, 255), (int)random(0, 255));
  rect(rectangleLocationX3, rectangleLocationY3, rectangleWidth3, rectangleHeight3);

  fill((int)random(0, 255), (int)random(0, 255), (int)random(0, 255));
  rect(rectangleLocationX4, rectangleLocationY4, rectangleWidth4, rectangleHeight4);

  fill((int)random(0, 255), (int)random(0, 255), (int)random(0, 255));
  rect(rectangleLocationX5, rectangleLocationY5, rectangleWidth5, rectangleHeight5);

  fill((int)random(0, 255), (int)random(0, 255), (int)random(0, 255));
  rect(rectangleLocationX6, rectangleLocationY6, rectangleWidth6, rectangleHeight6);

  fill((int)random(0, 255), (int)random(0, 255), (int)random(0, 255));
  rect(rectangleLocationX7, rectangleLocationY7, rectangleWidth7, rectangleHeight7);

  fill((int)random(0, 255), (int)random(0, 255), (int)random(0, 255));
  rect(rectangleLocationX8, rectangleLocationY8, rectangleWidth8, rectangleHeight8);

  fill((int)random(0, 255), (int)random(0, 255), (int)random(0, 255));
  rect(rectangleLocationX9, rectangleLocationY9, rectangleWidth9, rectangleHeight9);

  fill((int)random(0, 255), (int)random(0, 255), (int)random(0, 255));
  rect(rectangleLocationX10, rectangleLocationY10, rectangleWidth10, rectangleHeight10);
  
   fill((int)random(0, 255), (int)random(0, 255), (int)random(0, 255));
  rect(rectangleLocationX12, rectangleLocationY12, rectangleWidth12, rectangleHeight12);

 fill((int)random(0, 255), (int)random(0, 255), (int)random(0, 255));
  rect(rectangleLocationX13, rectangleLocationY13, rectangleWidth13, rectangleHeight13);

  fill(56, 76, 34);
  rect(rectangleLocationX11, rectangleLocationY11, rectangleWidth11, rectangleHeight11);


  //This is the code for the ball that is bouncing around that is meant to distract the user
  fill((int)random(0, 255), (int)random(0, 255), (int)random(0, 255));
  ellipse (x_ball, y_ball, 80, 80);

  if (x_ball + 50 >width || x_ball - 50<0) { //Flip the x direction the shape is moving in when the shape reaches the border
    xchangedistractor*=-1;
  }

  if (y_ball + 45> height || y_ball - 45<0) { //Flip the y direction the shape is moving when it reaches the border.

    ychangedistractor*=-1;
  }

  x_ball+=xchangedistractor;
  y_ball+=ychangedistractor;
}

