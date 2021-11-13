

//Loading into the map (When I get that far) 
building_grid = mp_grid_create(0, 0, room_width / CELL_SIZE, room_height / CELL_SIZE, CELL_SIZE, CELL_SIZE);


var _w = room_width / CELL_SIZE;
var _h = room_height / CELL_SIZE;
for (var i = 0; i < _w; i++;)
    {
    for (var j = 0; j < _h; j++;)
        {	
			
		var map_id = layer_tilemap_get_id("Tiles_Path");
        if tilemap_get_at_pixel(map_id, (i * CELL_SIZE) + (CELL_SIZE / 2), (j * CELL_SIZE) + (CELL_SIZE / 2)) == 1
            {
				mp_grid_add_cell(building_grid, i, j);
            }
        }
    }


tooltip_timer_set = room_speed * 0.3; 
tooltip_timer = tooltip_timer_set; 

gold = 10; 

object_placing = noone; 


wave_current = 0; 
wave_max = 10; 


//Setup hand 
hand_size = 5; 
for(i=1; i<=hand_size; i++)
{
	hand[i] = noone; 
}

//Draw opening hand 
var _x_offset = 150;  
for(i=1; i<(hand_size+1); i++)
{
	if (hand[i] == noone) 
	{
		hand[i] = instance_create_layer(50 + (i * _x_offset), 600, "Instances", oCard); 
		with(hand[i]) 
		{
			card_cost = random_range(0, 3); 
		}
	}
}

