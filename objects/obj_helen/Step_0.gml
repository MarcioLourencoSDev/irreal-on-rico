// Pego o angulo de onde estou para o player
var _dir = point_direction(x, y, obj_player.x, obj_player.y);

// Atribuo um valor baseado na direção (criando assim o movimento)


// Se o Player estiver parado ele corre 
if(obj_player.estado_atual == states.idle) {
	
	// Adiciona velocidade baseado no comprimento e direção do player
	x += lengthdir_x(1, _dir);
	y += lengthdir_y(1, _dir);
	

// Se estiver andando ele anda atrás
} else {
	
	x += lengthdir_x(0.5, _dir);
	y += lengthdir_y(0.5, _dir);
}

// Colisão temporaria com a mesa e caixa
if(place_meeting(x,y, [obj_mesa, obj_caixa])){ 
	sprite_index = spr_helen_idle;
	x = xprevious;
	y = yprevious;
} else sprite_index = spr_helen_walk;

//Se colidir com a caixa e o player tiver empurrando, ser empurrada pela caixa
if(place_meeting(x,y, obj_caixa) && obj_player.estado_atual == states.push){ 
	sprite_index = spr_helen_idle;
	x += obj_player.ky_x; // X do Helen acompanha o x da caixa
	y += obj_player.ky_y; // Y da Helen acompanha o y da caixa
} else sprite_index = spr_helen_walk;
	