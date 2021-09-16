
randomize();	//Randomize the game seed

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
breakthroughs = 0; 
ap = 3; 
ap_remaining = ap; 
level = 1; 

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
ds_grid_add(tile_grid, (room_width/2)/TILE_SIZE, ((room_height/2)-(TILE_SIZE*2))/TILE_SIZE, _start);


//Mark the cells on cell_grid
for(i=1; i<=9; i++) 
{
	var _xx = oPath_start.x/CELL_SIZE;
	var _yy = oPath_start.y/CELL_SIZE;
	
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
	if (oPath_start.cell[i] == sCell_path) or (oPath_start.cell[i] == sCell_start) 
	{
		mp_grid_clear_cell(path_grid, _xx, _yy);
	}
}


//Spawn the path end
var _pathx = (floor((room_width/2)/TILE_SIZE)*TILE_SIZE)+(CELL_SIZE); 
var _pathy = (floor((room_height/2)/TILE_SIZE)*TILE_SIZE)-TILE_SIZE+(CELL_SIZE*2);
instance_create_layer(_pathx, _pathy, "Towers", oPath_end);

ai_path = path_add();
mp_grid_path(path_grid, ai_path, oPath_start.x+(CELL_SIZE/2)+CELL_SIZE, oPath_start.y+(CELL_SIZE/2)+CELL_SIZE, _pathx+(CELL_SIZE/2), _pathy+(CELL_SIZE/2), false);




//Card setup 
collection_setup(); 

deck_setup(); 
hand_setup(); 
card_draw(); 



