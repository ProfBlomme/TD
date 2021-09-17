
function collection_setup()
{

	//Load the card database
	global.card_database = load_csv("card_database.csv");


	//Create the ds_grid 
	var _cards = ds_grid_height(global.card_database);	//Number of cards in the game 
	var _columns = ds_grid_width(global.card_database); 
	collection_grid = ds_grid_create(_columns, _cards); 
	
	//ID and card_back
	for(_y = 1; _y <= _cards; _y ++)
	{
		//CARD ID
		collection_grid[# 0, _y] = global.card_database[# 0, _y];
		
		
		

	}
	
	




}