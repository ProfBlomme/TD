



//Loading into the map (When I get that far) 
path_grid = mp_grid_create(0, 0, room_width / CELL_SIZE, room_height / CELL_SIZE, CELL_SIZE, CELL_SIZE);



var _w = room_width / CELL_SIZE;
var _h = room_height / CELL_SIZE;
for (var i = 0; i < _w; i++;)
    {
    for (var j = 0; j < _h; j++;)
        {	
			
		mp_grid_add_cell(path_grid, i, j);	//Add all cells
			
		var map_id = layer_tilemap_get_id("Tiles_Path");
        if tilemap_get_at_pixel(map_id, (i * CELL_SIZE) + (CELL_SIZE / 2), (j * CELL_SIZE) + (CELL_SIZE / 2)) = 1
            {
			mp_grid_clear_cell(path_grid, i, j);
            }
        }
    }


path_enemy = path_add();

mp_grid_path(path_grid, path_enemy, oPath_Start.x+(CELL_SIZE / 2), oPath_Start.y+(CELL_SIZE / 2), oPath_End.x+(CELL_SIZE / 2), oPath_End.y+(CELL_SIZE / 2), false); 


spawn_wave = false; 
wavespawn_timer_set = room_speed * 0.3;
wavespawn_timer = 0; 



