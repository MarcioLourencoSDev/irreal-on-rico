#region buttons

ky_y = keyboard_check(vk_up) || keyboard_check(vk_down) ? keyboard_check(vk_down) - keyboard_check(vk_up):
keyboard_check(ord("S")) - keyboard_check(ord("W")); // Movimento Vertical

ky_x = keyboard_check(vk_right) || keyboard_check(vk_left) ? keyboard_check(vk_right) - keyboard_check(vk_left):
keyboard_check(ord("D")) - keyboard_check(ord("A")); // Movimento Horizontal

#endregion


y += ky_y;
x += ky_x;


#region configuração de sprites
if(ky_x != 0 || ky_y != 0) sprite_index = spr_elen_walk;
else sprite_index = spr_elen_idle;
#endregion


// (TEMPORARIO) se você bater na mesa: volta pro x antes de bater
if(place_meeting(x,y, obj_mesa)){
	y = yprevious;
	x = xprevious;
}

