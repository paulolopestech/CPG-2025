if(place_meeting(x, y, Player))
{
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
		thisCharacter.x += difXTextBox;
		thisCharacter.y += difYTextBox;
	}
}	else {
	if(thisCharacter != noone)
	{
		instance_destroy(Obj_TextBox);
		thisCharacter = noone;
	}
}



