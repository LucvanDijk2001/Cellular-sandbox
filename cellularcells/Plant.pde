class Plant extends Cell
{
  int fallReset = 2;
  int fall = 0;
  int buds = (int)random(0, 3);
  Plant()
  {
    weight = Weights.PLANT;
    type = Elements.PLANT;
    c = Colors.PLANT;
    strength = Strengths.PLANT;
    staticCell = true;
    burnable = true;
  }

  void Update(Grid g, int x, int y)
  {
    CheckStrength(x,y,g);
    
    tryBurn(x, y, g);
    if (buds > 0)
    {
      switch((int)random(2))
      {

      case 0:
        if (g.getTopLeft(x, y).type == Elements.WATER)
        {
          if (random(1) < 0.1)
          {
            g.replaceCell(x-1, y-1, new Plant());
            buds--;
          }
        }
        break;


      case 1:
        if (g.getTopRight(x, y).type == Elements.WATER)
        {
          if (random(1) < 0.1)
          {
            g.replaceCell(x+1, y-1, new Plant());
            buds--;
          }
        }
        break;
      }
    }
  }
}
