#region // Get Player Input


// In the Step Event of the object you want to check

// See if the mouse is in a good position to move the player
var distanceToMouse;
var ok = false;
distanceToMouse = point_distance(x, y, mouse_x, mouse_y);

if ((distanceToMouse > 0) && (distanceToMouse < 500)) ok = true;


if (mouseWithinViewportEdge()) {
    // Mouse is within 100 pixels of the viewport edge
    //show_debug_message("Mouse is near the viewport edge!");
	ok = true;
}

if (ok) // was (hascontrol)
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

// See if you can use a parent object reference here instead of having to list all objects you can stand on

var currentRoom = room_get_name(room);


if ( (!place_meeting(x, y+1, obj_wall)) && (!place_meeting(x, y+1, obj_wallX)) && (!place_meeting(x, y+1, obj_crateX)) ) 
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
		

		switch (currentRoom) {
	
			case "Room1":
			case "Room1a":
				audio_sound_pitch(snLanding,random_range(0.9, 1.5));
				audio_play_sound(snLanding,1,false);
				break;

			case "Room2": // Cavern footsteps
			//case "Room3": // Cavern footsteps
				audio_sound_pitch(snLanding,random_range(0.9, 1.5));
				audio_play_sound(snLanding,1,false);
				break;

			//case "Doomcock": // Echo footsteps
			//case "WhateverThatLandIsCalled": // Glass Breaking footsteps
			//case "IndoorsInThatLandPalaceThing": // ?? footsteps


			default: // Indoors footsteps
				audio_play_sound(choose(snIndoorFoot1,snIndoorFoot2,snIndoorFoot3,snIndoorFoot4),1,false);

			
		}
		
	
	}
	image_speed = 1;
	if (hsp == 0) {
		sprite_index = sBon;	
	} else {
		sprite_index = sBonR;	
	}

}

//var currentRoom = room_get_name(room);

switch (currentRoom) {
	
	//case "Room1": // Town
	//case "Room1a": // Desert
	//case "Room2": // Cavern
	//case "Room3": // Cavern
	//case "Doomcock": // Echo footsteps
	//case "WhateverThatLandIsCalled": // Glass Breaking footsteps
	//case "IndoorsInThatLandPalaceThing": // ?? footsteps

	case "House1":
		if (hsp != 0) image_xscale = 3 * sign(hsp);
		break;
	default: // Indoors footsteps
		if (hsp != 0) image_xscale = sign(hsp);

			
}


