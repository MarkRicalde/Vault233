void keyPressed()
{
  if (game_state == false)
  {
    if (keyPressed)
    {
      game_state = true;
    }
  } else if (game_state)
  {
    if (battle)
    {
      if (key == 'x' && x == 25 && y == 440)
      {
        damage_sum += damage_calculation("ATTACK");
        image(slash, 200, 200);

        fill(255, 0, 0);

        text("-" + damage_calculation("ATTACK"), 500, 200);

        slash_sound.play();
        slash_sound.rewind();
        hero_turn = false;
      }

      if (key == 'x' && x == 525 && y == 440)
      {
        battle = false;
        damage_sum = 0;
      }

      if (key == 'x' && x == 25 && y == 540)
      {
        item_mode = true;
      }

      if (key == 'x' && x == 525 && y == 540)
      {
        damage_sum += damage_calculation("CRY");
        crying = true;
        hero_turn = false;
      }

      if (item_mode)
      {
        if (item_x == 80 && key == 'z' && bombs > 0)
        {
          damage_sum += damage_calculation("FIRE");
          item_mode = false;
          hero_turn = false;
          bombs--;
        }

        if (item_x == 230 && key == 'z' && teslas > 0)
        {
          damage_sum += damage_calculation("ELEC");
          item_mode = false;
          hero_turn = false;
          teslas--;
        }

        if (item_x == 380 && key == 'z' && freezes > 0)
        {
          damage_sum += damage_calculation("ICE");
          item_mode = false;
          hero_turn = false;
          freezes--;
        }

        if (item_x == 530 && key == 'z' && potions > 0)
        {
          damage_took = 0;
          item_mode = false;
          potions--;
        }

        if (item_x == 680 && key == 'z')
        {
          item_mode = false;
        }

        if (key == CODED)
        {

          if (keyCode == RIGHT)
          {
            cursor_move.play();
            if (item_x < 680)
            {
              item_x += 150;
            } else 
            {
              item_x = 80;
            }

            cursor_move.rewind();
          }

          if (keyCode == LEFT)
          {
            cursor_move.play();
            if (item_x > 80)
            {
              item_x -= 150;
            } else
            {
              item_x = 680;
            }
            cursor_move.rewind();
          }
        }
      } else {

        if (key == CODED)
        {

          if (keyCode == RIGHT)
          {
            cursor_move.play();
            if (x == 25)
            {
              x = 525;
            } else
            {
              x = 25;
            }
            cursor_move.rewind();
          }

          if (keyCode == LEFT)
          {
            cursor_move.play();
            if (x == 25)
            {
              x = 525;
            } else
            {
              x = 25;
            }
            cursor_move.rewind();
          }

          if (keyCode == DOWN)
          {
            cursor_move.play();
            if (y == 440)
            {
              y = 540;
            } else
            {
              y = 440;
            }
            cursor_move.rewind();
          }

          if (keyCode == UP)
          {
            cursor_move.play();
            if (y == 440)
            {
              y = 540;
            } else
            {
              y = 440;
            }
            cursor_move.rewind();
          }
        }
      }
    }
    if (battle == false)
    {
      if (puzzle_math)
      {
        if (placement == 0) 
        {  //so if placement is zero, the correct answer is a

          if (key == 'a') 
          {
            text("Good job! That is correct", 10, 400);
            count++;
          } else 
          {
            text("That is incorrect! Try again!!", 10, 400);
            count = 0;
          }
        }

        if (placement ==1) {

          if (key == 'b') {
            text("Good job! That is correct", 10, 400);
            count++;

            //the program will rerun after the user has entered either correctly or incorrectly
          } else {
            text("That is incorrect! Try again!!", 10, 400);
            count = 0;
          }
        }

        if (placement == 2) {

          if (key == 'c') {
            text("Good job! That is correct", 10, 400);
            count++;
          } else {
            text("That is incorrect! Try again!!", 10, 400);
            count = 0;
          }
        }

        if (placement == 3) {
          if (key == 'd') {
            text("Good job! That is correct", 10, 400);
            count++;
          } else {
            text("That is incorrect! Try again!!", 10, 400);
            count = 0;
          }
        }
        randomizer();
      } else if (puzzle_math_intro)
      {
        if (keyPressed = true)
        {
          puzzle_math = true;
          puzzle_math_intro = false;
        }
      }

      if (key == DELETE)
      {
        game_state = false;
      }

      if (keyCode == RIGHT)
      {
        right = 1;
        steps++;
      }
      if (keyCode == LEFT)
      {
        left = -1;
      }
      if (keyCode == UP)
      {
        up = -1;
        steps++;
      }
      if (keyCode == DOWN) 
      {
        down = 1;
        steps++;
      }

      if (keyPressed == true && stage == -1)
      {
        game_state = false;
        damage_sum = 0;
        hero_hp = 500;
        damage_took = 0;
        hero.position = new PVector(350, 600);
        stage = 0;
        all_song_restart();
        puzzle_ball_check = false;
        puzzle_math_check = false;
        puzzle_catch_check = false;
        bombs = 2;
        teslas = 2;
        freezes = 2;
        potions = 2;
      }
    }
  }
}


void keyReleased()
{
  if (keyCode == RIGHT)
  {
    right = 0;
  }
  if (keyCode == LEFT)
  {
    left = 0;
  }
  if (keyCode == UP)
  {
    up = 0;
  }
  if (keyCode == DOWN)  
  {
    down = 0;
  }
} 

