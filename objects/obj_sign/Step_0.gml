if (instance_exists(oBon)) && (point_in_circle(oBon.x,oBon.y,x,y,64)) && (!instance_exists(obj_text))
{
	nearby = true;
	if (keyboard_check_pressed(ord("W")))
	{
		with (instance_create_layer(x,y-64,layer,obj_text))
		{
			text = other.text;
			length = string_length(text);
		}
	
		with (obj_camera)
		{
			follow = other.id;	
		}
	}
}else nearby = false;