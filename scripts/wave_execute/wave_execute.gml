// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function wave_execute()
{
	
	with(oPath_Start)
	{
		wave_list = ds_list_create(); 

		repeat(10)
		{
			ds_list_add(wave_list, oEnemy)
		}
		
		spawn_wave = true; 
	
	}
	
	wave_current ++; 
}