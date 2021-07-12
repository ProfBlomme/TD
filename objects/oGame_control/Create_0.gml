
//Setup the phases
enum phasetype
{
	build,
	invasion
}

phase = phasetype.build; 

wave_count = 5; 
enemies_spawned = 0; 
spawn_timer = 0; 

card_hovering = noone; 
card_playing = noone;
object_placing = noone;		//For tiles and towers 




//Create the mp grid  (Pathfinding) 
path_grid = mp_grid_create(0, 0, room_width/CELL_SIZE, room_height/CELL_SIZE, CELL_SIZE, CELL_SIZE); 
mp_grid_add_rectangle(path_grid, 0, 0, room_width, room_height); //Mark the entire grid as red (Clear the walkable paths) 

//Create the ds grids
cell_grid = ds_grid_create(room_width/CELL_SIZE, room_height/CELL_SIZE); 
tile_grid = ds_grid_create(room_width/TILE_SIZE, room_height/TILE_SIZE); 


//Path start




var _start = instance_create_layer((floor((room_width/2)/TILE_SIZE)*TILE_SIZE), (floor((room_height/2)/TILE_SIZE)*TILE_SIZE)-TILE_SIZE, "Instances", oPath_start);
//ds_grid_add(tile_grid, (room_width/2)/TILE_SIZE, ((room_height/2)-(TILE_SIZE*2))/TILE_SIZE, _start);





//Mark the cells on cell_grid
for(i=1; i<=9; i++) 
{
	var _xx = floor((room_width/2)/TILE_SIZE);
	var _yy = floor((room_height/2)/TILE_SIZE)-1;
	
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
	ds_grid_add(cell_grid, _xx, _yy, oPath_start.cell[i]);

	//Pathfinding grid
	if (oPath_start.cell[i] == sCell_path) //or (oPath_start.cell[i] == sCell_start) 
	{
		mp_grid_clear_cell(path_grid, _xx, _yy);
	}
}




//mp_grid_clear_cell(path_grid, (room_width/2)/CELL_SIZE, ((room_height/2)-(CELL_SIZE*2))/CELL_SIZE);




//Spawn the path start (Invisible) 
instance_create_layer((room_width/2)+250, (room_height/2)-(CELL_SIZE*1), "Instances", oPath_end);

//Create the first tile 
/*var _tile = instance_create_layer(room_width/2, (room_height/2)-(CELL_SIZE*1), "Instances", oTile); 
_tile.sprite_index = sPath_2;
_tile.connect_up = true; 
_tile.connect_down = true; 
ds_grid_add(cell_grid, (room_width/2)/CELL_SIZE, ((room_height/2)-(CELL_SIZE*1))/CELL_SIZE, _tile);
mp_grid_clear_cell(path_grid, (room_width/2)/CELL_SIZE, ((room_height/2)-(CELL_SIZE*1))/CELL_SIZE);
*/
ai_path = path_add();
mp_grid_path(path_grid, ai_path, oPath_start.x+(CELL_SIZE/2), oPath_start.y+(CELL_SIZE/2), oPath_end.x+(CELL_SIZE/2), oPath_end.y+(CELL_SIZE/2), false);



deck_setup(); 
hand_setup(); 
card_draw(); 



