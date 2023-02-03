/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Checar se esta colidindo com o player
var player = place_meeting(x, y, obj_personagem);

// Espaço

var e = keyboard_check_released(ord("E"))

// O player está colidindo com obj.
if (player && e)
{
	var tran = instance_create_layer(0, 0, layer, obj_transicao);
	tran.destino = destino;
	tran.destino_x = destino_x;
	tran.destino_y = destino_y;

}
 