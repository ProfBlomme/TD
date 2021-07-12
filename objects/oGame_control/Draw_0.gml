
draw_text(10, 10,"Enemies left :"+ string(instance_number(oEnemy)));
draw_text(10, 30,"Enemies let through :"+string(breakthroughs));

draw_text(150, 650,"Actions remaining :"+string(ap_remaining));

draw_path(ai_path, oPath_start.x+CELL_SIZE, oPath_start.y+CELL_SIZE, true); 

/*
//Dreaw grid for debugging
draw_set_alpha(0.6);
mp_grid_draw(path_grid); 


draw_set_alpha(1);
