//draw_text(20, 20, "Vida " + string(vida));
//draw_text(20, 40, "Poise " + string(poise));
//draw_text(20, 60, "XP " + string(xp));
//draw_text(20, 190, "VELOCIDADE " + string(vel));

draw_set_colour(c_red);
draw_text_transformed(20, 190, "PONTOS: " + string(pontos), 1, 1, 0);
draw_set_colour(c_white);

draw_set_colour(c_red);
draw_text_transformed(20, 210, "MONSTROS DERROTADOS: " + string(monstros_derrotados), 1, 1, 0);
draw_set_colour(c_white);