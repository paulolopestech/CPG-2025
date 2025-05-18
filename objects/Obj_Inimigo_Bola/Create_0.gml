 /// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
vida = 50;
tempo_estado = game_get_speed(gamespeed_fps)*10; //tempo de 10 segundos!!
timer_estado = tempo_estado;

range = 20;
//Criando estrutura com sprites dele
dano_valor = 5;

sprite = 
{
	AttackBack : Spr_Bola_Atk_back,
	Attack : Spr_Bola_Atk,
	Death : Spr_Bola_Die,
	Hurt : Spr_Bola_Hit,
	Idle : Spr_Bola_Idle,
	Walk : Spr_Bola_Walk,
};

image_index_limit = 3

destino_x = 0
destino_y = 0;
alvo = noone;
morreu = false;

// Inherit the parent event
event_inherited();

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
		var _estado_novo = choose(estado_idle, estado_walk, estado_hunt, estado_hunt)
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
	if(dano == noone && image_index >= image_index_limit){
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
			Obj_Player.aumentaXP(7);
			Obj_Player.reduzPoder(7);
			Obj_Player.aumentaPontos(10);
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
	mp_potential_step_object(alvo.x, alvo.y, 2, Obj_Collider1);
	
	//ataca o player
	var _dist = point_distance(x, y, alvo.x, alvo.y)
	
	if(_dist < range){
		troca_estado(estado_attack);
	}
	
	//olha pro lado certo
	xscale = sign(alvo.x - x);
	
	/////avisando o povo
	
	//checa quantos tem
	var _n = instance_number(object_index);
	
	//passando por todos objetos iguais
	for (var i = 0; i < _n; i++){
		 
		var _slime = instance_find(object_index, i);
		if(_slime != id) {//checa se não estou olhando pra mim mesmo
			
			if(_slime.alvo != alvo){
				var _dist2 = point_distance(x, y, _slime.x, _slime.y)
				if(_dist2 < 80){
					with(_slime){
						troca_estado(estado_hunt);
					}
				}
			}
		}
	}
}
#endregion 



inicia_estado(estado_idle);