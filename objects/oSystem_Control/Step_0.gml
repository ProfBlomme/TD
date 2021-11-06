
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












