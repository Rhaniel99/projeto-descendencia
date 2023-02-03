/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (mudei)
{
	alpha -= .02;
}
else // Ainda não mudei de room.
{
	alpha += .02;
}

// Quando alpha passar de 1 (escurecer a tela), mudar de room.
if (alpha >= 1)
{
 room_goto(destino);
 
 // controlando a posição do player 
 obj_personagem.x = destino_x;
 obj_personagem.y = destino_y;
}

// Destruir a transição

if (mudei && alpha <= 0)
{
	instance_destroy();
}