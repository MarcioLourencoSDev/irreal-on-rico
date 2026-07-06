// Se o Player estiver me empurrando, atribui velocidade
if(obj_player.estado_atual == states.push && obj_player.collision_caixa == id){
	var ky_x = obj_player.ky_x;
	var ky_y = obj_player.ky_y;
} else{
	var ky_x = 0;
	var ky_y = 0;
}

// Se vou entrar dentro de uma mesa ou helen, analiso x
if(place_meeting(x + ky_x , y, [obj_mesa, obj_helen])){
	// Adicionando pixel a pixel
	if(!place_meeting(x + sign(ky_x), y, [obj_mesa, obj_helen])){
		x += sign(ky_x)
		obj_player.x += sign(ky_x);
	} else {
		ky_x = 0;
	}
}

// Se vou entrar dentro de uma mesa ou helen, analiso Y
if(place_meeting(x , y + ky_y, [obj_mesa, obj_helen])){
	// adicionando pixel a pixel
	if(!place_meeting(x, y + sign(ky_y), [obj_mesa, obj_helen])){
		y += sign(ky_y)
		obj_player.y += sign(ky_y);
	} else {
		ky_y = 0;
	}
}

// Se não irei entrar dentro de uma mesa = Ando x.
if(!knocked_x && ky_x != 0){
	x += ky_x;
	obj_player.x += ky_x;
}

// Se não irei entrar dentro de uma mesa = Ando y.
if(!knocked_y && ky_y != 0){
	y += ky_y;
	obj_player.y += ky_y;
}


