// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_enemy_colisao(){
if place_meeting(x + hveloc, y, obj_parede){
 while !place_meeting(x + sign(hveloc), y, obj_parede){
	 x += sign(hveloc);
 }
 hveloc = 0;
}
x += hveloc;
if place_meeting(x , y + vveloc, obj_parede){
 while !place_meeting(x, y + sign(vveloc), obj_parede){
	 y += sign(vveloc);
 }
 vveloc = 0;
}
y += vveloc;
}
function src_enemy_escolher_estado(){
	src_enemy_checar_personagem();
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
	src_enemy_checar_personagem();
	image_speed = 1;
	
	
	if distance_to_point(dest_x, dest_y) > veloc{
		var _dir = point_direction(x, y, dest_x, dest_y);
		hveloc = lengthdir_x(veloc, _dir);
		vveloc = lengthdir_y(veloc, _dir);
		
		scr_enemy_colisao()
	}else{
		x = dest_x;
		y = dest_y;
	}

	
}
function src_enemy_parado(){
	src_enemy_checar_personagem();
	image_speed = 0.5;
}
function src_enemy_checar_personagem(){
	if distance_to_object(obj_personagem) <= dist_aggro{
		estado = src_enemy_perseguindo;
	}
}
function src_enemy_perseguindo(){
	image_speed = 1.5;
	
	dest_x = obj_personagem.x;
	dest_y = obj_personagem.y;
	
	var _dir = point_direction(x, y, dest_x, dest_y);
	hveloc = lengthdir_x(veloc_perseg, _dir);
	vveloc = lengthdir_y(veloc_perseg, _dir);
	
	scr_enemy_colisao();
	
	if distance_to_object(obj_personagem) >= dist_desagro{
		estado = src_enemy_escolher_estado;
		alarm[0] = irandom_range(120, 240);
	}
}