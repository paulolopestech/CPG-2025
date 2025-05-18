
if (instance_exists(Obj_Player)) {
    var distance = point_distance(x, y, Obj_Player.x, Obj_Player.y);
    if (distance < 50 && keyboard_check_pressed(ord("C"))) { // Raio de 50 pixels
        // Incrementa a variável Poder do jogador
        with (Obj_Player) {
            Obj_Player.poder += 20; // Corrige para usar apenas "Poder" (não "Obj_Player.poder")
			Obj_Player.vel = Obj_Player.vel + 0.5*Obj_Player.vel;
	   }
		
		        
        // Cria 4 instâncias de Obj_Orbiting_Effect ao redor do jogador
        for (var i = 0; i < 3; i++) {
            var angle = i * 90; // Posiciona em 0, 90, 180, 270 graus
            var orbit_radius = 32; // Distância inicial do jogador
            var new_x = Obj_Player.x + lengthdir_x(orbit_radius, angle);
            var new_y = Obj_Player.y + lengthdir_y(orbit_radius, angle);
            var effect = instance_create_layer(new_x, new_y, "Entidades", Obj_Orbiting_Effect);
            effect.angle = angle; // Define o ângulo inicial do efeito
        }
        
        // Destroi o power-up
        instance_destroy();
        
        // Verifica se precisamos criar um novo power-up
        if (instance_number(Obj_Power_Up) < 4) {
            // Cria novo power-up em posição aleatória válida
            create_valid_powerup();
        }
    }
}
