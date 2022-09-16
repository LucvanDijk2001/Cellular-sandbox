class Gas extends Cell
{
  int upreset = 2;
  int up = upreset;

  int lifeTime = (int)random(900,1100);
  Gas()
  {
    weight = Weights.GAS;
    type = Elements.GAS;
    c = Colors.GAS;
    strength = Strengths.GAS;
    burnable = true;
    immortal = true;
    isFluid = true;
  }

  void Update(Grid g, int x, int y)
  {
    if (lifeTime > 0)
    {
      tryBurn(x,y,g);

      lifeTime--;
      if (y > 0)
      {
        if (g.getTop(x, y).weight < weight && up <= 0 && !g.getTop(x, y).staticCell)
        {
          g.Swap(x, y, x, y-1);
          up = upreset;
        } else if (g.getTopLeft(x, y).weight < weight && up <= 0 && !g.getTopLeft(x, y).staticCell && g.getTop(x,y).isFluid)
        {
          g.Swap(x, y, x-1, y-1);
          up = upreset;
        } else if (g.getTopRight(x, y).weight < weight && up <= 0 && !g.getTopRight(x, y).staticCell && g.getTop(x,y).isFluid)
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
