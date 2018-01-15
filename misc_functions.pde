void all_song_restart()
{

  intro_music.pause();
  stage_0_music.pause();
  BattleTheme.pause();
  game_over_music.pause();
  hotline_bling.pause();
  final_music.pause();
  final_battle_music.pause();
}

void mo_sounds(int a)
{
  if (a == 0)
  {
    mo_garbage1.play();
    mo_garbage1.rewind();
  }

  if (a == 1)
  {
    mo_garbage2.play();
    mo_garbage2.rewind();
  }

  if (a == 2)
  {
    mo_so_basic.play();
    mo_so_basic.rewind();
  }

  if (a == 3)
  {
    mo_memory.play();
    mo_memory.rewind();
  }
}

void wall(String vh, String dir, int x, int y1, int y2)
{
  if (vh == "horizontal")
  {
    if (dir == "down") //Prevents them from walking down
    {
      if (hero.position.y > x && hero.position.x < y2 && hero.position.x > y1) 
      {
        hero.position.y = x;
      }
    }

    if (dir == "up")
    {
      if (hero.position.y < x && hero.position.x < y2 && hero.position.x > y1)
      {
        hero.position.y = x;
      }
    }
  }


  if ( vh == "vertical")
  {

    if (dir == "right") //Prevents them from walking right
    {
      if (hero.position.x > x && hero.position.y < y2 && hero.position.y > y1) 
      {
        hero.position.x = x;
      }
    }

    if (dir == "left") //Prevents them from walking left
    {
      if (hero.position.x < x && hero.position.y < y2 && hero.position.y > y1) 
      {
        hero.position.x = x;
      }
    }
  }
}

void door(String vh, int where2, int door, int a1, int a2, int newx, int newy) 
{
  if (vh == "vertical")
  {
    if (hero.position.x == door && hero.position.y < a2 && hero.position.y > a1)
    {
      stage = where2;
      hero.position.x = newx;
      hero.position.y = newy;
    }
  }
  
  if (vh == "horizontal")
  {
    if (hero.position.y == door && hero.position.x < a2 && hero.position.x > a1)
    {
      stage = where2;
      hero.position.x = newx;
      hero.position.y = newy;
    }
  }
}
    


