
card_hovering = noone; 
card_playing = noone;
object_placing = noone;		//For tiles and towers 




//Create the mp grid  (Pathfinding) 
path_grid = mp_grid_create(0, 0, room_width/CELL_SIZE, room_height/CELL_SIZE, CELL_SIZE, CELL_SIZE); 

//Create the ds grid for easy tile info storage
cell_grid = ds_grid_create(room_width/CELL_SIZE, room_height/CELL_SIZE); 

//Spawn the path end 
var _end = instance_create_layer(room_width/2, (room_height/2)-(CELL_SIZE*2), "Instances", oPath_end);
ds_grid_add(cell_grid, (room_width/2)/CELL_SIZE, ((room_height/2)-(CELL_SIZE*2))/CELL_SIZE, _end);
mp_grid_add_cell(path_grid, (room_width/2)/CELL_SIZE, ((room_height/2)-(CELL_SIZE*2))/CELL_SIZE);


deck_setup(); 
hand_setup(); 
card_draw(); 


