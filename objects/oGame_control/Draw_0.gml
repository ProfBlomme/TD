
draw_text(10, 10,"Enemies left :"+ string(instance_number(oEnemy)));
draw_text(10, 30,"Enemies let through :"+string(breakthroughs));

draw_text(150, 350,"Actions remaining :"+string(ap_remaining));

draw_path(ai_path, oPath_start.x+CELL_SIZE, oPath_start.y+CELL_SIZE, true); 









#region Draw Draw and Discard piles
var x_draw = 200, y_draw = 630, x_discard = 1000, y_discard = 630; 

//Drawpile 
var deck_size = ds_list_size(deck_list); 
if deck_size > 0 { draw_sprite(sDraw_pile, 0, x_draw, y_draw); }

draw_set_halign(fa_center);
draw_text(x_draw+32, y_draw-24, "Cards left: "+string(deck_size));


//Discardpile 
var discard_size = ds_list_size(discard_list); 
if discard_size <= 0 { draw_sprite(sDiscard_pile, 0, x_discard, y_discard); }

draw_text(x_discard+32, y_discard-24, "Discarded: "+string(discard_size));



//Reset
draw_set_halign(fa_left);


#endregion 





/*
//Dreaw grid for debugging
draw_set_alpha(0.6);
mp_grid_draw(path_grid); 


draw_set_alpha(1);
