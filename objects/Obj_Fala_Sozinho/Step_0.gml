if(place_meeting(x, y, InteragirCom) && colision == 0)
{
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
		instance_destroy();
	}

}	
else 
{
	if(thisCharacter != noone)
	{
		instance_destroy(Obj_TextBox);
		thisCharacter = noone;
		
	}
	
}