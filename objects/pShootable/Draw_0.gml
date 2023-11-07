draw_self();

if (flash1 > 0)
{
	flash1 --;
	shader_set(shWhite);
	draw_self();
	shader_reset();
}