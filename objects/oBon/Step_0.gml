#region // Get Player Input


// PROBLEM!! Trigger Areas stopped working!!


if (hascontrol)
{
	_key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	_key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	_key_jump = keyboard_check_pressed(vk_space);

	if (mouse_check_button(mb_right)) 
	{
		// Make the right mouse button be like a left or right key
		var _angle = point_direction(x,y,mouse_x,mouse_y);
	
		if(_angle > 100) && (_angle < 260)
		{
			_key_left = 1;
		}
		if(_angle < 80) || (_angle > 280)
		{
			_key_right = 1;
		}
		if(_angle < 120) && (_angle > 60)
		{
			_key_jump = 1;
		}
	
	}

	if (_key_left) || (_key_right) || (_key_jump)
	{
		controller = 0;
	}

	if (abs(gamepad_axis_value(0,gp_axislh)) > 0.2)
	{
		_key_left = abs(min(gamepad_axis_value(0,gp_axislh),0));
		_key_right = max(gamepad_axis_value(0,gp_axislh),0);
		controller = 0;
	
	}

	if (gamepad_button_check_pressed(0,gp_face1))
	{
		_key_jump = 1;
		controller = 1;
	}

} else {
	_key_jump = 0;
	_key_left = 0;
	_key_right = 0;
}

#endregion


// Calculate Movement

var _move = _key_right - _key_left;

hsp = _move * walksp;

vsp = vsp + grv;

// Jumping
canjump--;
if (canjump > 0) && (_key_jump) {

	vsp = jump; // -8?
	canjump = 0;

}


// Horizontal Collision

// If Bon is horizonally about to hit a wall
if (place_meeting(x + hsp, y, obj_wall))
{
	// incrementally creep up to the wall
	while(!place_meeting(x + sign(hsp), y, obj_wall))
	{
		x = x + sign(hsp)
	}
	// Then set the horizontal speed to zero
	hsp = 0;
	
}

// If Bon is horizonally about to hit a shootable wall
if (place_meeting(x + hsp, y, obj_wallX))
{
	// incrementally creep up to the wall
	while(!place_meeting(x + sign(hsp), y, obj_wallX))
	{
		x = x + sign(hsp)
	}
	// Then set the horizontal speed to zero
	hsp = 0;
	
}

// If Bon is horizonally about to hit a shootable wall
if (place_meeting(x + hsp, y, obj_crateX))
{
	// incrementally creep up to the wall
	while(!place_meeting(x + sign(hsp), y, obj_crateX))
	{
		x = x + sign(hsp)
	}
	// Then set the horizontal speed to zero
	hsp = 0;
	
}

x = x + hsp;


// Vertical Collision

// If Bon is vertically about to hit something
if (place_meeting(x, y+vsp, obj_wall))
{
	// incrementally creep up to the floor
	while(!place_meeting(x, y+sign(vsp),obj_wall))
	{
		y = y + sign(vsp);
	}
	// Then set the vertical speed to zero
	vsp = 0;
	
}

// If Bon is vertically about to hit a shootable wall
if (place_meeting(x, y+vsp, obj_wallX))
{
	// incrementally creep up to the floor
	while(!place_meeting(x, y+sign(vsp),obj_wallX))
	{
		y = y + sign(vsp);
	}
	// Then set the vertical speed to zero
	vsp = 0;
	
}

// If Bon is vertically about to hit a crate 
if (place_meeting(x, y+vsp, obj_crateX))
{
	// incrementally creep up to the floor
	while(!place_meeting(x, y+sign(vsp),obj_crateX))
	{
		y = y + sign(vsp);
	}
	// Then set the vertical speed to zero
	vsp = 0;
	
}

y = y + vsp;

// Animation

if ( (!place_meeting(x, y+1, obj_wall)) && (!place_meeting(x, y+1, obj_wallX))) 
{
	sprite_index = sBonA;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
}
else 
{
	canjump = 10;
	if(sprite_index == sBonA) 
	{
		//audio_sound_pitch(snLanding,random_range(0.5, 1.5);
		audio_sound_pitch(snLanding,choose(0.8, 1.0, 1.2));
		audio_play_sound(snLanding,6,false);
	}
	image_speed = 1;
	if (hsp == 0) {
		sprite_index = sBon;	
	} else {
		sprite_index = sBonR;	
	}

}
if (hsp != 0) image_xscale = sign(hsp);
