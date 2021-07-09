
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
				ds_grid_add(cell_grid, floor(mouse_x/CELL_SIZE), floor(mouse_y/CELL_SIZE), object_placing);
			
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

/*


		//Check the grid 
		if mp_grid_get_cell(path_grid, floor(mouse_x/CELL_SIZE), floor(mouse_y/CELL_SIZE)) != -1 
		{
		
			//Check adjacent right cell
			var _check_right = ds_grid_get(cell_grid, floor((mouse_x+CELL_SIZE)/CELL_SIZE), floor(mouse_y/CELL_SIZE));
		
			if _check_right = 0
			{
				var _tile = instance_create_layer(floor(mouse_x/CELL_SIZE)*CELL_SIZE, floor(mouse_y/CELL_SIZE)*CELL_SIZE, "Instances", oCard); 
				mp_grid_add_cell(path_grid, floor(mouse_x/CELL_SIZE), floor(mouse_y/CELL_SIZE));
			
				ds_grid_add(cell_grid, floor(mouse_x/CELL_SIZE), floor(mouse_y/CELL_SIZE), _tile);
				show_debug_message("Tile placed: "+string(_tile));
			
				//There is a tile on the right side
			} else if _check_right.connect_left
			{
				var _tile = instance_create_layer(floor(mouse_x/CELL_SIZE)*CELL_SIZE, floor(mouse_y/CELL_SIZE)*CELL_SIZE, "Instances", oCard); 
				mp_grid_add_cell(path_grid, floor(mouse_x/CELL_SIZE), floor(mouse_y/CELL_SIZE));
			
				ds_grid_add(cell_grid, floor(mouse_x/CELL_SIZE), floor(mouse_y/CELL_SIZE), _tile);
				show_debug_message("Tile placed: "+string(_tile));
			
			

			} else {
				show_debug_message("Adjacent right cell occupied"); 
			}
	
		//Cell occupied
		} else {show_debug_message("Cell occupied"); }






