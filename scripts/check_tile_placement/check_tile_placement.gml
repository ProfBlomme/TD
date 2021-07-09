
function check_tile_placement()
{

	var _right = ds_grid_get(cell_grid, floor(mouse_x/CELL_SIZE)+1, floor(mouse_y/CELL_SIZE));	
	if _right != 0 
	{
		if _right.connect_left != object_placing.connect_right {return false; }
	}
			
	var _left = ds_grid_get(cell_grid, floor(mouse_x/CELL_SIZE)-1, floor(mouse_y/CELL_SIZE));	
	if _left != 0 
	{
		if _left.connect_right != object_placing.connect_left {return false; }
	}
			
	var _up = ds_grid_get(cell_grid, floor(mouse_x/CELL_SIZE), floor(mouse_y/CELL_SIZE)-1);
	if _up != 0 
	{
		if _up.connect_down != object_placing.connect_up {return false; }
	}	
			
	var _down = ds_grid_get(cell_grid, floor(mouse_x/CELL_SIZE), floor(mouse_y/CELL_SIZE)+1);
	if _down != 0 
	{
		if _down.connect_up != object_placing.connect_down {return false; }
	}
			
	return true; 
	
}