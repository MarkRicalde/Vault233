void stage_0()
{
  all_song_restart();
  stage_0_music.play();
  image(stage_0, 0, 0, width, height);
  
  
  
  hero_overworld();
  
  wall("vertical", "left", 222, 238, 700);
  wall("vertical", "right", 448, 238, 700);
  wall("horizontal", "up", 222, 374, 448);
  door("horizontal", 1, 212, 266, 362, 370, 610);
}


