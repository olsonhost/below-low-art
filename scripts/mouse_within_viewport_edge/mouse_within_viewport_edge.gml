// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function mouseWithinViewportEdge(){
/// mouseWithinViewportEdge()

var margin = 100; // Set the margin value

// Convert mouse coordinates to GUI coordinates
var mouseX = device_mouse_x_to_gui(0);
var mouseY = device_mouse_y_to_gui(0);

// Get the viewport dimensions
var viewW = display_get_gui_width();
var viewH = display_get_gui_height();

// Check if the mouse is within the margin of the viewport edges
var withinX = (mouseX < margin || mouseX > viewW - margin);
var withinY = (mouseY < margin || mouseY > viewH - margin);

// Return true if the mouse is within the margin of any edge
return withinX || withinY;

}