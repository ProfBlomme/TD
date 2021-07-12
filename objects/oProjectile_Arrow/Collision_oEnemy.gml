

other.hp -= dmg; 
if other.hp <= 0
{
	instance_destroy(other); 	
}

instance_destroy(); 

