if(place_meeting(x - 8, y - 15, Obj_Player))
{
	if(Obj_Player.y > y)
		depth = Obj_Player.depth + 1;
	else
		depth = Obj_Player.depth - 1;
	if(!instance_exists(Obj_TextBox))
	if(keyboard_check_pressed(ord("E")) or keyboard_check_pressed(vk_space))
	if(thisCharacter == noone)
	{
		thisCharacter = instance_create_layer(x, y, "Text", Obj_TextBox);	
		thisCharacter.text = thisTalk;
		thisCharacter.creator = self;
		thisCharacter.name = thisName;
		thisCharacter.voice = thisVoice;
		thisCharacter.face = thisFace;
		direction = point_direction(x, y, Obj_Player.x, Obj_Player.y);
		if (direction > 224 && direction < 314)
			sprite_index = Frente; 
		else if (direction > 314 && direction < 360){
			sprite_index = Direita;
			image_xscale = 1;
		}
		else if (direction < 44 && direction > 0){
			sprite_index = Direita; 
			image_xscale = 1;
		}	
		else if (direction > 134 && direction < 224){
			sprite_index = Direita; 
			image_xscale = -1;
		}
		else if (direction > 44 && direction < 134)
			sprite_index = Tras;
	}
}	else {
	if(thisCharacter != noone)
	{
		instance_destroy(Obj_TextBox);
		thisCharacter = noone;
	}
}



