void victory()
{
  image(credits, 0, 0, width, height);
  if (millis() > victory_timer + 110000)
  {
    exit();
  }
}
