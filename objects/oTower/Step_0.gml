

//Update coordinates (Snap to tile_grid)
if being_placed 
{
	x = floor(mouse_x/CELL_SIZE)*CELL_SIZE;
	y = floor(mouse_y/CELL_SIZE)*CELL_SIZE;
}





var _enemy = instance_nearest(x, y, oEnemy);
if (_enemy != noone)
{
	if (point_distance(x, y, _enemy.x, _enemy.y) <= range) 
	{		
		target = _enemy; 
	} else {
		target = noone; 	
	}
}



if target != noone
{
	if instance_exists(target) 
	{
		if (firerate_timer <= 0)
		{
			var _projectile = instance_create_layer(x, y, "Towers", oProjectile_Arrow); 
			_projectile.direction = point_direction(x, y, target.x, target.y); 
			_projectile.speed = 2; 
			_projectile.lifetime = room_speed * 2; 
			_projectile.sprite_index = sProjectile_arrow;
			_projectile.dmg = 1; 
		
			firerate_timer = firerate; 
		} else {
			firerate_timer --; 	
		}
	} else {
		target = noone; 	
	}
}

