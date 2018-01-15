int enemy_hp; //The enemy's HP, different from base HP (explained below)
int damage_sum = 0; //Damage the player has done to the specific monster he's fighting. Obviously 0 at the beginning.
int damage_took = 0; //Damage the player has took, 0 at the beginning.

/*Since this a turn based RPG game, we needed to implement a turn variable to determine who is at that point comitting an action. Without this variable,
 the player would just continiously take damage from the enemy since it would have free-reign of action*/
boolean hero_turn = true; 

boolean crying = false; //Used to determine whether the player has commited the cry action during combat (explained below)

void battle()
{

  if (damage_sum >= enemy_base_hp) //If the damage the player has done is greater than or equal to the enemy's health (aka player victory)...
  {
    battle = false; //the battle is over
    damage_sum = 0; //the damage sum is reset so the enemies the player encounters in the future will once again have zero damage done to them
    crying = false; //the player stops crying due to his victory
    hero_turn = true; //the next battle won't start with him taking damage (the player always starts first during battles)
    if (monster_id == 4)
    {
      credits.jump(0);
      stage = 6;
      victory_timer = millis();
    }
  } else if (hero_hp <= 0) //If the player loses (due to his HP reaching zero)...
  {
    battle = false; //the battle has ended
    stage = -1; //the player gets taken to the game_over screen
  } else if (hero_hp > 0) //This condition essentially means the battle continues
  {
    battle_setup(); //Sets up all the battle UI

    if (hero_turn) //The player's turn
    {
      if (item_mode)
      {
        image(items, 0, 0, width, height);

        fill(255, 0, 0);
        ellipse(item_x, 450, 30, 30);

        if (item_x == 80)
        {
          fill(0);
          text("Fire Bombs x" + bombs, 50, 600);
          text("Deals fire damage", 50, 650);
        }

        if (item_x == 230)
        {
          fill(0);
          text("Tesla Coils x" + teslas, 50, 600);
          text("Deals electric damage", 50, 650);
        }

        if (item_x == 380)
        {
          fill(0);
          text("Freeze Ray x" + freezes, 50, 600);
          text("Deals ice damage", 50, 650);
        }

        if (item_x == 530)
        {
          fill(0);
          text("Potion x" + potions, 50, 600);
          text("Heals all damage", 50, 650);
        }
      }
    } else //If it isn't the player's turn, it is the enemy's. Who will attack before being the player's turn again.
    {
      enemy_action();
      if (monster_id == 4)
      {
        mo_sound = int(random(4));
        mo_sounds(mo_sound);
      }
      hero_turn = true;
    }
  }
}

void battle_setup()
{
  all_song_restart(); //Stops all music

  if (monster_id == 3)
  {
    hotline_bling.play(); //If the monster is Drake, plays Hotline Bling. If not, plays the normal battlle theme.
  } else if (monster_id == 4)
  {
    final_battle_music.play();
  } else
  {
    BattleTheme.play();
  }
  if (monster_id == 4)
  {
    image(finalbackground, 0, 0, width, height); //The battle background aka the Cave
  } else
  {
    image(background, 0, 0, width, height); //The battle background aka the Cave
  }



  enemy_battle_setup();
  hero_battle_setup();

  //Red Cursor
  fill(255, 0, 0);
  ellipse(x, y, 15, 15); 


  //Displays all the choice-text
  String attack = "ATTACK";
  String items = "ITEMS";
  String escape = "ESCAPE";
  String cry = "CRY";

  fill(255);
  textSize(32);
  text(attack, 50, 450); 
  text(items, 50, 550);
  text(escape, 550, 450);
  text(cry, 550, 550);

  if (crying)
  {
    if (monster_id == 3) //If the enemy is Drake, crying is effective.
    {
      text("Drake understands your pain", 10, 680);
    } else //If the enemt is not Drake, the monsters are much less forgiving
    {
      text("The monster laughs as it hits you", 10, 680);
    }
  }
}

void enemy_battle_setup()
{
  monster_sprites(); //Sets the monster sprites

  /*Sets their current health to their base health. The difference between base hp and enemy hp is that enemy hp will change as the battle ensues but base hp
   is the hp that the monster at the beginning will always have.*/

  enemy_base_hp = monster_list[monster_id].monster_base_hp; 
  int enemy_hp = enemy_base_hp - damage_sum;

  /*The way health bar works is clever. While enemies can have different HP's than 500, for visual sakes, the bar will have 500 always and decrease by a fractional amount to
   500. For example, if an enemy has 600 health and takes 300 damage, the bar will lose 1/2 of its length. This is better than a system where a bar length is dependant on 
   the enemy HP due to the fact that at large healths, the bar becomes much too long and inconsistet to use properly*/

  fill(0, 255, 0);
  rect(80, 50, 500, 30); 

  fill(255, 0, 0);
  rect(580, 50, -(500 * damage_sum * 1/monster_list[monster_id].monster_base_hp), 30);

  fill(255);
  textSize(24);
  text(monster_list[monster_id].monster_name + "                     HP:" + enemy_hp, 90, 75); //Enemy name-tag
}

void monster_sprites() //Sets the monster sprites
{
  if (monster_id == 0)
  {
    image(Hothead, 230, 150, 250, 250);
  }

  if (monster_id == 1)
  {
    image(ChillBear, 230, 150, 250, 250);
  }

  if (monster_id == 2)
  {
    image(electric_mouse, 230, 150, 250, 250);
  }

  if (monster_id == 3)
  {
    image(drake, 230, 150, 250, 250);
  }

  if (monster_id == 4)
  {
    image(lord, 80, 50, 675, 675);
    image(mo, 255, 80, 170, 170);
  }
}

void hero_battle_setup()
{
  hero_hp = 500 - damage_took;

  image(back_sprite, 240, 400); //The hero's back sprite

  fill(0, 255, 0);
  rect(80, 600, hero_hp, 30);

  fill(255, 0, 0);
  rect(580, 600, hero_hp - 500, 30);





  fill(255);
  textSize(24);
  text("Hero                                        HP:", 100, 625);
  text(hero_hp, 500, 625);
}

int damage_calculation(String command)
{
  int damage;

  if (command == "ATTACK")
  {
    damage = 50 + int(random(21));
  } else if (command == "CRY" && monster_id == 3)
  {
    damage = 100;
  } else if (command == "FIRE")
  {
    if (fire_buff)
    {
      damage = 1500;
    } else if (monster_id == 1)
    {
      damage = 150 + int(random(21));
    } else if (monster_id == 2)
    {
      damage = int(random(21));
    } else 
    {
      damage = 50 + int(random(21));
    }
  } else if (command == "ELEC")
  {
    if (elec_buff)
    {
      damage = 1500;
    } else if (monster_id == 0)
    {
      damage = 150 + int(random(21));
    } else if (monster_id == 1)
    {
      damage = int(random(21));
    } else
    {
      damage = 50 + int(random(21));
    }
  } else if (command == "ICE")
  {
    if (ice_buff)
    {
      damage = 1500;
    } else if (monster_id == 2)
    {
      damage = 150 + int(random(21));
    } else if (monster_id == 0)
    {
      damage = int(random(21));
    } else
    {
      damage = 50 + int(random(21));
    }
  } else 
  {
    println("WTF");
    damage = 0;
  }
  return damage;
}





void enemy_action()
{
  monster_move_pick = int(random(101));
  if (monster_move_pick > 30)
  {
    damage_took +=  monster_list[monster_id].monster_damage + int(random(0, 20));
  } else
  {
    text("MISSED", 300, 500);
  }
}

void item_mode()
{
  background(155);
  ellipse(item_x, 500, 30, 30);
}

