if(Transparente){
	if(instance_exists(Obj_Player)){
		if(Obj_Player.y < y){
			if(point_in_rectangle(Obj_Player.x, Obj_Player.y, bbox_left, bbox_top - 20, bbox_right, bbox_top)){
				image_alpha = lerp(image_alpha, .5, .05);
			}
			else{
				image_alpha = lerp(image_alpha, 1, .1);
			}
		}
	}
}



