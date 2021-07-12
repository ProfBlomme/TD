

//Update coordinates (Snap to tile_grid)
if being_placed 
{
	x = floor(mouse_x/CELL_SIZE)*CELL_SIZE;
	y = floor(mouse_y/CELL_SIZE)*CELL_SIZE;
}








if instance_exists(oEnemy)
{
	if (Firerate_timer <= 0)
	{
		var _projectile = instance_create_layer(x, y, "Towers", oProjectile_Arrow); 
		_projectile.direction = point_direction(x, y, 200, 200); 
		_projectile.speed = 1; 
		_projectile.lifetime = room_speed * 2; 
		_projectile.sprite_index = sProjectile_arrow;
		
		Firerate_timer = Firerate; 
	} else {
		Firerate_timer --; 	
	}
	
}





