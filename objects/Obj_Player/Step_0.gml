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
roda_estado();
