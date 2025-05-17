// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function estado() constructor
{ 
	//iniciando o estado
	static inicia = function(){};
	
	//rodando o estado
	static roda = function(){};
	
	//finalizando o estado
	static finaliza = function(){};
}

function inicia_estado(_estado) { 
	//Salvando o estado passando em uma variável
	estado_atual = _estado;
	
	estado_atual.inicia();
}
//rodando o estado
function roda_estado()
{
	estado_atual.roda();
}
//Trocando de estado
function troca_estado(_estado)
{
	estado_atual.finaliza();
	
	//rodando proximo estadp
	estado_atual = _estado;
	
	//iniciando o proximo estado
	estado_atual.inicia();
}
function define_sprite(_dir = 0, _sprite_side, _sprite_front, _sprite_back){
	var _sprite;
	switch(_dir){
		case 0: _sprite = _sprite_side; break;
		case 1: _sprite = _sprite_back; break;
		case 2: _sprite = _sprite_side; break;
		case 3: _sprite = _sprite_front; break;
	}
	return _sprite;
}
function define_caso_angular(_dir = 0){
	var _caso = 0;
	if(_dir <= 45 && _dir >= 315){
		_caso = 0;
	}
	else if(_dir <= 135 && _dir >= 45){
		_caso = 1;
	}
	else if(_dir <= 225 && _dir >= 135){
		_caso = 2;
	}
	else if(_dir <= 315 && _dir >= 225){
		_caso = 3;
	}
	
	return _caso;
}