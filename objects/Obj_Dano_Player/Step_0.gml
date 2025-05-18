/// @description Inserir descrição aqui
var _lista = ds_list_create();

var _qtd = instance_place_list(x,y, Obj_Inimigo_Pai, _lista, false);

//Pegar os inimigos da minha lista e passar eles para a lista de inimigos
for(var _i = 0; _i < ds_list_size(_lista); _i++){
	
	//Pegando o inimigo atual da lista
	var _atual = _lista[|_i];
	
	//Checando se o inimigo atual não existe na minha lista
	var _existe = array_contains(lista_inimigos, _atual);
	
	if(!_existe){
		//Se o inimigo não existe na lista adiciono na lista
		array_push(lista_inimigos, _atual);
		with (_atual){
			if(!morreu){
				lida_dano(, other.dano_poise);
			}
		}
	}
}

timer -= 1;
if (timer <= 0) {
    instance_destroy();
}

ds_list_destroy(_lista);



