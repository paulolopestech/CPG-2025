
camera_set_view_speed(view_camera[0], 0, 0);
pessoa = page % 2;

if(keyboard_check_pressed(ord("E")) or keyboard_check_pressed(vk_space))
{
	faceSpeed = 0;
	if(charCount < string_length(text[page])) {
		charCount = string_length(text[page]);
	}
	else if(page + 1 < array_length(text)) {
		page += 1;	
		charCount = 0;
	}
	else {
		instance_destroy();
		camera_set_view_speed(view_camera[0], -1, -1);
		creator.alarm[1] = 1;
	}
}


