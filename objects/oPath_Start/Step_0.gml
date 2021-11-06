/// @description Insert description here
// You can write your code in this editor


if spawn_wave == true
{
	if !ds_list_empty(wave_list)
	{
		if wavespawn_timer <= 0
		{
			instance_create_layer(x+(CELL_SIZE/2), y+(CELL_SIZE/2), "Instances", oEnemy); 	
			ds_list_delete(wave_list, 0); 
			wavespawn_timer = wavespawn_timer_set; 
		} else {wavespawn_timer --;}
		

	} else {spawn_wave = false; ds_list_destroy(wave_list);}
}





