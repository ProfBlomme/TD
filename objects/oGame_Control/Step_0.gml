/// @description Insert description here
// You can write your code in this editor



//IF Idle ? 
if object_placing = noone
{
	if mouse_check_button_pressed(mb_left) 
	{
		var _card = instance_position(mouse_x, mouse_y, oCard)
	
		if _card != noone 
		{
			var _x = floor(mouse_x/CELL_SIZE) * CELL_SIZE; 
			var _y = floor(mouse_y/CELL_SIZE) * CELL_SIZE; 
		
			object_placing = instance_create_layer(_x, _y, "Instances", _card.building_id); 	

		}
	

	
	}
}
	
else if object_placing != noone 
{
				var _x = floor(mouse_x/CELL_SIZE) * CELL_SIZE; 
			var _y = floor(mouse_y/CELL_SIZE) * CELL_SIZE; 
	
	object_placing.x = floor(mouse_x/CELL_SIZE) * CELL_SIZE;
	object_placing.y = floor(mouse_y/CELL_SIZE) * CELL_SIZE;
	
	
	if mouse_check_button_pressed(mb_right)
	{
		instance_destroy(object_placing);
		object_placing = noone; 
	} else if mouse_check_button_pressed(mb_left) 
	{
		if mp_grid_get_cell(oGame_Control.building_grid, _x / CELL_SIZE, _y / CELL_SIZE) == 0
		{
			if gold >= object_placing.cost 
			{
				gold -= object_placing.cost; 
				object_placing.active = true; 
				object_placing = noone; 
			
				mp_grid_add_cell(oGame_Control.building_grid, _x / CELL_SIZE, _y / CELL_SIZE); 
			} else { show_debug_message("Not enough gold"); }
			
		} else { show_debug_message("Space occupied"); }
		
	}
	
}	





//Spawn wave of enemies
if keyboard_check_pressed(vk_enter)
{
	wave_execute(); 
}



