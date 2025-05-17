/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

valor = 0;


//altera o viewport
shake_pos = function(){
	//define os limites da mudança de valor
	var _val = random_range(-valor, valor);
	
	if(valor != 0){
		
		valor = lerp(valor, 0, .1);
		
		if(valor <= 0.1) 
			valor = 0;
			
		view_set_xport(0, _val);
		view_set_yport(0, _val);
	}
}



