class Circle {
  float x;
  float y;
  float r;
  color c;

  boolean growing = true;

  Circle(float x_, float y_) {
    x = x_;
    y = y_;
    r = 1;
    c = color(palette[(int)random(palette.length)]);
  }

  void grow() {
    if (growing) {
      r = r + 0.5;
    }
  }
  
  boolean edges() {
    return (x + r > width || x -  r < 0 || y + r > height || y -r < 0);
  }

  void show() {
    noStroke();
    fill(c);
    ellipse(x, y, r*2, r*2);
  }
}