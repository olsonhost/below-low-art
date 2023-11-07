/// @description Update camera

// update destination
if (instance_exists(follow))
{
	x_to = follow.x;
	y_to = follow.y;
	
	if ((follow).object_index == oBonDead)
	{
		x = x_to;
		y = y_to; 
	}
}

// Update object position
x += (x_to - x) / 25;
y += (y_to - y) / 25;

x = clamp(x, view_w_half+buff,room_width-view_w_half-buff);
y = clamp(y, view_h_half+buff,room_height-view_h_half-buff);


// Screen shake
x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);
shake_remain = max(0, shake_remain-((1/shake_length)*shake_magnitude));


// Update camera view
camera_set_view_pos(cam,x-view_w_half,y-view_h_half);

if (room != rMenu) {


	if (layer_exists("Mountains")) 
	{
		//OR do mountains = layer_get_id("Mountains")	in create event
		layer_x("Mountains",x/2); // x alone would be still against camera (like max depth)
	}

	if (layer_exists("GhostTown")) 
	{
		layer_x("GhostTown",x/3); // closer to player than mountains
	}
	

	if (layer_exists("Trees")) 
	{
		layer_x("Trees",x/4); // closer to player than mountains
	}
	
	if (layer_exists("Background")) 
	{
		layer_x("Background",x); // still against camera (like max depth)
	}

}





