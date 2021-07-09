
//Place card
if mouse_check_button_pressed(mb_left)
{
	
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
}


