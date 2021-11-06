
if keyboard_check_pressed(vk_escape) 
{game_end();}


//Fullscreen
if keyboard_check_pressed(vk_f5)
{
	if window_get_fullscreen()
	{
		window_set_fullscreen(false);
	}else{
		window_set_fullscreen(true);
	}
}


if keyboard_check_pressed(vk_enter)
{
	instance_create_layer(oPath_Start.x+(CELL_SIZE/2), oPath_Start.y+(CELL_SIZE/2), "Instances", oEnemy); 	
}









