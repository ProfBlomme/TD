

if instance_exists(oEnemy)
{
	if (Firerate_timer <= 0)
	{
		var _projectile = instance_create_layer(x, y, "Instances", oProjectile_Arrow); 
		_projectile.direction = point_direction(x, y, 200, 200); 
		_projectile.speed = 1; 
		_projectile.lifetime = room_speed * 2; 
		_projectile.sprite_index = sProjectile_arrow;
		
		Firerate_timer = Firerate; 
	} else {
		Firerate_timer --; 	
	}
	
}





