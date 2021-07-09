
card_hovering = noone; 
card_playing = noone;
object_placing = noone;		//For tiles and towers 




//Create the mp grid  (Pathfinding) 
path_grid = mp_grid_create(0, 0, room_width/CELL_SIZE, room_width/CELL_SIZE, CELL_SIZE, CELL_SIZE); 

//Create the ds grid for easy tile info storage
cell_grid = ds_grid_create(floor(room_width/CELL_SIZE), floor(room_width/CELL_SIZE)); 


//Create the players hand of cards 
for(i=1; i<=5; i++)
{
	//hand[i] = noone; 	
	
	//For testing 
	var _card = instance_create_layer(0, 0, "Instances", oCard);
	hand[i] = _card; 
	hand[i].sprite_index = choose(sPath_1, sPath_2, sPath_3, sPath_4);

}

hand[1].x = 400; 
hand[1].y = 700; 

hand[2].x = 500; 
hand[2].y = 700; 

hand[3].x = 600; 
hand[3].y = 700; 

hand[4].x = 700; 
hand[4].y = 700; 

hand[5].x = 800; 
hand[5].y = 700; 
