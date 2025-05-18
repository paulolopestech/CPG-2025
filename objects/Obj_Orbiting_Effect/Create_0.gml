// Create Event
angle = 0; // Ângulo inicial (definido ao criar a instância)
orbit_speed = 2; // Velocidade de rotação (graus por frame)
orbit_radius = 32; // Raio da órbita
timer = 5 * 60; // 5 segundos * 60 frames (assumindo 60 FPS)

// Inicia o som de fogo em loop
fire_sound = audio_play_sound(Sound_Fire, 1, true); // true = loop