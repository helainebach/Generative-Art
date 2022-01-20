color[] palette = {#F04F32,#F3C91C,#1060B0,#EFF0F5,#252020};
color   fg      = palette[4];
color   bg      = palette[3];
int     rand    = (int)random(1000);
float   xoff, yoff;
void setup() {
    size(600, 600);
    rectMode(CENTER);
    strokeWeight(2);
    stroke(fg);
}
void draw() {
    background(bg);
    for (int i = 0; i < 15; i++) {
        randomSeed(i * rand);
        float w = random(100, 200);
        float h = random(20, 200);
        box(random(width), random(height), sin(i + xoff) * w , cos(i + yoff) * h , palette[(int)random(3)]);
    }
    xoff += .01 * random(1, 3);
    yoff += .01 * random(1, 3);
}
void box(float x, float y, float w, float h, color c) {
    pushMatrix();
    translate(x, y);
    fill(bg);
    rect(0, 0, w, h);
    fill(c);
    int s = 10;
    square(-w / 2, -h / 2, s);
    square( w / 2, -h / 2, s);
    square( w / 2,  h / 2, s);
    square(-w / 2,  h / 2, s);
    popMatrix();
}
void mousePressed() {
    rand++;
}