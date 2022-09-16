class Powder extends Cell
{
  int fallReset = 2;
  int fall = 0;
  Powder()
  {
    weight = Weights.POWDER;
    type = Elements.POWDER;
    c = Colors.POWDER;
    strength = Strengths.POWDER;
    burnable = true;
  }

  void Update(Grid g, int x, int y)
  {
    CheckStrength(x,y,g);
    
    if (g.getBottom(x, y).type == Elements.WATER ||
      g.getTop(x, y).type == Elements.WATER ||
      g.getLeft(x, y).type == Elements.WATER ||
      g.getRight(x, y).type == Elements.WATER ||
      g.getBottomLeft(x, y).type == Elements.WATER ||
      g.getBottomRight(x, y).type == Elements.WATER ||
      g.getTopLeft(x, y).type == Elements.WATER ||
      g.getTopRight(x, y).type == Elements.WATER)
    {
      g.replaceCell(x, y, new Stone());
    }
    
    tryBurn(x,y,g);

    if (y < g.gridSize-1)
    {
      if (fall <= 0)
      {
        fall = fallReset;
        if (g.getBottom(x, y).weight < weight && !g.getBottom(x, y).staticCell)
        {
          g.Swap(x, y, x, y+1);
        } else if (g.getBottomLeft(x, y).weight < weight && !g.getBottomLeft(x, y).staticCell)
        {
          g.Swap(x, y, x-1, y+1);
        } else if (g.getBottomRight(x, y).weight < weight && !g.getBottomRight(x, y).staticCell)
        {
          g.Swap(x, y, x+1, y+1);
        }
      } else
      {
        fall --;
      }
    }
  }
}
