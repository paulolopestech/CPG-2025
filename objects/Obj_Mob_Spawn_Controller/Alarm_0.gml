// Lista de objetos que podem ser gerados
var objects = [Obj_Inimigo_Bola, Obj_Inimigo_Caracol, Obj_Inimigo_Caveira];

// Escolhe um objeto com base em probabilidades
var rand = random(100); // Gera número entre 0 e 100
var chosen_object;

if (rand < 40) {
	chosen_object = Obj_Inimigo_Caracol; // 45% de chance (30 a 65)
} else if (rand < 80) {
   chosen_object = Obj_Inimigo_Caveira; // 35% de chance (65 a 100)
} else {
	chosen_object = Obj_Inimigo_Bola; // 20% de chance
}

// Define uma posição aleatória na room
var spawn_x = irandom_range(50, room_width - 50); // Evita bordas
var spawn_y = irandom_range(50, room_height - 50);

// Cria o objeto na posição aleatória
var num_bolas = instance_number(Obj_Inimigo_Bola);
var num_caracol = instance_number(Obj_Inimigo_Caracol);
var num_caveira = instance_number(Obj_Inimigo_Caveira);

if (num_bolas + num_caracol + num_caveira < 50) {
    instance_create_layer(spawn_x, spawn_y, "Collision", chosen_object);
}

// Reinicia o alarme para o próximo spawn
alarm[0] = spawn_interval;