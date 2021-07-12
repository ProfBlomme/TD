
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
			hand[i].sprite_index = choose(sPath_1, sPath_2, sPath_3, sPath_4, sPath_5, sPath_6);
			

			with(hand[i]) 
			{
				//Set cells and connection requirements based on the chosen tile sprite
				switch(sprite_index) 
				{
					case sPath_1: 
						connect_right = true; 
						connect_left = true;
						cell[1] = sCell_blank;	//0=Empty, 1=Path, 2=Buildspot
						cell[2] = sCell_blank;
						cell[3] = sCell_blank;
						cell[4] = sCell_path;
						cell[5] = sCell_path;
						cell[6] = sCell_path;
						cell[7] = sCell_blank;
						cell[8] = sCell_blank;
						cell[9] = sCell_blank;
					break;
					
					case sPath_2: 
						connect_up = true; 
						connect_down = true; 
						cell[1] = sCell_blank;	//0=Empty, 1=Path, 2=Buildspot
						cell[2] = sCell_path;
						cell[3] = sCell_blank;
						cell[4] = sCell_blank;
						cell[5] = sCell_path;
						cell[6] = sCell_blank;
						cell[7] = sCell_blank;
						cell[8] = sCell_path;
						cell[9] = sCell_blank;
					break;
					
					case sPath_3: 
						connect_up = true; 
						connect_down = true; 
						cell[1] = sCell_blank;	//0=Empty, 1=Path, 2=Buildspot
						cell[2] = sCell_path;
						cell[3] = sCell_blank;
						cell[4] = sCell_blank;
						cell[5] = sCell_path;
						cell[6] = sCell_path;
						cell[7] = sCell_blank;
						cell[8] = sCell_blank;
						cell[9] = sCell_blank;
					break;
					
					case sPath_4: 
						connect_right = true; 
						connect_down = true; 
						cell[1] = sCell_blank;	//0=Empty, 1=Path, 2=Buildspot
						cell[2] = sCell_blank;
						cell[3] = sCell_blank;
						cell[4] = sCell_blank;
						cell[5] = sCell_path;
						cell[6] = sCell_path;
						cell[7] = sCell_blank;
						cell[8] = sCell_path;
						cell[9] = sCell_blank;					
					break;
					
					case sPath_5: 
						connect_right = true; 
						connect_down = true; 
						cell[1] = sCell_blank;	//0=Empty, 1=Path, 2=Buildspot
						cell[2] = sCell_blank;
						cell[3] = sCell_blank;
						cell[4] = sCell_path;
						cell[5] = sCell_path;
						cell[6] = sCell_blank;
						cell[7] = sCell_blank;
						cell[8] = sCell_path;
						cell[9] = sCell_blank;					
					break;					
					
					case sPath_6: 
						connect_up = true; 
						connect_left = true;
						cell[1] = sCell_blank;	//0=Empty, 1=Path, 2=Buildspot
						cell[2] = sCell_path;
						cell[3] = sCell_blank;
						cell[4] = sCell_path;
						cell[5] = sCell_path;
						cell[6] = sCell_blank;
						cell[7] = sCell_blank;
						cell[8] = sCell_blank;
						cell[9] = sCell_blank;			
					break;
				}


				//Add 1 random build spot
				var _buildlist = ds_list_create(); 
				for(b=1; b<=9; b++)
				{
					if cell[b] == sCell_blank 
					{
						ds_list_add(_buildlist, b); 	
					}
				}
			
				ds_list_shuffle(_buildlist); 
				var _spot = ds_list_find_value(_buildlist, 0); 
				cell[_spot] = sCell_build; 
			
				//Destroy the buildlist
				ds_list_destroy(_buildlist);

			}

			ds_list_delete(deck_list, 0); //Remove drawn card for the deck 
		}

	}
		
}