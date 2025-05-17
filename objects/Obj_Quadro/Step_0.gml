if(place_meeting(x, y, InteragirCom) && (!instance_exists(Obj_TextBox)))
{
	if(thisCharacter == noone){
		image_index = 1;
		thisCharacter = instance_create_layer(x, y, "Text", Obj_TextBox);	
		thisCharacter.text = thisTalk;
		thisCharacter.creator = self;
		thisCharacter.name = thisName;
		thisCharacter.voice = thisVoice;
		thisCharacter.face = thisFace;
	}
}else{
	if(thisCharacter != noone)
	{
		instance_destroy(Obj_TextBox);
		thisCharacter = noone;
	}
}
