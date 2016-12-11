#define VIDEO_MEM (char *) 0xb8000;

void main() {
	char *vid_mem = VIDEO_MEM;
	*vid_mem = 'X';
}
