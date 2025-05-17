depth = depthInicial -(y/room_height) * 100;
if(!instance_exists(Obj_TextBox)){
	image_speed = 1;
	if (mp_grid_path(Obj_Mapa.grid, caminho, x, y, destino_x[i], destino_y[i], false)){
		path_start(caminho, 0.5, path_action_stop, false);
		if (direction > 224 && direction < 314)
			sprite_index = Frente; 
		else if (direction > 134 && direction < 224){
			sprite_index = Lado;
			image_xscale = -1;
		}
		else if (direction > 44 && direction < 134)
			sprite_index = Tras;
		else {
			sprite_index = Lado;
			image_xscale = 1;
		}
	}
	flag = 0;
}
else{
	
	if(flag == 0){
		if (direction > 224 && direction < 314)
			sprite_index = FrenteStop; 
		else if (direction > 134 && direction < 224){
			sprite_index = LadoStop;
			image_xscale = -1;
		}
		else if (direction > 44 && direction < 134)
			sprite_index = TrasStop;
		else {
			sprite_index = LadoStop;
			image_xscale = 1;
		}
		i++;
		flag = 1;
	}
}