event_inherited();
image_index_attack_limit = 3;
range = 10;
dano_valor = 1;
destino_x = 0
destino_y = 0;
alvo = noone;
morreu = false;
tempo_estado = game_get_speed(gamespeed_fps)*10;
timer_estado = tempo_estado;
obj_speed = 0.5

sprite = 
{
	AttackBack : Spr_Caracol_Hit,
	Attack : Spr_Caracol_Hit,
	Death : Spr_Caracol_Idle,
	Hurt : Spr_Caracol_Idle,
	Idle : Spr_Caracol_Idle,
	Walk : Spr_Caracol_Idle,
};
#region estados

estado_idle.inicia = function(){
	if(morreu == true){
		instance_destroy();
	}
	
	//definir sprite
	sprite_index = sprite.Idle;
	image_index = 0;
	
	timer_estado = tempo_estado;
	//image_blend = c_white;
}

estado_idle.roda = function(){
	timer_estado--;
	
	var _tempo = irandom(timer_estado);
	if(_tempo <= tempo_estado *.01){
		var _estado_novo = choose(estado_idle, estado_walk)
		troca_estado(_estado_novo);
	}
}

estado_walk.inicia = function(){
	//definir sprite
	sprite_index = sprite.Walk;
	image_index = 0;
	
	timer_estado = tempo_estado;
	
	destino_y = irandom(room_height);
	destino_x = irandom(room_width);
	xscale = sign(destino_x - x);
	
	if(place_meeting(destino_x, destino_y, Obj_Collider1)){
		troca_estado(estado_idle);
	}
}

estado_walk.roda = function(){
	timer_estado--;
	
	var _tempo = irandom(timer_estado);
	
	if(_tempo <= 5){
		var _estado_novo = choose(estado_idle, estado_walk)
		troca_estado(_estado_novo);
	}
	
	//indo até o destino desviando de objetos
	mp_potential_step_object(destino_x, destino_y, 1, Obj_Collider1);
}

estado_attack.inicia = function(){
	//definir sprite
	sprite_index = sprite.Attack;
	image_index = 0;
}

estado_attack.roda = function(){
	
	//criando o meu dano
	if(dano == noone && image_index >= image_index_attack_limit){
		dano = instance_create_depth(x, y, depth, Obj_Inimigo_Dano);
		dano.dano = dano_valor;
	}
	//Saindo do estado de ataque
	if(image_index >= image_number - .5)
		troca_estado(estado_idle);
	
}
estado_attack.finaliza = function(){
	
	alvo = noone;
	if(instance_exists(dano)){
		instance_destroy(dano);
	}
	dano = noone;
}

estado_hurt.inicia = function(){
	Obj_Screen_Shake.valor += irandom_range(2, 6);
	//definir sprite
	if(vida > 0){
		sprite_index =sprite.Hurt;
		image_index = 0;
	}
}

estado_hurt.roda = function(){
	
	//saindo do estado de dano
	if(image_index >= image_number - .5){
		if(vida > 0){
			troca_estado(estado_hunt);
		}
		else{
			troca_estado(estado_death);
		}
	}
		
}

estado_hurt.finaliza = function(){
	
	if(poise < 1){
		poise = poise_max;
	}
	
}

estado_death.inicia = function(){
	//definir sprite
	sprite_index = sprite.Death; 
	image_index = 0;
	mask_index = Spr_Mask_0;
	morreu = true;
}

estado_death.roda = function(){
	if(morreu == true){
		if(image_index >= image_number - .5){
			Obj_Player.aumentaXP(2);
			Obj_Player.reduzPoder(2);
			Obj_Player.aumentaPontos(5);
			instance_destroy();
		}
	}
}

estado_hunt.inicia = function(){
	//definir sprite
	sprite_index =sprite.Walk;
	image_index = 0;
	//image_blend = c_yellow;
	
	if(instance_exists(Obj_Player)){
		alvo = Obj_Player.id;
	}
}

estado_hunt.roda = function(){
	
	//definindo o alvo do player
	if(!instance_exists(Obj_Player)){
		alvo = noone;
		troca_estado(estado_idle);
	}
	//seguindo o alvo
	mp_potential_step_object(alvo.x, alvo.y, 1, Obj_Collider1);
	
	//ataca o player
	var _dist = point_distance(x, y, alvo.x, alvo.y)
	
	if(_dist < range){
		troca_estado(estado_attack);
	}
	
	//olha pro lado certo
	xscale = sign(alvo.x - x);
}
#endregion 

inicia_estado(estado_idle);