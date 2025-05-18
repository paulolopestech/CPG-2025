/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Ajusta profundidade
depth = depthInicial -(y/room_height) * 100;

//inputs usuario
up = keyboard_check(vk_up) or keyboard_check(ord("W"));
down = keyboard_check(vk_down) or keyboard_check(ord("S"));
right = keyboard_check(vk_right) or keyboard_check(ord("D"));
left = keyboard_check(vk_left) or keyboard_check(ord("A"));
run = keyboard_check(vk_shift) or keyboard_check(ord("L"));
attack = mouse_check_button(mb_left) and lutar;

//aplicando os inpúts a velocidade

//rodar maquina de estados

// Variável para controlar a frequência do raio
if (!variable_instance_exists(id, "raio_timer")) {
    raio_timer = 0;
}

// Verifica se o jogador está correndo (Shift) e se movendo
var is_running = run && (up || down || left || right);

if (is_running && raio_timer <= 0) {
    // Cria o objeto de raio na posição dos pés do jogador
    var raio_x = x; // Posição x do jogador
    var raio_y = y; // Ajusta para os pés (base do sprite)
    instance_create_layer(raio_x, raio_y, "Entidades", Obj_raio);
    
    // Define o temporizador para evitar criar raios em todos os frames
    raio_timer =5; // Cria um raio a cada 5 frames (ajuste conforme necessário)
}

// Decrementa o temporizador
if (raio_timer > 0) {
    raio_timer--;
}

roda_estado();
