class Water extends Cell
{
  Water()
  {
    weight = Weights.WATER;
    type = Elements.WATER;
    c = Colors.WATER;
    strength = Strengths.WATER;
    isFluid = true;
  }

  void Update(Grid g, int x, int y)
  {
    CheckStrength(x,y,g);
    if (y < g.gridSize-1)
    {
      if (g.getBottom(x, y).weight < weight && !g.getBottom(x,y).staticCell)
      {
        g.Swap(x, y, x, y+1);
      } else if (g.getBottomLeft(x, y).weight < weight && !g.getBottomLeft(x,y).staticCell && g.getBottom(x,y).isFluid)
      {
        g.Swap(x, y, x-1, y+1);
      } else if (g.getBottomRight(x, y).weight < weight && !g.getBottomRight(x,y).staticCell && g.getBottom(x,y).isFluid)
      {
        g.Swap(x, y, x+1, y+1);
      } else {
        dMove(g, x, y);
      }
    } else
    {
      dMove(g, x, y);
    }
  }

  void dMove(Grid g, int x, int y)
  {
    if (random(0, 1) < 0.5)
    {
      if (g.getLeft(x, y).type == Elements.AIR)
      {
        g.Swap(x, y, x-1, y);
      }
    } else
    {
      {
        if (g.getRight(x, y).type == Elements.AIR)
        {
          g.Swap(x, y, x+1, y);
        }
      }
    }
  }
}
