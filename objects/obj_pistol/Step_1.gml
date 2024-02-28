if (!instance_exists(oBon)) return;


var currentScale = 1;
switch (room_get_name(room)) {
	case "House1":
		currentScale = 3;
		break;
	default: // Indoors footsteps
		currentScale = 1;
}

// We don't wanna have both the pistol and the gun.
if (instance_exists(obj_gun)) 
	instance_destroy();

x = oBon.x;
y = oBon.y+0;

if (oBon.controller ==0) 
{
	image_angle = point_direction(x,y,mouse_x,mouse_y);
}
else
{
	var _controllerh = gamepad_axis_value(0,gp_axisrh);	
	var _controllerv = gamepad_axis_value(0,gp_axisrv);	
	if ((abs(_controllerh) > 0.2) || (abs(_controllerv) > 0.2))
	{
		controller_angle = point_direction(0,0,_controllerh,_controllerv)
	}
	image_angle = controller_angle;
}

firingdelay = firingdelay - 1;

if ((mouse_check_button(mb_left)) || gamepad_button_check(0,gp_shoulderrb)) && (firingdelay < 0)
{
	firingdelay = 60;
	recoil = 4;
	ScreenShake(2,10); // Camel (works) vs snake (error) ...
	//                    because sript name and function name can't be the same?
	audio_sound_pitch(snd_shot,choose(0.8, 1.0, 1.2));
	
	var currentRoom;

	currentRoom = room_get_name(room);
	
	switch (currentRoom) {
	
		case "Room1":
		case "Room1a":
			audio_play_sound(snd_shot, 5, false);
			break;

		case "Room2": // Cavern
			audio_play_sound(snd_shot1, 5, false);
			break;

		default: // Indoors
			audio_play_sound(snd_shot1, 5, false);
}
	
	
//	if (currentRoom == "Room1") {
//    audio_play_sound(sound1, 5, false);
//	} else if (currentRoom == "Room2") {
//    audio_play_sound(sound2, 5, false);
//	}
//	audio_play_sound(snd_shot,5,false);

	with (instance_create_layer(x,y,"Bullets",obj_bullet)) 
	{
		speed = 30;
		direction = other.image_angle + random_range(-3,3);
		image_angle = direction;
	}
}

recoil = max(0, recoil - 1);

x = x - lengthdir_x(recoil, image_angle);
y = y - lengthdir_y(recoil, image_angle);

image_xscale = currentScale * 1;

if(image_angle > 90) && (image_angle < 270)
{
	image_yscale = currentScale * -1;
}
else
{
	image_yscale = currentScale * 1;
}
	




