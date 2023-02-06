/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if inicializar == false {
	src_textos();
	inicializar = true;
}

if mouse_check_button_pressed(mb_left){
	if pagina < array_length_1d(texto) - 1 {
		pagina++;
	}else{
		global.dialogo = false;
		instance_destroy();
	}
}