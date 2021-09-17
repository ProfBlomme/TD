
draw_self(); 


if being_placed
{
	draw_circle(x+(CELL_SIZE/2), y+(CELL_SIZE/2), range, true); 
}


if instance_exists(target) 
{
	draw_line(x+(CELL_SIZE/2), y+(CELL_SIZE/2), target.x, target.y); 	
}

