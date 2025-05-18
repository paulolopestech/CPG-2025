if (instance_exists(Obj_Player)) {
    vida = Obj_Player.vida; // Sincroniza com a vida do jogador
    vida_max = Obj_Player.max_vida;
	
	xp = Obj_Player.xp;
	
	poder = Obj_Player.poder;
	poder_max = Obj_Player.max_poder;
}

// Calcula o percentual de vida
var percent = (vida / vida_max) * 100;
var xp_percent = (xp / xp_max) * 100;
var poder_percent = (poder / poder_max)*100;

// Desenha a barra de vida
draw_healthbar(20, 50, 220, 70, percent, c_gray, c_red, c_green, 0, true, true);
draw_healthbar(20, 100, 220, 120, xp_percent, c_gray, c_red, c_green, 0, true, true);
draw_healthbar(20, 150, 220, 170, poder_percent, c_gray, c_red, c_green, 0, true, true);

// Desenha o texto com a vida
//draw_set_font(fnt_default); // Use uma fonte criada no GameMaker
draw_set_color(c_white);
draw_text(20, 20, "Vida: " + string(vida) + "/" + string(vida_max));
draw_text(20, 70, "XP: " + string(xp) + "/" + string(xp_max));
draw_text(20, 120, "Poder: " + string(poder) + "/" + string(poder_max));
