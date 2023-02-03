/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


#region Controles
direita = keyboard_check(ord("D"));
cima = keyboard_check(ord("W"));
baixo = keyboard_check(ord("S"));
esquerda = keyboard_check(ord("A"));
#endregion

#region Controles
direita = keyboard_check(ord("D"));
cima = keyboard_check(ord("W"));
baixo = keyboard_check(ord("S"));
esquerda = keyboard_check(ord("A"));
#endregion

#region Colisão
if place_meeting(x + hveloc, y, obj_parede){
 while !place_meeting(x + sign(hveloc), y, obj_parede){
	 x += sign(hveloc);
 }
 hveloc = 0;
}
x += hveloc;

vveloc = (baixo - cima) * veloc;

if place_meeting(x , y + vveloc, obj_parede){
 while !place_meeting(x, y + sign(vveloc), obj_parede){
	 y += sign(vveloc);
 }
 vveloc = 0;
}
y += vveloc;


#endregion

hveloc = (direita - esquerda) * veloc;



if (keyboard_check_pressed(ord("E"))) {
    // Armazena o objeto mais próximo do personagem com o tipo obj_carta em uma variável
    var object = instance_nearest(x, y, obj_carta);
    
    // Verifica se o objeto existe e se a distância entre o personagem e o objeto é menor ou igual a um valor específico
    if (object && point_distance(x, y, object.x, object.y) <= 58) {
        // Define a variável "interacao" como verdadeira
        object.interacao = true;
		

        
        // Exibe uma mensagem na tela
        show_message("Você encontrou uma carta antiga!");
		
    }
}
	

if (instance_exists(obj_transicao)) exit;	

