class Cell
{
  int weight = Weights.AIR; //weight for gravity based cells
  int type = Elements.AIR; //type
  color c = Colors.AIR; //color
  boolean staticCell = false; //affected by weight?
  boolean burnable = false; //affected by fire/spark?
  int strength = 0; //life against acid
  boolean immortal = false; //immortal against acid
  boolean isFluid = false; //for checking diagonal gaps
  void Update(Grid g, int x, int y) {
  };

  void tryBurn(int x, int y, Grid g)
  {
    if (g.getBottom(x, y).type == Elements.FIRE ||
      g.getTop(x, y).type == Elements.FIRE ||
      g.getLeft(x, y).type == Elements.FIRE ||
      g.getRight(x, y).type == Elements.FIRE ||
      g.getBottomLeft(x, y).type == Elements.FIRE ||
      g.getBottomRight(x, y).type == Elements.FIRE ||
      g.getTopLeft(x, y).type == Elements.FIRE ||
      g.getTopRight(x, y).type == Elements.FIRE ||
      g.getBottom(x, y).type == Elements.SPARK ||
      g.getTop(x, y).type == Elements.SPARK ||
      g.getLeft(x, y).type == Elements.SPARK ||
      g.getRight(x, y).type == Elements.SPARK ||
      g.getBottomLeft(x, y).type == Elements.SPARK ||
      g.getBottomRight(x, y).type == Elements.SPARK ||
      g.getTopLeft(x, y).type == Elements.SPARK ||
      g.getTopRight(x, y).type == Elements.SPARK)
    {
      g.replaceCell(x, y, new Fire());
    }
  }
  
  void CheckStrength(int x, int y, Grid g)
  {
   if (strength <= 0)
    {
      g.deleteCell(x, y);
    }  
  }
}
