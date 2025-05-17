//Textbox
draw_sprite(Spr_TextBox, 0, x + 4, y + 110);

if(text[page] == 0){
	page += 1;
}else{
	//Face
	draw_sprite_ext(face[pessoa], round(faceSpeed), x + 28, y + 134, 1.25, 1.25, 0, c_white, 100);


	//Text
	draw_set_font(Fnt_Main);
	draw_set_halign(noone);
	draw_set_valign(noone);

	if(charCount < string_length(text[page]))
	{
		if(voiceSpeed < voiceDelay)
			voiceSpeed++
		else
			{
				voiceSpeed = irandom_range(0, 3);
				audio_play_sound(voice[voiceSpeed], 10, false);
			}
		charCount += 0.4;
		faceSpeed += 0.1;
		if(faceSpeed >= sprite_get_number(face[pessoa])) {
			faceSpeed = 0;
		}
	}
	textPart = string_copy(text[page], 1, charCount);

	draw_text_ext_transformed_color(x + 55, y + 112, name[pessoa], stringHeight, boxWidth * 1.7, 0.45, 0.45, 0, c_yellow, c_yellow, c_yellow, c_yellow, 100);
	draw_text_ext_transformed_color(x + 55, y + 122, textPart, stringHeight, boxWidth * 1.7, 0.45, 0.45, 0, c_white, c_white, c_white, c_white, 100);
}
