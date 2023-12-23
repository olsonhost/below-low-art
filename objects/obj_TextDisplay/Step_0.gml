// Step Event
if (display_duration > 0) {
    display_duration -= 1;

    // Fade out
    if (display_duration < fade_duration) {
        alpha = max(0, display_duration / fade_duration);
    }
}








