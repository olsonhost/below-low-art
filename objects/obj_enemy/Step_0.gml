vsp = vsp + grv;
// Don't walk off edges
if (grounded) && (afraidofheights) && (!place_meeting(x+hsp,y+1,obj_wall))
{
	hsp = -hsp;	
	
}

// Horizontal Collision

// If Enemy is horizonally about to hit a wall
if (place_meeting(x+hsp, y, obj_wall))
{
	// incrementally creep up to the wall
	while(!place_meeting(x+sign(hsp),y,obj_wall))
	{
		x = x + sign(hsp)
	}
	// Then set the horizontal speed to zero
	hsp = -hsp;
	
}

// If Enemy is horizonally about to hit a crateX
if (place_meeting(x+hsp, y, obj_crateX))
{
	// incrementally creep up to the wall
	while(!place_meeting(x+sign(hsp),y,obj_crateX))
	{
		x = x + sign(hsp)
	}
	// Then set the horizontal speed to zero
	hsp = -hsp;
	
}

x = x + hsp;


// Vertical Collision

// If Enemy is vertically about to hit something
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

y = y + vsp;

// Animation

if (!place_meeting(x, y+1, obj_wall)) 
{
	grounded = false;
	sprite_index = sEnemyAir;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
}
else 
{
	grounded = true;
	image_speed = 1;
	if (hsp == 0) {
		sprite_index = sEnemy;	
	} else {
		sprite_index = sEnemyRun;	
	}

}
if (hsp != 0) image_xscale = sign(hsp) * size;
image_yscale = size;
