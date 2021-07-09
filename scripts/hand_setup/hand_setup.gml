
function hand_setup()
{
	
	//Create hand array
	for(i=1; i<=5; i++)
	{
		hand[i] = noone; 	
		x_hand[i] = 300 + (i * 100); 
		y_hand[i] = 700; 
	}
}