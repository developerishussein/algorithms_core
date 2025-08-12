/// 🧩 Sudoku Solver (Backtracking)
///
/// Solves the given 9x9 Sudoku board in-place. Empty cells are denoted by '.'.
/// Returns true if a solution exists.
bool solveSudoku(List<List<String>> board) {
  bool isValid(int row, int col, String c) {
    for (int i = 0; i < 9; i++) {
      if (board[row][i] == c || board[i][col] == c) return false;
      int boxRow = 3 * (row ~/ 3) + i ~/ 3;
      int boxCol = 3 * (col ~/ 3) + i % 3;
      if (board[boxRow][boxCol] == c) return false;
    }
    return true;
  }

  bool backtrack() {
    for (int row = 0; row < 9; row++) {
      for (int col = 0; col < 9; col++) {
        if (board[row][col] == '.') {
          for (int d = 1; d <= 9; d++) {
            String c = d.toString();
            if (isValid(row, col, c)) {
              board[row][col] = c;
              if (backtrack()) return true;
              board[row][col] = '.';
            }
          }
          return false;
        }
      }
    }
    return true;
  }

  return backtrack();
}
