/// @description Substituição de objetos
if(instance_exists(Criar)){
	instance_destroy(Criar);
}

instance_create_depth(Interagir.x, Interagir.y, Interagir.depth, Criar);
Criar.depthInicial = Interagir.depthInicial;

instance_destroy(Interagir);







