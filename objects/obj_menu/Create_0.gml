/// @desc GUI/Vars/Menu Setup
#macro SAVEFILE "Save.sav"

gui_width = display_get_gui_width()
gui_height = display_get_gui_height()
gui_margin = 32;

menu_x = gui_width+200;
menu_y = gui_height - gui_margin;

menu_x_target = gui_width-gui_margin;
menu_speed = 25; //lower is faster
menu_font = fMenu;
menu_itemheight = font_get_size(menu_font);
menu_committed = -1;
menu_control = true;

menu[3] = "New Game";
menu[2] = "Continue";
menu[1] = "Story";
menu[0] = "Quit";

menu_items = array_length(menu);

menu_top = menu_y - ((menu_itemheight * 1.5) * menu_items);

menu_cursor = 3;