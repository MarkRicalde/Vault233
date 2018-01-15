//This program draws a ball that bounces up and down the screen. 
// The user has to control a rectangular object at the bottom of the screen and try to catch the ball
//If the user makes contact with the ball than their score,called collide, will go up
//If they miss, their score for miss will go up
//If they miss 5 times, they must restart
//If they catch the ball 10 times before missing 5 times they win!!!


//Variables
float ballX = 200;  //Initializes the x coordinate of the ball
float ballY = 100;  //Initializes the y coordinate of the ball
float speedX = 10;  //Initializes the variable which will control the horizontal speed of the ba
float speedY = 0;   //Initializes the variable which will control the vertical movement of the ball
int collide = 0;    //Initializes the variable which will count how many times the user has made contact with the ball
int miss = 0;       //Initializes the variable which will count how many times the user has missed the ball
boolean puzzle_catch = false; //boolean used to determine when to end the game
boolean puzzle_catch_check = false;

void catchball() {

  if (mousePressed) {
    collide = 0; 
    miss = 0;
  }

  float paddle = 1000/ (collide+10);//changes the size of the rectangle everytime the user makes contact
  if (ballX < 0 || ballX > width) speedX = -speedX;
  if (ballY > height) {
    speedY = -speedY;
    float distance = abs(mouseX - ballX);
    if (distance < paddle) collide += 1;  //adds score if ball makes contact
    else miss += 1;  //add points to how many you have missed
  } else speedY += 1;  //changes the vertical direction again once
  ballX += speedX;     //adds to the current x locatoin of the ball
  ballY += speedY;     //adds to the current y location of the ball
  
  background(40, 39, 90); //sets the colour of the background
  fill(0, 70, 0);         //sets the colour of the ball
  ellipse(ballX, ballY, 50, 50);
  fill(255);
  rect(mouseX-paddle, height-10, 2*paddle, 30);
  fill (255);
  textSize(18);
  text ("collide: " + collide, 10, 20);  //prints out the score for collide
  text ("miss: " + miss, 10, 40);        //prints out how many times you have missed


  if (miss == 5) {  //if the user misses 5 times they must restart!!

    collide = 0;
    miss = 0;
  }


  if (collide == 10) //if they make contact 10 times with the ball they win!!
  {
    puzzle_catch = false;

    puzzle_catch_check = true;
    stage = 3;
    ice_buff = true;
    hero.position.x = 334;
    hero.position.y = 254;
    puzzle_finished.play();
    puzzle_finished.rewind();
  }
}

