// Pousar personagem ao trocar de room.
if (instance_exists(obj_transicao)) exit;	
if (global.pause)
	return;
	
#region Controles
direita = keyboard_check(ord("D")) || keyboard_check(vk_right);
cima = keyboard_check(ord("W")) || keyboard_check(vk_up);
baixo = keyboard_check(ord("S")) || keyboard_check(vk_down);
esquerda = keyboard_check(ord("A")) || keyboard_check(vk_left);
#endregion
#region Movimentacao
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
#endregion
#region Colisão

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


#endregion
#region Interacao

if (keyboard_check_pressed(ord("E"))) {
    // Armazena o objeto mais próximo do personagem com o tipo obj_carta em uma variável
    var object = instance_nearest(x, y, obj_carta);
    
    // Verifica se o objeto existe e se a distância entre o personagem e o objeto é menor ou igual a um valor específico
    if (object && point_distance(x, y, object.x, object.y) <= 58) {
        // Define a variável "interacao" como verdadeira
        object.interacao = true
        
        // Exibe uma mensagem na tela
        show_message("Você encontrou uma carta antiga!");
    }
	
	object = instance_nearest(x, y, obj_item);
	
	if (object && point_distance(x, y, object.x, object.y) <= 58)
	{
		object.GetObject();
	}
}
#endregion
#region Armas/Ferramentas
// Tiro
if (mouse_check_button(mb_left) && cooldown < 1)
{
	var shot = instance_create_depth(x, y, 1, obj_tiro)
	shot.image_angle = point_direction(x,y,mouse_x,mouse_y)
	shot.direction = point_direction(x,y,mouse_x,mouse_y)
	shot.speed = 7
	
	cooldown = 2 * 60
}

cooldown = cooldown - 1 
	
#endregion
if (keyboard_check(ord("D"))) hveloc = 1;
else if (keyboard_check(ord("A"))) hveloc = -1;

if (keyboard_check(ord("W"))) vveloc = -1;
else if (keyboard_check(ord("S"))) vveloc = 1;

var dir = 0;
if (hveloc == 1) dir = 0;
else if (vveloc == -1) dir = 1;
else if (hveloc == -1) dir = 2;
else if (vveloc == 1) dir = 3;

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
