void stage_2()
{
  all_song_restart();
  stage_0_music.play();

  image(stage_2, 0, 0, width, height);
  if (puzzle_ball_check)
    {
      fill(255);
    } else
    {
      fill(255, 0, 0);
    }
  ellipse(116, 350, 30, 30);

  monster_encounter();
  hero_overworld();

  door("vertical", 1, 664, 269, 361, 30, 300);

  wall("horizontal", "down", 358, 575, 720);
  wall("horizontal", "up", 272, 575, 720);
  wall("vertical", "left", 88, -20, 720);
  wall("horizontal", "down", 551, -20, 720);
  wall("horizontal", "up", 150, -20, 720);
  wall("vertical", "right", 558, 395, 720);
  wall("vertical", "right", 558, -20, 233);
  
  if (hero.position.x > 88 && hero.position.x < 116 && hero.position.y > 280 && hero.position.y < 305)
  {
    puzzle_ball = true;
  }
}

