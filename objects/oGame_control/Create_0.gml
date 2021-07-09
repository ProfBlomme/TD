

var _card = instance_create_layer(mouse_x, mouse_y, "Instances", oCard); 
_card.being_dragged = true;




//Create the mp grid  (Pathfinding) 
path_grid = mp_grid_create(0, 0, room_width/CELL_SIZE, room_width/CELL_SIZE, CELL_SIZE, CELL_SIZE); 

//Create the ds grid for easy tile info storage
cell_grid = ds_grid_create(floor(room_width/CELL_SIZE), floor(room_width/CELL_SIZE)); 

