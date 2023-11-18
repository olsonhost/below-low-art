/// @desc Footsteps!
if (sprite_index == sBonR) {


	var currentRoom;

	currentRoom = room_get_name(room);
	
	switch (currentRoom) {
	
		case "Room1":
		case "Room1a":
			audio_play_sound(choose(snFoot1,snFoot2,snFoot3,snFoot4),1,false);
			break;

		case "Room2": // Cavern footsteps
		//case "Room3": // Cavern footsteps
			audio_play_sound(choose(snFoot1,snFoot2,snFoot3,snFoot4),1,false);
			break;

		//case "Doomcock": // Echo footsteps


		//case "WhateverThatLandIsCalled": // Glass Breaking footsteps


		//case "IndoorsInThatLandPalaceThing": // ?? footsteps


		default: // Indoors footsteps
			audio_play_sound(choose(snIndoorFoot1,snIndoorFoot2,snIndoorFoot3,snIndoorFoot4),1,false);
			
	}



}