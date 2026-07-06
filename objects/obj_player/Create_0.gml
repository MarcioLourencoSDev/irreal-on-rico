#region variables

enum states{
	idle,
	walk,
	push
}

estado_atual = states.idle;


collision_caixa = noone; // Caixa que está colidindo

#endregion
#region methods

states_action = function(){
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
			// A movimentação do Player é feita na caixa
			
		
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
}
collision_with_table = function(){
	if(place_meeting(x,y, obj_mesa)){
		y = yprevious;
		x = xprevious;
	}
}

collision_with_helen = function(){
	// (TEMPORARIO) colidiu com a Helen --> jogo reinicia
	if(place_meeting(x,y, obj_helen)){
		game_restart();
	}
}

collision_with_box = function(){
	// COLISÂO COM A CAIXA ( X )

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
			if(collision_caixa.knocked_y) y = yprevious;
		} else{
			y = yprevious;
		
		}
	}
}
#endregion