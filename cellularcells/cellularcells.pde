Grid grid;
Menu menu;
void setup()
{
  size(1200, 800);
  background(0);
  grid = new Grid();
  menu = new Menu();
  noStroke();
  
}

void draw()
{
  background(0);
  textAlign(CENTER,CENTER);
  grid.show();
  grid.Update();
  
  menu.show();
  menu.Update();
}
