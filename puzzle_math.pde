//This is a math game that will ask the user simple multiplication questions. The goal fo the game is to get five answers right in a row
// The format of the game is a multiple choice test. Four options will appear on screen with only one being the answer
//If the user gets five answers correct in a row they win the game
//If the user gets a question wrong before they get the five questions in a row right than then they must restart and try to get five in a row again.

//variables

boolean puzzle_math = false;
boolean puzzle_math_intro = false;
boolean puzzle_math_check = false;
int count = 0;  //variable that will be used to end the game
int placement;  //determines which one is the correct answer
int x1 =(int)random(2, 5);
int y1 =(int)random(6, 15);
int z1 = (int)random(2, 7);
int z2 = (int)random(2, 7);
int z3 = (int)random(2, 7);
int pressed = 0;
int right1 = x1 * y1;
int wrong1 = x1 * z1;
int wrong2 = x1 * z2;
int wrong3 = x1 * z3;

void introduction_math()
{

  background(30, 50, 70);
  textSize(24);
  text("Welcome to the Quick as Lightning Challenge", 10, 25); //This section will print out information to the user regarding the game
  text("In this challenge, your Math skills will be tested!", 10, 65);
  text("Are you ready to begin? Press any key to start", 10, 105);
  
  textSize(16);
  text("You must get five answers correct or you will have to restart!", 10, 150);
  text("Victory will buff your Tesla Coil", 10, 200);
}

void math_game()//function that provides information to the user and sets out the format for the multiple choice
{
  background(30, 50, 70);
  text("What is " + x1 + " multiplied by " + y1, 10, 100);//prints the question
  text("a)", 10, 200); 
  text("b)", 10, 240);
  text("c)", 10, 280);
  text("d)", 10, 320);


  text("How many questions you have correct in a row: " + count, 10, 350);//prints out how many questions you have correct in a row

  text_pick();

  if (count == 5)
  {
    puzzle_math = false;
    puzzle_math_intro = false;
    puzzle_math_check = true;
    stage = 4;
    elec_buff = true;
    hero.position.x = 530;
    hero.position.y = 300;
    puzzle_finished.play();
    puzzle_finished.rewind();

    count = 0;
  }
}


void text_pick()
{
  if (placement == 0) //if plaement is 0 the answer is a so print the answer to a
  {  
    text(right1, 50, 200);  
    text(wrong1, 50, 240);
    text(wrong2, 50, 280);
    text(wrong3, 50, 320);
  }
  if (placement == 1) //if plaement is 1 the answer is b so print the answer to b
  {
    text(wrong3, 50, 200);
    text(right1, 50, 240);
    text(wrong1, 50, 280);
    text(wrong2, 50, 320);
  }
  if (placement == 2)  //if plaement is 2 the answer is c so print the answer to c
  {
    text(wrong2, 50, 200);
    text(wrong3, 50, 240);
    text(right1, 50, 280);
    text(wrong1, 50, 320);
  }
  if (placement == 3) //if plaement is 3 the answer is d so print the answer to d
  {
    text(wrong1, 50, 200);
    text(wrong2, 50, 240);
    text(wrong3, 50, 280);
    text(right1, 50, 320);
  }
}

void randomizer()//This functon creates random numbers for the multiplication
{
  placement = int(random(4));// creates a random int for placement between 0 -3. The answer to the question is related to what placement is
  x1 =(int)random(2, 5);  //these initialize random variables that are used for the multiplication
  y1 =(int)random(6, 15);
  z1 =(int)random(2, 7);
  z2 =(int)random(2, 7);
  z3 =(int)random(2, 7);

  right1 = x1 * y1;  //the correct answer is x1 multiplied by y1. right1 is the variable for the correct answer.
  wrong1 = x1 * z1;  //the other three variables are random numbers that are not the right answer
  wrong2 = x1 * z2;
  wrong3 = x1 * z3;

 if (right1 == wrong1 || right1 == wrong2 || right1 == wrong3 || wrong1 == wrong2 || wrong1 == wrong3 || wrong2 == wrong3)  //this if statement will determine whether one or more of the answers in the multiple choice are duplicates
  {
    while (right == wrong1 || right == wrong2 || right == wrong3 || wrong1 == wrong2 || wrong1 == wrong3 || wrong2 == wrong3)  //if they are duplicates they they will be changed
    {
      z1 = int(random(2, 7));  //these will create random integers for the duplicates
      z2 = int(random(2, 7));
      z3 = int(random(2, 7));
      wrong1 = x1 * z1; //changes the values of the other answers
      wrong3 = x1 * z3;
    }
  }
}

