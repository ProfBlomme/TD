
if keyboard_check_pressed(vk_escape)
{
	game_end(); 	
}

if card_playing == noone
{
	//Check for mouse hover
	if position_meeting(mouse_x, mouse_y, oCard) == true
	{
		card_hovering = instance_position(mouse_x, mouse_y, oCard);
	} else {
		if card_hovering != noone 
		{
			card_hovering = noone;
		}
	}
	
	//Click the end turn button 
	if position_meeting(mouse_x, mouse_y, oButton) == true 
	{
		if mouse_check_button_pressed(mb_left) 
		{
			phase = phasetype.invasion; 	
		}
	}
	
	
	

	//Play the hovered card 
	if (card_hovering != noone)
	{
		if mouse_check_button_pressed(mb_left)
		{
			card_playing = card_hovering; 
			card_hovering = noone; 
			
			card_playing.y -= 50; 
			object_placing = instance_create_layer(mouse_x, mouse_y, "Instances", oTile); 
			
			object_placing.connect_right = card_playing.connect_right; 
			object_placing.connect_left = card_playing.connect_left; 
			object_placing.connect_up = card_playing.connect_up; 
			object_placing.connect_down = card_playing.connect_down; 
			
			object_placing.sprite_index = card_playing.sprite_index; 
			object_placing.being_placed = true; 	
		}
	} 
	
	
	//Card is being played 
} else {
	
	//Cancel the card being played
	if mouse_check_button_pressed(mb_right)
	{
		card_playing.y += 50; 
		card_playing = noone; 
		instance_destroy(object_placing);
		object_placing = noone; 
		
	//Place the object (Card being played) 
	} else if mouse_check_button_pressed(mb_left) 
	{
		//Check the cell_grid for blocking
		if ds_grid_get(cell_grid, floor(mouse_x/CELL_SIZE), floor(mouse_y/CELL_SIZE)) == 0
		{
			
			//Check adjacent tiles
			if check_tile_placement() 
			{
				//Place the tile 
				var _x = floor(mouse_x/CELL_SIZE);
				var _y = floor(mouse_y/CELL_SIZE);
				ds_grid_add(cell_grid, _x, _y, object_placing);
				mp_grid_clear_cell(path_grid, _x, _y);
				
				//Check for connection to the path end 
				check_path = path_add();
				if mp_grid_path(path_grid, check_path, oPath_end.x+(CELL_SIZE/2), oPath_end.y+(CELL_SIZE/2), _x*CELL_SIZE+(CELL_SIZE/2), _y*CELL_SIZE+(CELL_SIZE/2), false) 
				{

					
					mp_grid_path(path_grid, ai_path, oPath_end.x+(CELL_SIZE/2), oPath_end.y+(CELL_SIZE/2), _x*CELL_SIZE+(CELL_SIZE/2), _y*CELL_SIZE+(CELL_SIZE/2), false) 
					show_debug_message("Connected"); 	
					oPath_start.x = _x*CELL_SIZE; 
					oPath_start.y = _y*CELL_SIZE; 
					
				} else { show_debug_message("Not connected"); }
				
				for(i=1; i<=5; i++)
				{
					if hand[i] == card_playing
					{
						hand[i] = noone; 
						break; 
					}
				}
			
				object_placing.being_placed = false; 
				instance_destroy(card_playing);
			
				card_playing = noone; 
				object_placing = noone;
			} else {
				show_debug_message("Adjacent cell blocking"); 
			}
			
			
		} else {
			show_debug_message("Cell blocked"); 
		}
		
			
	}	
}



//Spawn invaders
if (phase == phasetype.invasion) 
{
	card_draw();
	
	
	if enemies_spawned < wave_count
	{
		if spawn_timer <= 0
		{
			var _enemy = instance_create_layer(oPath_end.x+(CELL_SIZE/2), oPath_end.y+(CELL_SIZE/2), "Enemies", oEnemy);
			enemies_spawned ++; 
			spawn_timer = room_speed * 0.5; 
		} else { spawn_timer --;}
	} else {
		enemies_spawned = 0; 
		spawn_timer = room_speed * 0.5; 
		
		//Return to build phase
		phase = phasetype.build; 
	}
}





/*
if mouse_check_button_pressed(mb_right)
{
	var _dead_end = false; 
	var _x = oPath_end.x/CELL_SIZE;
	var _y = oPath_end.y/CELL_SIZE;
	var _prevx = 0;
	var _prevy = 0; 
	
	do
	{
		if mp_grid_get_cell(path_grid, _x+1, _y) {_x += 1; _prevx = _x;}
		else if mp_grid_get_cell(path_grid, _x, _y+1) {_y += 1; _prevy = _y;}
		
		else {_dead_end = true; }
		
		
	} until(_dead_end = true); 
		
	mp_grid_path(path_grid, ai_path, oPath_end.x+(CELL_SIZE/2), oPath_end.y+(CELL_SIZE/2), _x*CELL_SIZE+(CELL_SIZE/2), _y*CELL_SIZE+(CELL_SIZE/2), false);
	
	
	
}




