
if keyboard_check_pressed(vk_escape) 
{game_end();}



if keyboard_check_pressed(vk_enter)
{
	instance_create_layer(oPath_Start.x+(CELL_SIZE/2), oPath_Start.y+(CELL_SIZE/2), "Instances", oEnemy); 	
}









