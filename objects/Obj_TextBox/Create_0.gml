if(instance_exists(Obj_Player))
	Player = Obj_Player;
else
	Player = Obj_Player_Lucia;


text = "Isso é um eater egg seu abestado";

depth = 0;

x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]);
camera_set_view_speed(view_camera[0], 0, 0);

if(instance_exists(Player))
	Player.SpdPlayer = 0;

page = 0;
creator = noone;
charCount = 0;

voice = 0;
voiceSpeed = 0;
voiceDelay = 7;

face[0] = noone;
face[1] = noone;

name[0] = noone;
name[1] = noone;

faceSpeed = 0;

pessoa = 0;
stringHeight = string_height(text);
boxWidth = sprite_get_width(Spr_TextBox);
