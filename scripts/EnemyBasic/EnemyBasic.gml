// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function EnemyBasic(){
	prox_estado = choose(src_enemy_andando, src_enemy_parado);
	
	if prox_estado == src_enemy_andando{
		estado = src_enemy_andando;
		dest_x = irandom_range(0, room_width);
		dest_y = irandom_range(0, room_height);
	}else if prox_estado == src_enemy_parado{
		estado = src_enemy_parado;
	}
}

function src_enemy_andando(){
	image_speed = 1;
	
	var _dir = point_direction(x, y, dest_x, dest_y);
	hveloc = lengthdir_x(veloc, _dir);
	vveloc = lengthdir_y(veloc, _dir);
	
	x += hveloc;
	y += vveloc;
	
}
function src_enemy_parado(){
	image_speed = 0.5;
}