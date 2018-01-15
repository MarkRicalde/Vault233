void game_over() //Game Over Screen
{
  image(game_over_screen, 0, 0, width, height);
  all_song_restart();
   game_over_music.play();
  
}
