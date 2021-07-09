
function deck_setup()
{
	//Initialize the list 
	deck_list = ds_list_create(); 
	
	//Fill deck with blank cards 
	repeat(20) {ds_list_add(deck_list, sCard_Blank); }
	
	
	ds_list_shuffle(deck_list);
	
}