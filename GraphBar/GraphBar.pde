// CTRL+SHIFT+B for run with tasks in Visual Studio Code
Grafica g;

void setup(){
  size(800,600);
  g = new Grafica(10, 10, 500,500);
  g.setValues(new float[]{5.5, 6.6, 7.7, 8.2, 0.5, 1.2});
}

void draw(){
  background(255);
  g.draw();
}
