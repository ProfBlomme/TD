
function deck_setup()
{
	//Initialize the list 
	deck_list = ds_list_create(); 
	
	//Fill deck with blank cards 
	var deck_size = 20; 
	
	for(i=0; i< deck_size; i++)
	{
		
		 ds_list_add(deck_list, collection_grid[# 0, i]);

	}
	

	
	ds_list_shuffle(deck_list);
	
}

