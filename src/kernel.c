#define VIDEO_MEM (char *) 0xb8000;
#define VIDEO_COLS 80
#define VIDEO_ROWS 25
void main() {
	char *vid_mem = VIDEO_MEM;
	char * str = "hello!";
	char color = 0xf;
	while (*str != 0) {
		vid_mem[0] = *str;
		vid_mem[2] = color;
		str++;
		vid_mem += 2;
	}
}
