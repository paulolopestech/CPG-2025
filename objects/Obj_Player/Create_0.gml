/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (!audio_is_playing(main_sound_theme)) {
    audio_play_sound(main_sound_theme, 10, true);
}
sword_sound = 0;
pontos = 0
max_pontos = 1000;
monstros_derrotados = 0;
lutar = true;
max_vida = 50;
vida = max_vida;
xp = 20;
max_xp = 70;
max_poder = 200;
poder = 200;
temp_dir = 0;
//velocidade do jogador
vel = 3;

poise_max = 5;
poise = poise_max;

meu_dano = noone;
dano_poise =  poder;
imageIndex = 0;

depthInicial = 0;
#region maquina de estado
//iniciando estados
estado_idle = new estado();
estado_walk = new estado();
estado_attack = new estado();
estado_hit = new estado();

aumentaPontos = function(_incremento = 1){
	if(pontos < max_pontos) {
		pontos = pontos + _incremento*2.2;
	}
	if(pontos > max_pontos){
		pontos = max_pontos;
	}
	monstros_derrotados = monstros_derrotados + 1;
}

reduzPoder = function(_decremento = 1){
	if(poder > 1){
		poder = poder - _decremento;
	}
	if(vel > 1) {
		vel = vel - _decremento/200;
	}
	if(poder < 1) {
		poder = 1;
	}
	if(vel < 1){
		vel = 1
	}
}

aumentaXP = function(_incremento = 1){
	if(xp + _incremento > max_xp) {
		xp = max_xp;
		return;
	}
	xp = xp + _incremento/4;
}

lida_dano = function(_dano = 1, _poise = 1){
	if(vida > 0) {
		vida -= _dano;
	}
	poise = max(poise - _poise, 0);
	if(poise <= 0 or estado_atual != estado_attack){
		troca_estado(estado_hit);
	}
}

//meu estado precisa de um iniciar
estado_idle.inicia = function(){

	//ajustando sprite
	sprite_index = define_sprite_diagonal(dirIdle, Spr_Player_Front_Right_Idle, Spr_Player_Back_Right_Idle);

	image_index = 0;
}
estado_idle.roda = function(){
	//condicao para sair
	if(up xor down or right xor left){
		troca_estado(estado_walk);
	}
	
	//condicao para sair
	if(attack){
		troca_estado(estado_attack);
	}
}

estado_walk.inicia = function(){
	temp_dir = point_direction(0, 0, velh, velv) div 90;
	if (temp_dir == 1 || temp_dir == 3) {
	    dir = temp_dir;
	}
	sprite_index =  define_sprite_diagonal(dirIdle, Spr_Player_Front_Right_Idle, Spr_Player_Back_Right_Idle);
	image_index = 0;
}

estado_walk.roda = function(){
    // Muda direção
    velv = (down - up) * vel;
    velh = (right - left) * vel;
    if(!run or (velv != 0 && velh != 0)){
        velv = velv / 2;
        velh = velh / 2;
    }

    temp_dir = point_direction(0, 0, velh, velv) div 90;

    if (temp_dir == 1 || temp_dir == 3) {
        dir = temp_dir;
    }
    
    sprite_index = define_sprite_diagonal(dir, Spr_Player_Front_Right_Walk, Spr_Player_Back_Right_Walk);
    
    if(velh != 0) 
        image_xscale = sign(velh);
    
    if(up or down){
        dirIdle = dir;
    }
    if(left or right){
        dirIdle = 0;
    }
    
    // Toca som de caminhada se não estiver tocando
    if (velv != 0 || velh != 0) { // Verifica se está se movendo
        if (!audio_is_playing(Sound_Walking_1)) {
            audio_play_sound(Sound_Walking_1, 10, true); // Toca em loop
        }
    }
    
    // Verifica o dash (Shift pressionado)
    if (keyboard_check_pressed(vk_shift)) {
        audio_stop_sound(Sound_Walking_1); // Para o som de caminhada
        audio_play_sound(Sound_Dash, 10, false); // Toca som de dash (sem loop)
        //troca_estado(estado_dash); // Transita para o estado de dash
    }
    
    // Condição para sair
    if(velv == 0 && velh == 0){
        audio_stop_sound(Sound_Walking_1); // Para o som quando para de caminhar
        troca_estado(estado_idle);
    }
    if(attack){
        audio_stop_sound(Sound_Walking_1); // Para o som ao atacar
        troca_estado(estado_attack);
    }
}

estado_attack.inicia = function(){
	image_index = 0;
	
	dirAttack = point_direction(x, y, mouse_x, mouse_y);
	dir = define_caso_angular(dirAttack);
	dirIdle = dir;
	
	velh = 0;
	velv = 0;
	
	if(dir == 0) 
		image_xscale = 1;
	else
		image_xscale = -1;
	
	sprite_index = define_sprite_diagonal(dir, Spr_Player_Front_Right_Attack, Spr_Player_Back_Right_Attack);
	
	var _x = x + lengthdir_x(16, dir * 90);
	var _y = y + lengthdir_y(16, dir * 90);
	meu_dano = instance_create_depth(_x, _y, depth, Obj_Dano_Player);
	meu_dano.dano_poise = dano_poise;
	
	// Toca som alternado
    if (sword_sound == 0) {
        audio_play_sound(Sound_Sword_1, 10, false);
        sword_sound = 1; // Próximo será Sound_Sword_2
    } else {
        audio_play_sound(Sound_Sword_2, 10, false);
        sword_sound = 0; // Próximo será Sound_Sword_1
    }
}

estado_attack.roda = function(){
	//saindo do attack quando acabar animation
	if(image_index >= image_number - 0.3){
		troca_estado(estado_idle);
	}
	
}

estado_attack.finaliza = function(){
	instance_destroy(meu_dano);
}

estado_hit.inicia = function(){
	sprite_index = define_sprite_diagonal(dir, Spr_Player_Hit, Spr_Player_Hit)
	image_index = 0;
	velh = 0;
	velv = 0;
	imageIndex = 0;
	Obj_Screen_Shake.valor += 20;
}

estado_hit.roda = function(){
	if(image_index > imageIndex){
		imageIndex = image_index;
	}
	if(image_index < imageIndex){
		troca_estado(estado_idle);
	}
}

#endregion

#region iniciando variaveis
//Colisao
mask_index = Spr_Player_Front_Right_Idle;

//controles iniciados sem valor
up = noone;
down = noone;
left = noone;
right = noone;
attack = noone;

//variaveis de movimento
//iniciando parado
velh = 0;
velv = 0;

//controlando direção
dir = 0;
dirIdle = 0;
dirAttack = 0;

#endregion

repeat (5) {
    var new_x = random(room_width);
    var new_y = random(room_height);
    instance_create_layer(new_x, new_y, "Entidades", Obj_Power_Up);
}

//inicia maquina de estado
inicia_estado(estado_idle);