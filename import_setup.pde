//Global Variable Initilization
int wait = 0;
boolean game_state = false;
boolean battle = false;
int stage = 0;
int x = 25;
int y = 440;
int hero_hp = 500;
boolean item_mode = false;
int item_x = 80;
int bombs = 3;
int teslas = 3;
int freezes = 3;
int potions = 2;
int monster_move_pick;
boolean fire_buff;
boolean elec_buff;
boolean ice_buff;
int mo_sound;
int victory_timer;

Gif  slash, drake, electric_mouse, Hothead, ChillBear, lord, credits;      
PImage background, back_sprite, stage_0, stage_1, stage_2, stage_3, stage_4,  stage_1portal, game_over_screen, mo, galaxy, shadowlord, finalbackground, items;

void import_setup()
{
  //Screen size

  minim = new Minim(this);
  intro_music = minim.loadFile("intro_music.mp3", 2048);
  stage_0_music = minim.loadFile("stage_0_music.mp3", 2048);
  BattleTheme = minim.loadFile("BattleTheme.mp3", 2048);
  cursor_move = minim.loadFile("CursorMove.mp3", 2048);
  slash_sound = minim.loadFile("slash_sound.mp3", 2048);
  game_over_music = minim.loadFile("game_over_music.mp3", 2048);
  hotline_bling = minim.loadFile("hotline_bling.mp3", 2048);
  final_music = minim.loadFile("finalmusic.mp3", 2048);
  final_battle_music = minim.loadFile("finalbattlemusic.mp3", 2048);
  mo_hello = minim.loadFile("mo_hello.mp3", 2048);
  mo_garbage1 = minim.loadFile("mo_garbage1.mp3", 2048);
  mo_garbage2 = minim.loadFile("mo_garbage2.mp3", 2048);
  mo_memory = minim.loadFile("mo_memory.mp3", 2048);
  mo_so_basic = minim.loadFile("mo_so_basic.mp3", 2048);
  puzzle_finished = minim.loadFile("puzzle_finished.wav", 2048);
  victory_theme = minim.loadFile("victorytheme.mp3", 2048);

  intro_screen = new Gif(this, "intro_screen.gif");
  slash = new Gif(this, "Slash.gif");
  drake = new Gif(this, "drake.gif");
  electric_mouse = new Gif(this, "electric_mouse.gif");
  Hothead = new Gif(this, "Hothead.gif");
  ChillBear = new Gif(this, "ChillBear.gif");
  lord = new Gif(this, "Lord.gif");
  credits = new Gif(this, "credits.gif");

  background = loadImage("background.jpg");
  stage_0 = loadImage("stage_0.jpg");
  stage_1 = loadImage("stage_1.jpg");
  stage_2 = loadImage("stage_2.jpg");
  stage_3 = loadImage("stage_3.jpg");
  stage_4 = loadImage("stage_4.jpg");
  stage_1portal = loadImage("stage_1portal.jpg");
  back_sprite = loadImage("BackSprite.png");
  game_over_screen = loadImage("game_over_screen.png");
  mo = loadImage("Mo.png");
  shadowlord = loadImage("shadowlord.png");
  galaxy = loadImage("galaxy.jpg");
  items = loadImage("items.png");
  finalbackground = loadImage("finalbackground.jpg");
  items = loadImage("items.png");

  intro_screen.play();
  slash.play();
  drake.play();
  hero_setup();
  electric_mouse.play();
  Hothead.play();
  ChillBear.play();
  lord.play();
  credits.play();

  populate_list();

  //Math
  placement = int(random(4));
}

//Music & Sound Import

import ddf.minim.*;
Minim minim;

AudioPlayer intro_music;
AudioPlayer stage_0_music;
AudioPlayer BattleTheme;
AudioPlayer cursor_move;
AudioPlayer slash_sound;
AudioPlayer game_over_music;
AudioPlayer hotline_bling;
AudioPlayer final_music;
AudioPlayer final_battle_music;
AudioPlayer mo_hello;
AudioPlayer mo_garbage1;
AudioPlayer mo_garbage2;
AudioPlayer mo_so_basic;
AudioPlayer mo_memory;
AudioPlayer puzzle_finished;
AudioPlayer victory_theme;

//Image Setup
import gifAnimation.*;
Gif intro_screen;

