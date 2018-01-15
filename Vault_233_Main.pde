//Vault 233; an RPG Adventure by Mark Danez Ricalde and Rutaraj Diwanji

void setup()
{
  size(700, 700);
  import_setup(); //Import setup is a function that contains all the variables we need to put in setup.
}

void draw()
{
  /*game_state is a variable which controls the flow of our game. At the beginning of the game, the player loops through the introduction screen
   through the introduction function. Once they press a key, game_state is turned on, thus starting the game.*/
  if (game_state == false) 
  {
    introduction();
  }

  if (game_state)
  {
    if (battle) //If there is a battle, the player goes through the battle function.
    {
      battle();
    } else if (puzzle_catch) 
    {
      catchball();
    } else if (puzzle_math)
    {
      math_game();
    } else if (puzzle_math_intro)
    {
      introduction_math();
    } else if (puzzle_ball)
    {
      ball_game();
    } else if (stage == 0)
    {
      stage_0();
    } else if (stage == 1)
    {
      stage_1();
    } else if (stage == 2)
    {
      stage_2();
    } else if (stage == 3)
    {
      stage_3();
    } else if (stage == 4)
    {
      stage_4();
    } else if (stage == 5)
    {
      stage_5();
    } 
    else if (stage == 6)
    {
      all_song_restart();
      victory_theme.play();
      victory();
    }else if (stage == -1) //Stage -1 is the game_over screen.
    {
      game_over();
    }
  }
}

