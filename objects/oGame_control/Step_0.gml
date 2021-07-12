
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
			
			//Transfer the the cells to the tile 
			object_placing.cell[1] = card_playing.cell[1]; 
			object_placing.cell[2] = card_playing.cell[2]; 
			object_placing.cell[3] = card_playing.cell[3]; 
			object_placing.cell[4] = card_playing.cell[4]; 
			object_placing.cell[5] = card_playing.cell[5]; 
			object_placing.cell[6] = card_playing.cell[6]; 
			object_placing.cell[7] = card_playing.cell[7]; 
			object_placing.cell[8] = card_playing.cell[8]; 
			object_placing.cell[9] = card_playing.cell[9]; 
			
			
			
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
		if ds_grid_get(tile_grid, floor(mouse_x/TILE_SIZE), floor(mouse_y/TILE_SIZE)) == 0
		{
			
			//Check adjacent tiles
			if check_tile_placement(floor(mouse_x/TILE_SIZE), floor(mouse_y/TILE_SIZE)) 
			{
				//Place the tile 
				var _x = floor(mouse_x/TILE_SIZE);
				var _y = floor(mouse_y/TILE_SIZE);
				
				ds_grid_add(tile_grid, _x, _y, object_placing);
				
				//Mark the cells on cell_grid
				for(i=1; i<=9; i++) 
				{
					var _xx = floor(object_placing.x/CELL_SIZE);
					var _yy = floor(object_placing.y/CELL_SIZE);
					
					switch(i)
					{
						case 2: _xx += 1; break; 
						case 3: _xx += 2; break; 
						case 4: _yy += 1; break;
						case 5: _yy += 1; _xx += 1; break; 
						case 6: _yy += 1; _xx += 2; break; 
						case 7: _yy += 2; break;
						case 8: _yy += 2; _xx += 1; break; 
						case 9: _yy += 2; _xx += 2; break; 
					}

					//Cell grid info 
					ds_grid_add(cell_grid, _xx, _yy, object_placing.cell[i]);

					//Pathfinding grid
					if (object_placing.cell[i] == sCell_path)
					{
						mp_grid_clear_cell(path_grid, _xx, _yy);
					}
				}
			
				

				//Check for connection to the path end 
				check_path = path_add();
				if mp_grid_path(path_grid, check_path, oPath_start.x+(CELL_SIZE/2)+CELL_SIZE, oPath_start.y+(CELL_SIZE/2)+CELL_SIZE, (_x*TILE_SIZE)+CELL_SIZE+(CELL_SIZE/2), (_y*TILE_SIZE)+CELL_SIZE+(CELL_SIZE/2), false) 
				{

					
					mp_grid_path(path_grid, ai_path, oPath_start.x+(CELL_SIZE/2)+CELL_SIZE, oPath_start.y+(CELL_SIZE/2)+CELL_SIZE, (_x*TILE_SIZE)+CELL_SIZE+(CELL_SIZE/2), (_y*TILE_SIZE)+CELL_SIZE+(CELL_SIZE/2), false) 
					show_debug_message("Connected"); 	
					oPath_end.x = (_x*TILE_SIZE)+CELL_SIZE; 
					oPath_end.y = (_y*TILE_SIZE)+CELL_SIZE; 
					
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
			var _enemy = instance_create_layer((oPath_start.x+CELL_SIZE)+(CELL_SIZE/2), (oPath_start.y+CELL_SIZE)+(CELL_SIZE/2), "Enemies", oEnemy);
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




