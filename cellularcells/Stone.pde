class Stone extends Cell
{
  Stone()
  {
    weight = Weights.STONE;
    type = Elements.STONE;
    c = Colors.STONE;
    strength = Strengths.STONE;
    staticCell = true;
  }

  void Update(Grid g, int x, int y)
  {
    CheckStrength(x,y,g);
  }
}
