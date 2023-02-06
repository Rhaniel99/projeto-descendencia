// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function src_personagem_andando(){
	direita = keyboard_check(ord("D")) || keyboard_check(vk_right);
	cima = keyboard_check(ord("W")) || keyboard_check(vk_up);
	baixo = keyboard_check(ord("S")) || keyboard_check(vk_down);
	esquerda = keyboard_check(ord("A")) || keyboard_check(vk_left);
	vveloc = (baixo - cima);
	hveloc = (direita - esquerda);

	veloc_dir = point_direction(x, y, x + hveloc, y + vveloc);

	if hveloc != 0 or vveloc != 0 {
		veloc = 2;
	}else{
		veloc = 0;
	}

	hveloc = lengthdir_x(veloc, veloc_dir);
	vveloc = lengthdir_y(veloc, veloc_dir);


	// Movimentação da Sprite
	if (keyboard_check(ord("D"))) hveloc = 2;
	else if (keyboard_check(ord("A"))) hveloc = -2;

	if (keyboard_check(ord("W"))) vveloc = -2;
	else if (keyboard_check(ord("S"))) vveloc = 2;

	var dir = 0;
	if (hveloc == 2) dir = 0;
	else if (vveloc == -2) dir = 1;
	else if (hveloc == -2) dir = 2;
	else if (vveloc == 2) dir = 3;

	if (hveloc == 0 && vveloc == 0) {
	switch (dir) {
	case 0:
	sprite_index = spr_personagem_parado_direita;
	break;
	case 1:
	sprite_index = spr_personagem_parado_cima;
	break;
	case 2:
	sprite_index = spr_personagem_parado_esquerda;
	break;
	case 3:
	sprite_index = spr_personagem_parado_baixo;
	break;
	}
	} else {
		switch (dir) {
		case 0:
		sprite_index = spr_personagem_correndo_direita;
		break;
		case 1:
		sprite_index = spr_personagem_correndo_cima;
		break;
		case 2:
		sprite_index = spr_personagem_correndo_esquerda;
		break;
		case 3:
		sprite_index = spr_personagem_correndo_baixo;
		break;
		}
	}
}

function src_personagem_colidindo(){

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

function src_personagem_interagindo(){
	
	if distance_to_object(obj_par_npcs) <= 10{
	if keyboard_check_pressed(ord("E")){
	var _npc = instance_nearest(x, y, obj_par_npcs);
	var _dialogo = instance_create_layer(x, y, "Dialogo", obj_dialogo);
	_dialogo.npc_nome = _npc.nome;
	global.dialogo = true;
		}
	}
}