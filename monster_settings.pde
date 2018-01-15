int enemy_base_hp = 500;

class monster
{
  String monster_name;
  int monster_base_hp;
  int monster_damage;
  PImage monster_image;
}

monster [] monster_list = new monster [5];

void populate_list()
{
  for (int i = 0; i < monster_list.length; i++)
  {
    monster_list[i] = new monster();
  }

  monster_data();
}

void monster_data()
{
  monster_list[0].monster_name = "Hothead";
  monster_list[0].monster_base_hp = 450;
  monster_list[0].monster_damage = 25;

  monster_list[1].monster_name = "Chill Bear";
  monster_list[1].monster_base_hp = 550;
  monster_list[1].monster_damage = 20;

  monster_list[2].monster_name = "Not Pikachu";
  monster_list[2].monster_base_hp = 300;
  monster_list[2].monster_damage = 35;

  monster_list[3].monster_name = "Drake";
  monster_list[3].monster_base_hp = 600;
  monster_list[3].monster_damage = 40;

  monster_list[4].monster_name = "Lord Morshirpour";
  monster_list[4].monster_base_hp = 5000;
  monster_list[4].monster_damage = 80;
}







int encounter_chance, monster_id; 

void monster_encounter()
{
  if (steps % 20 == 0)
  {
    encounter_chance = int(random(0, 10));
    if (encounter_chance > 6)
    {
      monster_id = int(random(0, 4));
      battle = true;
    }
    steps = 1;
  }
}

