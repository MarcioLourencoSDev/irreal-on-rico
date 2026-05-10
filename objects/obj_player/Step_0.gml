#region buttons

ky_y = keyboard_check(vk_up) || keyboard_check(vk_down) ? keyboard_check(vk_down) - keyboard_check(vk_up):
keyboard_check(ord("S")) - keyboard_check(ord("W")); // Movimento Vertical

ky_x = keyboard_check(vk_right) || keyboard_check(vk_left) ? keyboard_check(vk_right) - keyboard_check(vk_left):
keyboard_check(ord("D")) - keyboard_check(ord("A")); // Movimento Horizontal

// Interação
ky_shift = keyboard_check(vk_shift);
#endregion

#region states_action
switch(estado_atual){
	case states.idle:
	
		sprite_index = spr_elen_idle;
		if(ky_x != 0 || ky_y != 0) estado_atual = states.walk;
		break;
		
	case states.walk:
		
		y += ky_y;
		x += ky_x;
		sprite_index = spr_elen_walk;
		if(ky_x == 0 && ky_y == 0) estado_atual = states.idle;
		break;
		
	case states.push:
	
		// Mexendo a caixa e o objeto do Player
		collision_caixa.x += ky_x;
		x += ky_x;
		
		collision_caixa.y += ky_y;
		y += ky_y;
		
		// Sprite
		if(ky_y != 0){
			sprite_index = spr_elen_walk;
		}
		
		// Se está apos o centro, ele empurra pra cá <--
		else if(x > obj_caixa.x){
			image_xscale = -1;
			sprite_index = spr_elen_push;
		}
		
		// Se está antes do centro, ele empurra pra cá -->
		else if( x < obj_caixa.x){
			image_xscale = 1;
			sprite_index = spr_elen_push;
		}
		
		// Se ele para de colidir com a caixa ou solta o shift: ele vai pro estado parado
		if(!place_meeting(x,y, obj_caixa) || !ky_shift) estado_atual = states.idle;
		break;
}
#endregion

// (TEMPORARIO) se você bater na mesa: volta pro x antes de bater
if(place_meeting(x,y, obj_mesa)){
	y = yprevious;
	x = xprevious;
}

#region collisions
// (TEMPORARIO) colidiu com a Helen --> jogo reinicia
if(place_meeting(x,y, obj_helen)){
	game_restart();
}

// COLISÂO COM A CAIXA ( X )

// Se estiver segurando shift: empurro a caixa no eixo x, senão: volto x
if(place_meeting(x + ky_x,y, obj_caixa)){
	if(ky_shift){
		collision_caixa = instance_place(x + ky_x,y, obj_caixa);
		estado_atual = states.push;
	} else{
		x = xprevious;
		
	}
}

// COLISÃO COM A CAIXA ( Y )
if(place_meeting(x,y + ky_y, obj_caixa)){
	
	// Se estiver segurando shift: empurro a caixa no eixo y, senão: volto y
	if(ky_shift){
		collision_caixa = instance_place(x, y + ky_y, obj_caixa);
		estado_atual = states.push;
	} else{
		y = yprevious;
		
	}
}
#endregion