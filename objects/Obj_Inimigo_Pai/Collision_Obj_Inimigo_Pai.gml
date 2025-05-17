//empurra
var _dir = point_direction(other.x, other.y, x, y);
var _velh = lengthdir_x(1, _dir);
var _velv = lengthdir_x(1, _dir);

if(!place_meeting(x + _velh, y + _velv, Obj_Collider1)){
	x += _velh;
	y += _velv;
}