/// @description Set up camera

cam = view_camera[0];
follow = oBon;

view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;

x_to = xstart;
y_to = ystart;

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
buff = 32;





