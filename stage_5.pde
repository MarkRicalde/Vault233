void stage_5()
{
  all_song_restart();

  image(galaxy, 0, 0, width, height);
  image(shadowlord, 270, 200, 200, 200);
  
  fill(155);
  rect(300, 700, 100, -250);
  
  hero_overworld();
  
  if (hero.position.y < 420)
  {
    monster_id = 4;
    battle = true;
    mo_hello.play();
  }
  

}
