
//Place card
if mouse_check_button_pressed(mb_left)
{
	
	//Check the grid 
	if mp_grid_get_cell(card_grid, floor(mouse_x/CELL_SIZE), floor(mouse_y/CELL_SIZE)) != -1 
	{
		
		//Check adjacent right cell
		if mp_grid_get_cell(card_grid, floor((mouse_x+CELL_SIZE)/CELL_SIZE), floor(mouse_y/CELL_SIZE)) != -1 
		{
			
		
		
			instance_create_layer(floor(mouse_x/CELL_SIZE)*CELL_SIZE, floor(mouse_y/CELL_SIZE)*CELL_SIZE, "Instances", oCard); 
			mp_grid_add_cell(card_grid, floor(mouse_x/CELL_SIZE), floor(mouse_y/CELL_SIZE));
			
		} else {show_debug_message("Adjacent right cell occupied"); }
	
	//Cell occupied
	} else {show_debug_message("Cell occupied"); }
}


