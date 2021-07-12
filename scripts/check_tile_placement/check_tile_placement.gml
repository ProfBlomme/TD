

function check_tile_placement(_x, _y)
{
	var _up  = ds_grid_get(tile_grid, _x, _y-1); 
	var _down  = ds_grid_get(tile_grid, _x, _y+1); 
	var _left  = ds_grid_get(tile_grid, _x-1, _y); 
	var _right  = ds_grid_get(tile_grid, _x+1, _y); 
	
	//Check up 
	if _up != 0
	{
		if (object_placing.cell[2] == sCell_path) or (_up.cell[8] == sCell_path)
		{
			if (object_placing.cell[2] != _up.cell[8]) {return false; }
		}
	}
	
	//Check down
	if _down != 0
	{
		if (object_placing.cell[8] == sCell_path) or (_down.cell[2] == sCell_path)
		{
			if (object_placing.cell[8] != _down.cell[2]) {return false; }
		}
	}
	
	//Check left
	if _left != 0
	{
		if (object_placing.cell[4] == sCell_path) or (_left.cell[6] == sCell_path)
		{
			if (object_placing.cell[4] != _left.cell[6]) {return false; }
		}
	}	
	
	//Check right
	if _right != 0
	{
		if (object_placing.cell[6] == sCell_path) or (_right.cell[4] == sCell_path)
		{
			if (object_placing.cell[6] != _right.cell[4]) {return false; }
		}
	}		
	
	
	return true;
	
}