class Spark extends Cell
{
  boolean moved = false;
  int t = 20;
  int lifeTime = (int)random(25,50);
  Spark()
  {
    weight = Weights.SPARK;
    type = Elements.SPARK;
    c = Colors.SPARK;
    strength = Strengths.SPARK;
    immortal = true;
  }

  void Update(Grid g, int x, int y)
  {
    if (lifeTime > 0)
    {
      int red = (c & 0x00FF0000) >> 16;
      int green = (c & 0x0000FF00) >> 8;
      int blue = (c & 0x000000FF) >> 0;
      green += 1;
      c = color(red, green, blue);

      lifeTime--;
      while (!moved && t > 0)
      {
        t--;
        int dir = (int)random(0, 8);
        switch(dir)
        {
        case 0:
          if (g.getLeft(x, y).type == Elements.AIR)
          {
            g.Swap(x, y, x-1, y);
          }
          break;

        case 1:
          if (g.getTopLeft(x, y).type == Elements.AIR)
          {
            g.Swap(x, y, x-1, y-1);
          }
          break;

        case 2:
          if (g.getTop(x, y).type == Elements.AIR)
          {
            g.Swap(x, y, x, y-1);
          }
          break;

        case 3:
          if (g.getTopRight(x, y).type == Elements.AIR)
          {
            g.Swap(x, y, x+1, y-1);
          }
          break;

        case 4:
          if (g.getRight(x, y).type == Elements.AIR)
          {
            g.Swap(x, y, x+1, y);
          }
          break;

        case 5:
          if (g.getBottomRight(x, y).type == Elements.AIR)
          {
            g.Swap(x, y, x+1, y+1);
          }
          break;

        case 6:
          if (g.getBottom(x, y).type == Elements.AIR)
          {
            g.Swap(x, y, x, y+1);
          }
          break;
        case 7:
          if (g.getBottomLeft(x, y).type == Elements.AIR)
          {
            g.Swap(x, y, x-1, y+1);
          }
          break;
        }
      }
      t = 20;
      moved = false;
    } else
    {
      g.deleteCell(x, y);
    }
  }
}
