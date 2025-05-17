/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

dano = noone;
dano_valor = 1;

xscale = 1;

///Definir o poise atual dele
poise = poise_max;

//Lidando com dano
lida_dano = function(_dano = 1, _poise = 1){
	//tira vida
	vida -= _dano;
	
	//diminui o poise
	poise = max(poise - _poise, 0);
	
	if(poise <= 0 or estado_atual != estado_attack){
		troca_estado(estado_hurt);
	}
}

estado_idle = new estado();
estado_walk = new estado();
estado_attack = new estado();
estado_hurt = new estado();
estado_death = new estado();
estado_hunt = new estado();



//iniciando idle por padrao
inicia_estado(estado_idle);
