
function collection_setup()
{

	//Create the ds_grid 
	var _cards = 20;	//Number of cards in the game 
	collection_grid = ds_grid_create(4, _cards); 
	
	//ID and card_back
	var _id_count = 1;
	for(_y = 0; _y <= _cards; _y ++)
	{
		//CARD ID
		collection_grid[# 0, _y] = _id_count;
		_id_count ++; 
		
		

	}
	
	




}