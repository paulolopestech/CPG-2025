//x = mouse_x;
//y = mouse_y;
// No evento Create ou Step
cursor_sprite = -1; // Remove o sprite do cursor
depth = 0;
window_set_cursor(cr_none); // Oculta o cursor padrão

x = clamp(mouse_x, 0, room_width);
y = clamp(mouse_y, 0, room_height);