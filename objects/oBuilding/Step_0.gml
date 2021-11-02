

if target != noone 
{
	
	if point_distance(x+(CELL_SIZE/2), y+(CELL_SIZE/2), target.x+(CELL_SIZE/2), target.y+(CELL_SIZE/2)) >= range 
	{
		target = noone; 	
	} else {
	
	
		if (can_fire == true) and (fire_cd <= 0)
		{

				var _projectile = instance_create_layer(x+(CELL_SIZE/2), y+(CELL_SIZE/2), "Instances", oProjectile); 
	
				var _dmg = damage; 
				var _dir = point_direction(x+(CELL_SIZE/2), y+(CELL_SIZE/2), target.x+(CELL_SIZE/2), target.y+(CELL_SIZE/2))
				with(_projectile)
				{
					damage = _dmg 
					speed = 2; 
					direction = _dir; 
				}
	
				fire_cd = firerate; 
		
		
		} else {
			fire_cd --; 
	
		}
	
	}
} else if target == noone 
{
	var _enemy = instance_nearest(x+(CELL_SIZE/2), y+(CELL_SIZE/2), oEnemy); 
	if _enemy != noone 
	{
		if point_distance(x+(CELL_SIZE/2), y+(CELL_SIZE/2), _enemy.x+(CELL_SIZE/2), _enemy.y+(CELL_SIZE/2)) <= range 
		{
			target = _enemy; 
		
		}
	}
	
}

