/// @description Insert description here
// You can write your code in this editor

//Check for mouse hovering
if point_in_rectangle(mouse_x, mouse_y, x, y, x + sprite_width, y + sprite_height)
{
	if being_hovered == false { being_hovered = true; } 	
} else if being_hovered == true {being_hovered = false; } 


