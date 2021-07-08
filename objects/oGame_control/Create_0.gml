

var _card = instance_create_layer(mouse_x, mouse_y, "Instances", oCard); 
_card.being_dragged = true;




//Create the mp grid 
card_grid = mp_grid_create(0, 0, room_width/CELL_SIZE, room_width/CELL_SIZE, CELL_SIZE, CELL_SIZE); 