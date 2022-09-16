class Slider
{
  int min, max, x, y, w;
  float val = 0.5;

  boolean selected = false;
  boolean MouseDown = false;

  Slider(int _x, int _y, int _min, int _max, int _w, float _v)
  {
    x = _x;
    y = _y;
    min = _min;
    max = _max;
    val = _v;
    w = _w;
  }

  void Update()
  {
    if (mousePressed)
    {
      if (!MouseDown)
      {
        MouseDown = true;
        if(mouseX > x+w*val-5 && mouseX < x+w*val+5 && mouseY > y-5 && mouseY < y+5)
        {
           selected = true; 
        }
      }
    } else
    {
      MouseDown = false;
      selected = false;
    }
    
    if(selected)
    {
      val = map(mouseX,x,x+w,0,1); 
      if(val > 1){val = 1;}
      if(val < 0){val = 0;}
    }
  }

  void show()
  {
    stroke(255);
    fill(255);
    strokeWeight(5);
    line(x, y, x+w, y);
    float woff = w*val;
    circle(x+woff, y, 10);
  }

  int getVal()
  {
    return (int)map(val, 0, 1, min, max);
  }
}
