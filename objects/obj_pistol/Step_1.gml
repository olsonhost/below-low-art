if (!instance_exists(oBon)) return;

x = oBon.x;
y = oBon.y+10;

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
	audio_play_sound(snd_shot,5,false);

	with (instance_create_layer(x,y,"Bullets",obj_bullet)) 
	{
		speed = 25;
		direction = other.image_angle + random_range(-3,3);
		image_angle = direction;
	}
}

recoil = max(0, recoil - 1);

x = x - lengthdir_x(recoil, image_angle);
y = y - lengthdir_y(recoil, image_angle);

if(image_angle > 90) && (image_angle < 270)
{
	image_yscale = -1;
}
else
{
	image_yscale = 1;
}
	




