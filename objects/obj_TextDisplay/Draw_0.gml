// Draw Event
if (display_duration > 0) {
    // Calculate position at the center bottom of the view
    var xx = view_xview[0] + view_wview[0] / 2;
    var yy = view_yview[0] + view_hview[0];

    // Draw text
    draw_set_alpha(alpha);
    draw_text_transformed_color(xx, yy, display_text, 1, 1, 0, c_white, c_white, c_white, c_white, alpha);
    draw_set_alpha(1);
}

		//var col = c_white;
		//draw_set_color(col);
		//draw_text(xx,yy,txt);
