/// @description Insert description here
// You can write your code in this editor

draw_self();

if being_hovered 
{
	#region Draw tooltip 
	
//Draw the tooltip box 
	var _tt_x = x + sprite_width + 10, 
	_tt_y = y, 
	_tt_width = 100,
	_tt_height = 80;
	
	draw_set_color(c_black); 
	draw_rectangle(_tt_x, _tt_y, _tt_x + _tt_width, _tt_y + _tt_height, true); 	
	
	draw_set_alpha(0.8); 
	draw_rectangle(_tt_x, _tt_y, _tt_x + _tt_width, _tt_y + _tt_height, false); 	
	
	//Reset
	draw_set_color(c_white); 
	draw_set_alpha(1);
	
	
//Draw the tooltip text
	draw_text(_tt_x + 2, _tt_y + 2, string(building_id)); 
	
	
	#endregion
}

