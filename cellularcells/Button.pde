class Button
{
  int w, h, x, y, t;
  int buttonSelectPan = 10;
  boolean selected = false;

  Button(int x_, int y_, int w_, int h_, int t_)
  {
    x = x_;
    y = y_;
    h = h_;
    w = w_;
    t = t_;

    if (t == grid.selectedCell)
    {
      selected = true;
    }
  }

  void show()
  {
    fill(0);
    stroke(Properties.ElementProperties[t][Properties.Color]);
    if (Properties.ElementProperties[t][Properties.Color] == 0xFF000000)
    {
      stroke(255);
    }
    rect(x, y, w, h);
    fill(Properties.ElementProperties[t][Properties.Color]);
    if (Properties.ElementProperties[t][Properties.Color] == 0xFF000000)
    {
      fill(255);
    }
    text(Properties.ElementNames[t], x+w/2, y+h/2);

    if (selected)
    {
      noFill();
      stroke(Properties.ElementProperties[t][Properties.Color]);
      if (Properties.ElementProperties[t][Properties.Color] == 0xFF000000)
      {
        stroke(255);
      }
      rect(x-buttonSelectPan, y-buttonSelectPan, w+buttonSelectPan*2, h+buttonSelectPan*2);
    }
  }

  void CheckPressed()
  {
    if (mousePressed)
    {
      if (mouseButton == LEFT)
      {
        if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h)
        {
          selected = true;
          grid.selectedCell = t;
        } else
        {
          if (mouseX > grid.gridSize*grid.cellsize && mouseY < height/3)
          {
            selected = false;
          }
        }
      }
    }
  }
}
