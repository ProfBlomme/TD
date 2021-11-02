
if target != noone 
{
	if (can_fire == true) and (fire_cd <= 0)
	{

			var _projectile = instance_create_layer(x, y, "Instances", oProjectile); 
	
			var _dmg = damage; 
			var _dir = point_direction(x, y, target.x, target.y)
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
} else if target == noone 
{
	var _enemy = instance_nearest(x, y, oEnemy); 
	if _enemy != noone 
	{
		if point_distance(x, y, _enemy.x, _enemy.y) <= range 
		{
			target = _enemy; 
		
		}
	}
	
}

