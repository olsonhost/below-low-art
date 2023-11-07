if (done == 0) {
	vsp = vsp + grv;


	// Horizontal Collision

	// If Bon is horizonally about to hit a wall
	if (place_meeting(x+hsp, y, obj_wall))
	{
		// incrementally creep up to the wall
		while(!place_meeting(x+sign(hsp),y,obj_wall))
		{
			x = x + sign(hsp)
		}
		// Then set the horizontal speed to zero
		hsp = 0;
	
	}

	x = x + hsp;

	// Vertical Collision

	// If Bon is verticallyally about to hit something
	if (place_meeting(x, y+vsp, obj_wall))
	{
		if (vsp > 0) {
			done = 1;
			image_index = 1;	
			alarm[0] = 60;
		}	
		
		// incrementally creep up to the floor
		while(!place_meeting(x, y+sign(vsp),obj_wall))
		{
			y = y + sign(vsp);
		}
		// Then set the vertical speed to zero
		vsp = 0;
	
	}

	y = y + vsp;

}