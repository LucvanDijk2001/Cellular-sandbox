class Sand extends Cell
{
  Sand()
  {
    weight = Weights.SAND;
    type = Elements.SAND;
    c = Colors.SAND;
    strength = Strengths.SAND;
  }

  void Update(Grid g, int x, int y)
  {
    CheckStrength(x,y,g);
    if (y < g.gridSize-1)
    {
      if (g.getBottom(x, y).weight < weight && !g.getBottom(x,y).staticCell)
      {
        g.Swap(x, y, x, y+1);
      } else if (g.getBottomLeft(x, y).weight < weight && !g.getBottomLeft(x,y).staticCell)
      {
        g.Swap(x, y, x-1, y+1);
      } else if (g.getBottomRight(x, y).weight < weight && !g.getBottomRight(x,y).staticCell)
      {
        g.Swap(x, y, x+1, y+1);
      }
    }
  }
}
