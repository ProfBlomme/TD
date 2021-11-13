/// @description Insert description here
// You can write your code in this editor

var _y_offset = 50;

for(i=1; i<=2; i++)
{
	Card_Part[i] = instance_create_layer(x, y + ((i - 1) * _y_offset), "Instances", oCard_Part);
	Card_Part[i].card_num = i; 
}













