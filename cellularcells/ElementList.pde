static abstract class General
{
  static final int ElementCount = 10;
}

static abstract class Elements
{
  static final int AIR    = 0;
  static final int SAND   = 1;
  static final int WATER  = 2;
  static final int GAS    = 3;
  static final int FIRE   = 4;
  static final int POWDER = 5;
  static final int STONE  = 6;
  static final int SPARK  = 7;
  static final int PLANT  = 8;
  static final int ACID   = 9;
}

static abstract class Weights
{
  static final int AIR    = 0;
  static final int SAND   = 10;
  static final int WATER  = 5;
  static final int GAS    = 2;
  static final int FIRE   = 1;
  static final int POWDER = 3;
  static final int STONE  = 20;
  static final int SPARK  = 1;
  static final int PLANT  = 6;
  static final int ACID   = 5;
}

static abstract class Colors
{
  static final int AIR    = 0xFF000000;
  static final int SAND   = 0xFFFFFF00;
  static final int WATER  = 0xFF0000FF;
  static final int GAS    = 0xFF00FF66;
  static final int FIRE   = 0xFFFF0000;
  static final int POWDER = 0xFFFFFFAA;
  static final int STONE  = 0xFF888888;
  static final int SPARK  = 0xFFFFAA00;
  static final int PLANT  = 0xFF00FF00;
  static final int ACID   = 0xFF66FF88;
}

static abstract class Strengths
{
    static final int AIR    = 1000;
    static final int SAND   = 10;
    static final int WATER  = 1;
    static final int GAS    = 1000;
    static final int FIRE   = 1000;
    static final int POWDER = 10;
    static final int STONE  = 100;
    static final int SPARK  = 1000;
    static final int PLANT  = 50;
    static final int ACID   = 1000;
}

static abstract class Properties
{
  static final int Weight = 0;
  static final int Color = 1;
  static final int Strength = 2;
  static final int[][] ElementProperties = new int[][]
    {
    {Weights.AIR, Colors.AIR}, 
    {Weights.SAND, Colors.SAND}, 
    {Weights.WATER, Colors.WATER}, 
    {Weights.GAS, Colors.GAS}, 
    {Weights.FIRE, Colors.FIRE}, 
    {Weights.POWDER, Colors.POWDER}, 
    {Weights.STONE, Colors.STONE}, 
    {Weights.SPARK, Colors.SPARK}, 
    {Weights.PLANT, Colors.PLANT}, 
    {Weights.ACID, Colors.ACID},
  };

  static final String[] ElementNames = new String[]
    {
    "AIR", 
    "SAND", 
    "WATER", 
    "GAS", 
    "FIRE", 
    "POWDER", 
    "STONE", 
    "SPARK", 
    "PLANT", 
    "ACID",
  };
}
