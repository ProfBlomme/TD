//Draw the card back 
draw_self(); 


#region Path Indicators

	for(i=1; i<=9; i++)
	{
		var _x = x+27, _y = y+75;
		var _ind = 0; //Default to blank
		
		if cell[i] = sCell_path {_ind = 1; }
		else if cell[i] = sCell_build {_ind = 2; }
		
		//Assign coordinates
		if (i = 2) or (i = 5) or (i = 8) {_x += 15;}
		else if (i = 3) or (i = 6) or (i = 9) {_x += 30;}
		
		if i > 6 {_y += 30;}
		else if i > 3 {_y += 15;}
		
		
		draw_sprite(sPath_Indicator, _ind, _x, _y);
	}
	
#endregion


//Card text 
draw_set_halign(fa_center); 
draw_text(x+(sprite_width/2), y, card_title); 
draw_text(x+(sprite_width/2), y+16, "ID: "+string(card_id)); 





draw_text(x+(sprite_width/2), y+32, string(range)); 

//Reset 
draw_set_halign(fa_left); 
