#region buttons

ky_y = keyboard_check(vk_up) || keyboard_check(vk_down) ? keyboard_check(vk_down) - keyboard_check(vk_up):
keyboard_check(ord("S")) - keyboard_check(ord("W")); // Movimento Vertical

ky_x = keyboard_check(vk_right) || keyboard_check(vk_left) ? keyboard_check(vk_right) - keyboard_check(vk_left):
keyboard_check(ord("D")) - keyboard_check(ord("A")); // Movimento Horizontal

// Interação
ky_shift = keyboard_check(vk_shift);
#endregion

states_action();


#region collisions

collision_with_table()

collision_with_helen();

collision_with_box();
#endregion