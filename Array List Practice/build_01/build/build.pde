Box[] boxes = new Box[100];
int count;
int area;
int cell;
void setup() {
	size(600, 600);
}
void draw() {
	background(0);
	for (int i = 0; i < boxes.length; i++) {
		boxes[i] = new Box(cord(i).x, cord(i).y, cell*.9, cell*.9);
	}
	if(mouseX)
}
PVector cord(int n) {
	count = 10;
	area  = count * count;
	cell  = width / count;
	int x = (n % count) * cell;
	int y = (n / count) * cell;
	PVector cord = new PVector(x, y);
	return  cord;
}