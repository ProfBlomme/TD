

other.hp -= damage; 
if other.hp <= 0
{
	with(other)
	{
		instance_destroy(); 	
	}
}


instance_destroy(); 


