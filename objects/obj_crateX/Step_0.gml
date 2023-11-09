vsp = vsp + grv;

if (vsp > max_grv) vsp = max_grv;

// You could maybe optimize this so it's not checking every step when vsp=0

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

// If Object is vertically about to hit a shootable wall
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

// If Object is vertically about to hit a shootable wall
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





