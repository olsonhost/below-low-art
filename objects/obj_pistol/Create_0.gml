firingdelay = 0;
recoil = 0;
controller_angle = 0;

view_x = view_xview[20]; // x-coordinate of the top-left corner of the view
view_y = view_yview[20]; // y-coordinate of the top-left corner of the view

// Collision Event with obj_TextDisplay
with (instance_create_layer(view_x, view_y, "Foreground", obj_TextDisplay)) {
    display_text = "You picked up a pistol!";
    display_duration = 5 * room_speed; // 5 seconds
    fade_duration = 1 * room_speed; // 1 second for fade out
    alpha = 1; // Initial alpha value
}