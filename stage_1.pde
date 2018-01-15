void stage_1()
{  
  all_song_restart();
  stage_0_music.play();

  if (puzzle_ball_check && puzzle_math_check && puzzle_catch_check)
  {
    image(stage_1portal, 0, 0, width, height);
  } else
  {
    image(stage_1, 0, 0, width, height);
  }

  if (puzzle_ball_check)
  {
    fill(255, 0, 0);
    ellipse(307, 439, 50, 50);
  }

  if (puzzle_catch_check)
  {
    fill(0, 0, 255);
    ellipse(361, 334, 50, 50);
  }

  if (puzzle_math_check)
  {
    fill(0, 255, 0);
    ellipse(419, 443, 50, 50);
  }

  monster_encounter();

  hero_overworld();

  wall("vertical", "left", 322, 564, 700);
  wall("vertical", "left", 120, 389, 563);
  wall("vertical", "right", 434, 561, 700);
  wall("horizontal", "down", 562, 112, 322);
  wall("horizontal", "down", 373, -5, 82);
  wall("horizontal", "up", 264, -5, 82);
  wall("vertical", "left", 112, 154, 248);
  wall("horizontal", "up", 158, 122, 252);
  wall("vertical", "left", 276, -20, 142);
  wall("vertical", "right", 396, -20, 142);
  wall("horizontal", "up", 174, 422, 568);
  wall("vertical", "right", 566, 130, 258);
  wall("horizontal", "up", 282, 586, 720);
  wall("horizontal", "down", 360, 582, 720);
  wall("horizontal", "down", 548, 440, 720);
  wall("vertical", "right", 554, 400, 720);

  door("vertical", 2, 0, 262, 375, 648, 320);
  door("horizontal", 3, 48, 274, 396, 374, 580); 
  door("vertical", 4, 644, 280, 362, 72, 360);
  door("horizontal", 0, 620, 320, 436, 316, 232);

  if (puzzle_ball_check && puzzle_math_check && puzzle_catch_check)
  {
    door("vertical", 5, 466, 234, 458, 334, 614);
    door("horizontal", 5, 458, 236, 454, 334, 614); 
    door("vertical", 5, 218, 234, 458, 334, 614);
    door("horizontal", 5, 234, 236, 454, 334, 614);
  }
}

