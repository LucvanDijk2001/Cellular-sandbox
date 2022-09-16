class Grid
{
  int gridSize = 100;
  int cellsize = height/gridSize;
  Cell[][] cells = new Cell[gridSize][gridSize];
  Cell[][] copy = new Cell[gridSize][gridSize];

  int iterationSpeed = 1;

  float speed = 0.01;
  float ispeed = speed;

  int selectedCell = 0;
  int brushSize = 1;

  int lcx = 0;
  int lcy = 0;
  int lselectedCell = 0;

  Grid()
  {
    for (int x = 0; x < gridSize; x++)
    {
      for (int y = 0; y < gridSize; y++)
      {
        cells[x][y] = new Cell();
      }
    }
  }

  void Update()
  {
    if (mousePressed && mouseX < gridSize*cellsize)
    {
      grid.setCell();
    }

    ispeed-= 1/frameRate;
    if (ispeed <= 0)
    {
      ispeed += speed;
      for (int i = 0; i < iterationSpeed; i++)
      {
        if (i > 0)
        {
          if (mousePressed && mouseX < gridSize*cellsize)
          {
            setCell(lcx, lcy);
          }
        }
        grid.Iterate();
      }
    }
  }

  void setCell(int lcx, int lcy)
  {
    int cx = lcx;
    int cy = lcy;
    for (int i = 0; i < brushSize; i++)
    {
      for (int j = 0; j < brushSize; j++)
      {
        if (cx-(brushSize/2)+i >= 0 && cx-(brushSize/2)+i<= gridSize-1 && cy-(brushSize/2)+j >= 0 && cy-(brushSize/2)+j <= gridSize-1)
        {
          int xx = cx-(brushSize/2)+i;
          int yy = cy-(brushSize/2)+j;
          PlaceCell(xx, yy);
        }
      }
    }
  }

  void setCell()
  {
    int cx = (int)mouseX/cellsize; 
    int cy = (int)mouseY/cellsize;
    lcx = cx;
    lcy = cy;
    for (int i = 0; i < brushSize; i++)
    {
      for (int j = 0; j < brushSize; j++)
      {
        if (cx-(brushSize/2)+i >= 0 && cx-(brushSize/2)+i<= gridSize-1 && cy-(brushSize/2)+j >= 0 && cy-(brushSize/2)+j <= gridSize-1)
        {
          int xx = cx-(brushSize/2)+i;
          int yy = cy-(brushSize/2)+j;
          PlaceCell(xx, yy);
        }
      }
    }
  }

  private void PlaceCell(int xx, int yy)
  {
    switch(selectedCell)
    {
    case Elements.AIR:
      cells[xx][yy] = new Cell();
      break;

    case Elements.SAND:
      cells[xx][yy] = new Sand();
      break;

    case Elements.WATER:
      cells[xx][yy] = new Water();
      break;

    case Elements.GAS:
      cells[xx][yy] = new Gas();
      break;

    case Elements.FIRE:
      cells[xx][yy] = new Fire();
      break;

    case Elements.POWDER:
      cells[xx][yy] = new Powder();
      break;

    case Elements.STONE:
      cells[xx][yy] = new Stone();
      break;

    case Elements.SPARK:
      cells[xx][yy] = new Spark();
      break;

    case Elements.PLANT:
      cells[xx][yy] = new Plant();
      break;

    case Elements.ACID:
      cells[xx][yy] = new Acid();
      break;
    }
  }

  void deleteCell(int x, int y)
  {
    cells[x][y] = new Cell();
  }

  void replaceCell(int x, int y, Cell c)
  {
    cells[x][y] = c;
  }

  void show()
  {
    noStroke();
    colorMode(RGB);
    for (int x = 0; x < gridSize; x++)
    {
      for (int y = 0; y < gridSize; y++)
      {
        fill(cells[x][y].c);
        rect(x*cellsize, y*cellsize, cellsize, cellsize);
      }
    }
  }

  void Iterate()
  {
    for (int x = 0; x < gridSize; x++)
    {
      for (int y = 0; y < gridSize; y++)
      {
        copy[x][y] = cells[x][y];
      }
    }

    for (int x = 0; x < gridSize; x++)
    {
      for (int y = 0; y < gridSize; y++)
      {
        copy[x][y].Update(this, x, y);
      }
    }
  }

  void Swap(int x1, int y1, int x2, int y2)
  {
    Cell save = cells[x1][y1];
    cells[x1][y1] = cells[x2][y2];
    cells[x2][y2] = save;
  }

  Cell getBottom(int x, int y)
  {
    if (y < gridSize-1)
    {
      return copy[x][y+1];
    }
    return returnInvalid();
  }

  Cell getTop(int x, int y)
  {
    if (y > 0)
    {
      return copy[x][y-1];
    }
    return returnInvalid();
  }

  Cell getRight(int x, int y)
  {
    if (x < gridSize-1)
    {
      return copy[x+1][y];
    }
    return returnInvalid();
  }

  Cell getLeft(int x, int y)
  {
    if (x > 0)
    {
      return copy[x-1][y];
    }
    return returnInvalid();
  }

  Cell getBottomLeft(int x, int y)
  {
    if (x > 0 && y < gridSize-1)
    {
      return copy[x-1][y+1];
    }
    return returnInvalid();
  }

  Cell getBottomRight(int x, int y)
  {
    if (x < gridSize-1 && y < gridSize-1)
    {
      return copy[x+1][y+1];
    }
    return returnInvalid();
  }

  Cell getTopRight(int x, int y)
  {
    if (x < gridSize-1 && y > 0)
    {
      return copy[x+1][y-1];
    }
    return returnInvalid();
  }

  Cell getTopLeft(int x, int y)
  {
    if (x > 0 && y > 0)
    {
      return copy[x-1][y-1];
    }
    return returnInvalid();
  }

  Cell returnInvalid()
  {
    Cell c = new Cell();
    c.type = 1000;
    c.weight = 10000;
    return c;
  }
}
