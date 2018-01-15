void stage_4()
{
  all_song_restart();
  stage_0_music.play();

  image(stage_4, 0, 0, width, height);
  if (puzzle_math_check)
    {
      fill(255);
    } else
    {
      fill(0, 255, 0);
    }
  ellipse(566, 361, 30, 30);


  monster_encounter();
  hero_overworld();

  wall("horizontal", "down", 393, -20, 103);
  wall("horizontal", "up", 311, -20, 103);
  wall("vertical", "right", 602, -20, 720);
  wall("horizontal", "down", 533, -20, 720);
  wall("horizontal", "up", 157, -20, 720);
  wall("vertical", "left", 120, 419, 720);
  wall("vertical", "left", 120, -20, 130);

  door("vertical", 1, 2, 309, 375, 630, 348);

  if (hero.position.x > 544 && hero.position.x < 560 && hero.position.y > 291 && hero.position.y < 313)
  {
    fill(255);
    puzzle_math_intro = true;
  }
}

