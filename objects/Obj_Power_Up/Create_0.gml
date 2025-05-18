// Create Event
// Nada necessário aqui, mas podemos definir sprite ou propriedades visuais

// Step Event
// Verifica colisão com o jogador e tecla C

// Função para criar power-up em posição válida
function create_valid_powerup() {
    var new_x, new_y, attempts = 0;
    do {
        new_x = random(room_width);
        new_y = random(room_height);
        attempts++;
    } until (!place_meeting(new_x, new_y, Obj_Collision_Events) || attempts > 100);
    
    if (attempts <= 100) {
        instance_create_layer(new_x, new_y, "Entidades", Obj_Power_Up);
    }
}
