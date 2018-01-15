void stage_3()
{
  all_song_restart();
  stage_0_music.play();

  image(stage_3, 0, 0, width, height);
  if (puzzle_catch_check)
  {
    fill(255);
  } else
  {
    fill(0, 0, 255);
  }
  ellipse( 350, 270, 30, 30);



  monster_encounter();
  hero_overworld();


  wall("horizontal", "down", 540, -20, 276);
  wall("horizontal", "down", 540, 480, 720);

  wall("vertical", "left", 284, 610, 720);
  wall("vertical", "right", 458, 610, 720);

  wall("horizontal", "up", 148, -20, 720);

  door("horizontal", 1, 614, 282, 460, 356, 60);
  
   if (hero.position.x > 318 && hero.position.x < 344 && hero.position.y > 200 && hero.position.y < 218)
   {
     puzzle_catch = true;
   }
}

