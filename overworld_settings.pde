class PCC
{
  PImage sprite;
  PVector position;
  int frameRow;
  int frameColumn;
  float frameTimer;
  PVector velocity;
  float speed;
}

PCC hero;
float left = 0;
float right = 0;
float down = 0;
float up = 0;
int steps = 1;

void hero_setup()
{
  hero = new PCC();
  hero.sprite = loadImage("hero_spritesheet.png");
  hero.position = new PVector(350, 600);
  hero.velocity = new PVector(0, 0);
  hero.frameRow = 2; // which row from source image to use
  hero.frameColumn = 0; // which column from source image to use
  hero.frameTimer = 0; // determines which column to use to animate.
  hero.speed = 2; // walk speed

}

PImage getSubImage(PImage image, int row, int column, int frameWidth, int frameHeight)
{
  return image.get(column * frameWidth, row * frameHeight, frameWidth, frameHeight); 
}

void hero_overworld()
{
  
  hero.velocity.x = hero.speed * (left + right);
  hero.velocity.y = hero.speed * (up + down);
  hero.position.add(hero.velocity);
  
  hero.frameTimer += 0.1; // 0.1 is the framerate or speed of animation.
  if (hero.frameTimer >= 6) // reset at 6 because there's only 0-5 columns in the spritesheet
  {
    hero.frameTimer = 1; // column 1 is the first frame of the walk animation
  }
  hero.frameColumn = (int)hero.frameTimer; // cast the timer to an int so it's an integer between 1 and 5
  
  if (hero.velocity.x == 0 && hero.velocity.y == 0)
  {
    hero.frameColumn = 0; //column 0 is the stopped frame of animation
  }
  
  if (left != 0)
  {
    hero.frameRow = 1; // column 1 is the left facing animation
  }
  if (right != 0)
  {
    hero.frameRow = 3; // column 3 is the right facing animation
  }
  if (up != 0)
  {
    hero.frameRow = 2; // etc.
  }
  if (down != 0)
  {
    hero.frameRow = 0; // etc.
  }


  translate(hero.position.x, hero.position.y);
 
  
  // Here we are creating a new image using the getSubImage function defined below.
  // we pass in the hero.image and get a sub image of the sprite sheet based on 
  // the size of a frame (32x64 here) and the row and column we want.
  PImage frameImage = getSubImage(hero.sprite, hero.frameRow, hero.frameColumn, 32, 64);
  
  // Draw this image instead of hero.image
  image(frameImage, 0, 0);
  
  println(hero.position.x, hero.position.y);
}
