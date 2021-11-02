



//Loading into the map (When I get that far) 
path_grid = mp_grid_create(0, 0, room_width / 32, room_height /32, 32, 32);


var cell_size = 32; // Set this to size of each tile cell
var _w = room_width / cell_size;
var _h = room_height / cell_size;
for (var i = 0; i < _w; i++;)
    {
    for (var j = 0; j < _h; j++;)
        {	
			
		mp_grid_add_cell(path_grid, i, j);	//Add all cells
			
		var map_id = layer_tilemap_get_id("Tiles_Path");
        if tilemap_get_at_pixel(map_id, (i * cell_size) + (cell_size / 2), (j * cell_size) + (cell_size / 2)) != 0
            {
			mp_grid_clear_cell(path_grid, i, j);
            }
        }
    }


path_enemy = path_add();

mp_grid_path(path_grid, path_enemy, oPath_Start.x, oPath_Start.y, oPath_End.x, oPath_End.y, false); 







