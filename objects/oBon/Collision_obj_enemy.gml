/// @desc Die
with (obj_gun) instance_destroy();

// switch to dead, and do the events (like Create)
instance_change(oBonDead, true);

direction = point_direction(other.x, other.y, x, y);

hsp = lengthdir_x(6,direction);
vsp = lengthdir_y(4,direction)-2;
if (sign(hsp) != 0) image_xscale = sign(hsp);




