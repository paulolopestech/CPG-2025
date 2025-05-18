/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
lutar = true;
max_vida = 15;
vida = max_vida;
xp = 0;
poder = 100;
//velocidade do jogador
vel = 10;

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

reduzPoder = function(_decremento = 1){
	if(poder > 0){
		poder = poder - _decremento;
	}
	if(vel > 2) {
		vel = vel - _decremento/10;
	}
	if(poder < 0) {
		poder = 0;
	}
	if(vel < 2){
		vel = 2
	}
}

aumentaXP = function(_incremento = 1){
	if(xp > 100) {
		return;
	}
	xp = xp + _incremento;
}

lida_dano = function(_dano = 1, _poise = 1){
	vida -= _dano;
	poise = max(poise - _poise, 0);
	if(poise <= 0 or estado_atual != estado_attack){
		troca_estado(estado_hit);
	}
}

//meu estado precisa de um iniciar
estado_idle.inicia = function(){

	//ajustando sprite
	sprite_index = define_sprite(dirIdle, Spr_Player_Side_Idle, Spr_Player_Front_Idle, Spr_Player_Back_Idle);

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
	dir = (point_direction(0, 0, right - left, down - up) div 90);
	sprite_index = define_sprite(dir, Spr_Player_Side_Idle, Spr_Player_Front_Idle, Spr_Player_Back_Idle);
	image_index = 0;
}

estado_walk.roda = function(){
	//muda direção
	velv = (down - up) * vel;
	velh = (right - left) * vel;
	if(!run or (velv != 0 && velh != 0)){
		velv = velv /2;
		velh = velh /2;
	}

	dir = (point_direction(0, 0, velh, velv) div 90);
	
	if(velh != 0) 
		image_xscale = sign(velh);
		
	sprite_index = define_sprite(dir, Spr_Player_Side_Walk, Spr_Player_Front_Walk, Spr_Player_Back_Walk);
	
	if(up or down){
		dirIdle = dir;
	}
	if(left or right){
		dirIdle = 0;
	}
	
	//condicao para sair
	if(velv == 0 && velh == 0){
		troca_estado(estado_idle);
	}
	if(attack){
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
	
	sprite_index = define_sprite(dir, Spr_Player_Side_Attack, Spr_Player_Front_Attack, Spr_Player_Back_Attack);
	
	var _x = x + lengthdir_x(16, dir * 90);
	var _y = y + lengthdir_y(16, dir * 90);
	meu_dano = instance_create_depth(_x, _y, depth, Obj_Dano_Player);
	meu_dano.dano_poise = dano_poise;
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
	sprite_index = define_sprite(dir, Spr_Player_Side_Hit, Spr_Player_Front_Hit, Spr_Player_Back_Hit)
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
mask_index = Spr_Player_Front_Walk;

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

//inicia maquina de estado
inicia_estado(estado_idle);