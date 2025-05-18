// Step Event
if (instance_exists(Obj_Player)) {
    // Atualiza o ângulo para rotação
    angle += orbit_speed;
    
    // Calcula a posição ao redor do jogador
    x = Obj_Player.x + lengthdir_x(orbit_radius, angle);
    y = Obj_Player.y + lengthdir_y(orbit_radius, angle);
    
	// Cria Obj_Dano_Player na posição atual
    //instance_create_layer(x, y, "Instances", Obj_Dano_Player);
	instance_create_depth(x, y, depth, Obj_Dano_Player);	
    // Decrementa o temporizador
    timer -= 1;
    
    // Destroi após 5 segundos
    if (timer <= 0) {
        instance_destroy();
    }
} else {
    // Destroi se o jogador não existir
    instance_destroy();
}