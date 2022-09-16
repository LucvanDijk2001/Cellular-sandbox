class Acid extends Cell
{
  int lifeTime = (int)random(1500, 1800);
  Acid()
  {
    weight = Weights.ACID;
    type = Elements.ACID;
    c = Colors.ACID;
    strength = Strengths.ACID;
    immortal = true;
    isFluid = true;
  }

  void Update(Grid g, int x, int y)
  {
    if(lifeTime > 0)
    {
      lifeTime--; 
    }
    else
    {
     g.deleteCell(x,y); 
    }
    if (!g.getLeft(x, y).immortal)
    {
      g.getLeft(x, y).strength --;
    }
    if (!g.getTopLeft(x, y).immortal)
    {
      g.getTopLeft(x, y).strength --;
    }
    if (!g.getTop(x, y).immortal)
    {
      g.getTop(x, y).strength --;
    }
    if (!g.getTopRight(x, y).immortal)
    {
      g.getTopRight(x, y).strength --;
    }
    if (!g.getRight(x, y).immortal)
    {
      g.getRight(x, y).strength --;
    }
    if (!g.getBottomRight(x, y).immortal)
    {
      g.getBottomRight(x, y).strength --;
    }
    if (!g.getBottom(x, y).immortal)
    {
      g.getBottom(x, y).strength --;
    }
    if (!g.getBottomLeft(x, y).immortal)
    {
      g.getBottomLeft(x, y).strength --;
    }

    if (g.getBottom(x, y).type == Elements.WATER)
    {
      g.deleteCell(x, y);
      g.deleteCell(x, y+1);
    } else if (g.getBottomLeft(x, y).type == Elements.WATER)
    {
      g.deleteCell(x, y);
      g.deleteCell(x-1, y+1);
    } else if (g.getBottomRight(x, y).type == Elements.WATER)
    {
      g.deleteCell(x, y);
      g.deleteCell(x+1, y+1);
    }

    if (y < g.gridSize-1)
    {
      if (g.getBottom(x, y).weight < weight && !g.getBottom(x, y).staticCell)
      {
        g.Swap(x, y, x, y+1);
      } else if (g.getBottomLeft(x, y).weight < weight && !g.getBottomLeft(x, y).staticCell && g.getBottom(x,y).isFluid)
      {
        g.Swap(x, y, x-1, y+1);
      } else if (g.getBottomRight(x, y).weight < weight && !g.getBottomRight(x, y).staticCell && g.getBottom(x,y).isFluid)
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
    if (g.getLeft(x, y).type == Elements.WATER)
    {
      g.deleteCell(x, y);
      g.deleteCell(x-1, y);
    } else if (g.getRight(x, y).type == Elements.WATER)
    {
      g.deleteCell(x, y);
      g.deleteCell(x+1, y);
    } 
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
