import 'dart:math';

int randomInt(int max) => new Random().nextInt(max);

class Cell {
  int number;
  int row, column;
  bool empty = false;

  Cell(this.row, this.column);

  bool intersects(int row, int column) {
    if (this.row == row && this.column == column) {
      return true;
    }
    return false;
  }

  bool exchange(Cell cell) {
    var x = column;
    var y = row;
    row = cell.row;
    column = cell.column;
    cell.row = y;
    cell.column = x;
  }

  String toString() {
    if (empty) {
      return '       ';
    } else {
      if (number > 9) return '${number}(${row},${column})';
      else return ' ${number}(${row},${column})';
    }
  }
}

class Cells {
  List<Cell> list;

  Cells() {
    list = new List<Cell>();
  }

  void add(Cell cell) {
    list.add(cell);
  }

  Iterator get iterator => list.iterator;

  Cell cell(int n) {
    for (var cell in list) {
      if (cell.number == n) return cell;
    }
  }
}

class Puzzle {
  static final int MAX_LENGTH = 4;
  static final int EXCHANGE_LIMIT = 10000;
  int length;
  Cell emptyCell;
  Cells cells;
  int exchangeCount = 0;

  Puzzle(this.length) {
    if (length > MAX_LENGTH) {
      throw new Exception('Puzzle length must be less than ${MAX_LENGTH + 1}.');
    }
    cells = new Cells();
    var row = randomInt(length);
    var column = randomInt(length);
    emptyCell = new Cell(row, column);
    emptyCell.empty = true;
    cells.add(emptyCell);
    Cell cell;
    for (var row = 0; row < length; row++) {
      for (var column = 0; column < length; column++) {
        cell = getCell(row, column);
        if (cell == null) {
          cell = new Cell(row, column);
          cell.number = randomAvailableNumber(size);
          cells.add(cell);
        }
      }
    }
  }

  int get size => length * length;

  Cell getCell(int row, int column) {
    for (Cell cell in cells) {
      if (cell.intersects(row, column)) {
        return cell;
      }
    }
  }

  bool isNumberAvailable(int number) {
    for (Cell cell in cells) {
      if (cell != null && cell.number == number) {
        return false;
      }
    }
    return true;
  }

  int randomAvailableNumber(int max) {
    var number;
    do {
      number = randomInt(max);
    } while (!isNumberAvailable(number) || number == 0);
    return number;
  }

  bool get solved {
    var number = 0;
    var cell = getCell(length - 1, length - 1);
    if (!cell.empty) return false;
    for (var row = 0; row < length; row++) {
      for (var column = 0; column < length; column++) {
        cell = getCell(row, column);
        if (!cell.empty) {
          if (cell.number != ++number) {
            return false;
          }
        }
      }
    }
    return true;
  }

  solve() {
    if (!solved) {
      exchange();
    }
  }

  // replace with an optimized version: http://pub.dartlang.org/packages/a_star
  bool exchange() {
    var cell;
    do {
      var r = randomInt(4);
      switch (r) {
        case 0:
          cell = exchangeDown();
          break;
        case 1:
          cell = exchangeLeft();
          break;
        case 2:
          cell = exchangeUp();
          break;
        case 3:
          cell = exchangeRight();
          break;
      }
    } while (cell == null);
    exchangeCount++;
    display('');
    if (solved) {
      print('Solved after $exchangeCount exchanges.');
      return true;
    } else if (exchangeCount < EXCHANGE_LIMIT) {
      return exchange();
    } else {
      print('Stopped after $EXCHANGE_LIMIT exchanges.');
    }
  }

  Cell exchangeUp() {
    var upc = upCell();
    if (upc != null) {
      emptyCell.exchange(upc);
      return upc;
    }
  }

  Cell exchangeDown() {
    var downc = downCell();
    if (downc != null) {
      emptyCell.exchange(downc);
      return downc;
    }
  }

  Cell exchangeLeft() {
    var leftc = leftCell();
    if (leftc != null) {
      emptyCell.exchange(leftc);
      return leftc;
    }
  }

  Cell exchangeRight() {
    var rightc = rightCell();
    if (rightc != null) {
      emptyCell.exchange(rightc);
      return rightc;
    }
  }

  Cell upCell() {
    var row = emptyCell.row;
    var column = emptyCell.column;
    var upRow = row - 1;
    if (upRow >= 0) return getCell(upRow, column);
  }

  Cell downCell() {
    var row = emptyCell.row;
    var column = emptyCell.column;
    var downRow = row + 1;
    if (downRow <= length - 1) return getCell(downRow, column);
  }

  Cell leftCell() {
    var row = emptyCell.row;
    var column = emptyCell.column;
    var leftColumn = column - 1;
    if (leftColumn >= 0) return getCell(row, leftColumn);
  }

  Cell rightCell() {
    var row = emptyCell.row;
    var column = emptyCell.column;
    var rightColumn = column + 1;
    if (rightColumn <= length - 1) return getCell(row, rightColumn);
  }

  display(String title) {
    print(title);
    print('count: $exchangeCount');
    for (var row = 0; row < length; row++) {
      var line = '';
      for (var column = 0; column < length; column++) {
        var cell = getCell(row, column);
        line = '$line ${cell.toString()}';
      }
      print(line);
    }
    print('----------------');
  }
}

void main() {
  var puzzle = new Puzzle(2);
  puzzle.display('Start');
  puzzle.solve();
}