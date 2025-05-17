       /// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();
image_blend = 2;
range = 30;
dano_valor = 2;

sprite = 
{
	AttackBack : Spr_Slime2_Attack_Back,
	Attack : Spr_Slime2_Attack,
	Death : Spr_Slime2_Death,
	Hurt : Spr_Slime2_Hurt,
	Idle : Spr_Slime2_Idle,
	Walk : Spr_Slime2_Walk,
};



estado_attack.inicia = function(){
	
	image_index = 0;
	dir = point_direction(x, y, alvo.x, alvo.y);
	if(dir >= 0 &&  dir < 180){
		sprite_index = sprite.AttackBack;
	}else{
		sprite_index = sprite.Attack;
	}
	
}

estado_attack.roda = function(){
	
	if(image_index >= 7){
		
		var _dir = point_direction(x, y, alvo.x, alvo.y);
		var _x = lengthdir_x(1, dir);
		var _y = lengthdir_y(1, dir);
		
		if(!place_meeting(x + _x, y + _y, Obj_Collider1)){
			x += _x;
			y += _y;
			if(instance_exists(dano)){
				dano.x = x;
				dano.y = y;
			}
		}
		if(dano == noone){
			dano = instance_create_depth(x, y, depth, Obj_Inimigo_Dano);
			dano.dano = dano_valor;
		}
	}
	if(image_index >= image_number - 0.2){
		troca_estado(estado_idle);
	}
	
}
estado_attack.finaliza = function(){
	if(instance_exists(dano)){
		instance_destroy(dano);	
	}
	
}

inicia_estado(estado_idle);