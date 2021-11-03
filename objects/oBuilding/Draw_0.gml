draw_self(); 


//Show the building range 
draw_set_alpha(0.25); 
draw_circle(x+(CELL_SIZE/2), y+(CELL_SIZE/2), range, false); 
draw_set_alpha(1); 

draw_circle(x+(CELL_SIZE/2), y+(CELL_SIZE/2), range, true); 
