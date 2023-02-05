/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _escala = 3;
var _guia = display_get_gui_height();
var _spra = sprite_get_height(spr_hud_vida) * _escala;
var _huda = _guia - _spra;

var _vida = obj_personagem.vida;
var _maxvida = obj_personagem.max_vida;

var _sanidade = obj_personagem.sanidade;
var _maxsanidade = obj_personagem.max_sanidade;

// Barra de vida
draw_sprite_ext(spr_hud_barra_vida, 0, 0, _huda, (_vida/_maxvida) * _escala, _escala, 0, c_white, 1 );
// Barra de Sanidade
draw_sprite_ext(spr_hud_barra_sanidade, 0, 0, _huda + 24, (_sanidade/_maxsanidade) * _escala, _escala, 0, c_white, 1);


// HUD
draw_sprite_ext(spr_hud_vida, 0, 0, _huda, _escala, _escala, 0, c_white, 1);

