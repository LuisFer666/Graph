// CTRL+SHIFT+B for run with tasks in Visual Studio Code
Grafica g;
Grafica g2;
Grafica g3;

void setup(){
  size(800,600);
  g = new Grafica(10, 10, 500,500);
  g.setValues(new float[]{5.5, 6.6, 7.7, 8.2, 0.5, 1.2});

  g2 = new Grafica(520, 10, 200, 200);
  g2.setValues(new float[]{1.2, 7.7, 12, 9.07});

  g3 = new Grafica(520, 240, 200, 200);
  g3.setValues(new float[]{5.5, 8.5, 2.3});
}

void draw(){
  background(255);
  g.draw();
  g2.draw();
  g3.draw();
}
