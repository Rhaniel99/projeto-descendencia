// Pausar personagem ao trocar de room.
if (instance_exists(obj_transicao)) exit;	


if (global.pause)
	return;
	
script_execute(estado);
src_personagem_colidindo();
src_personagem_interagindo();


/*
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

*/