//draw_text(20, 20, "Vida " + string(vida));
//draw_text(20, 40, "Poise " + string(poise));
//draw_text(20, 60, "XP " + string(xp));
//draw_text(20, 190, "VELOCIDADE " + string(vel));

draw_set_colour(c_red);
draw_text_transformed(700, 20, "PONTOS: " + string(pontos) + "/" + string(max_pontos), 2, 2, 0); // Escala x2
draw_set_colour(c_white);