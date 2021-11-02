
if keyboard_check_pressed(vk_escape) 
{game_end();}



if keyboard_check_pressed(vk_enter)
{
	instance_create_layer(oPath_Start.x+(CELL_SIZE/2), oPath_Start.y+(CELL_SIZE/2), "Instances", oEnemy); 	
}




if mouse_check_button_pressed(mb_left)
{
	var _x = floor(mouse_x/CELL_SIZE) * CELL_SIZE; 
	var _y = floor(mouse_y/CELL_SIZE) * CELL_SIZE; 
	
	
	if mp_grid_get_cell(oGame_Control.building_grid, _x / CELL_SIZE, _y / CELL_SIZE) == 0
	{
		var _tower = instance_create_layer(_x, _y, "Instances", oBuilding); 
		
		mp_grid_add_cell(oGame_Control.building_grid, _x / CELL_SIZE, _y / CELL_SIZE); 
		
		
	} else { show_debug_message("Space occupied"); }

}




