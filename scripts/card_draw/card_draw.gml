
function card_draw()
{
	//Draw card for each slot in the hand 
	for(i=1; i<=5; i++) 
	{
		if hand[i] = noone 
		{
			var _card = ds_list_find_value(deck_list, 0); 
			
			hand[i] = instance_create_layer(x_hand[i], y_hand[i], "Instances", oCard); 

			//Assign the card a random path-type 
			hand[i].sprite_index = choose(sPath_1, sPath_2, sPath_3, sPath_4);
	
			with(hand[i]) 
			{
				if sprite_index == sPath_1 {connect_right = true; connect_left = true; }
				else if sprite_index == sPath_2 {connect_up = true; connect_down = true; }
				else if sprite_index == sPath_3 {connect_right = true; connect_down = true; }
				else if sprite_index == sPath_4 {connect_up = true; connect_left = true; }
			}

			
			ds_list_delete(deck_list, 0); //Remove drawn card for the deck 
			
		}
		
		
		
		
		
	}
	
	
	
}