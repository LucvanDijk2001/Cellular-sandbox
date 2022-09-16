class Fire extends Cell
{
  int upreset = 2;
  int up = upreset;

  int lifeTime = (int)random(25,40);
  Fire()
  {
    weight = Weights.FIRE;
    type = Elements.FIRE;
    c = Colors.FIRE;
    strength = Strengths.FIRE;
    immortal = true;
    isFluid = true;
  }

  void Update(Grid g, int x, int y)
  {
    int red = (c & 0x00FF0000) >> 16;
    int green = (c & 0x0000FF00) >> 8;
    int blue = (c & 0x000000FF) >> 0;
    green += 10;
    c = color(red, green, blue);
    if (lifeTime > 0)
    {
      if (g.getBottom(x, y).type == Elements.WATER ||
        g.getTop(x, y).type == Elements.WATER ||
        g.getLeft(x, y).type == Elements.WATER ||
        g.getRight(x, y).type == Elements.WATER ||
        g.getBottomLeft(x, y).type == Elements.WATER ||
        g.getBottomRight(x, y).type == Elements.WATER ||
        g.getTopLeft(x, y).type == Elements.WATER ||
        g.getTopRight(x, y).type == Elements.WATER)
      {
        g.replaceCell(x, y, new Cell());
      }

      lifeTime--;
      if (y > 0)
      {
        if (g.getTop(x, y).weight < weight && up <= 0)
        {
          g.Swap(x, y, x, y-1);
          up = upreset;
        } else if (g.getTopLeft(x, y).weight < weight && up <= 0 && g.getTop(x,y).isFluid)
        {
          g.Swap(x, y, x-1, y-1);
          up = upreset;
        } else if (g.getTopRight(x, y).weight < weight && up <= 0 && g.getTop(x,y).isFluid)
        {
          g.Swap(x, y, x+1, y-1);
          up = upreset;
        } else {
          dMove(g, x, y);
        }

        up --;
      } else
      {
        dMove(g, x, y);
      }
    } else
    {
      g.deleteCell(x, y);
    }
  }

  void dMove(Grid g, int x, int y)
  {
    if (random(0, 1) < 0.5)
    {
      if (g.getLeft(x, y).weight < weight)
      {
        g.Swap(x, y, x-1, y);
      }
    } else
    {
      {
        if (g.getRight(x, y).weight < weight)
        {
          g.Swap(x, y, x+1, y);
        }
      }
    }
  }
}
