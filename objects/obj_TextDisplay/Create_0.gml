// Create Event
display_text = "Your text here";
display_duration = 5 * room_speed; // 5 seconds
fade_duration = 1 * room_speed; // 1 second for fade out
alpha = 1; // Initial alpha value


show_debug_message(display_text);
audio_play_sound(snDeath,5,false);
