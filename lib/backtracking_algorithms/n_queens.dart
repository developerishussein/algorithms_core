/// 👑 N-Queens Problem (Backtracking)
///
/// Returns all distinct solutions for the n-queens puzzle as a list of board states.
/// Each board state is represented as a list of strings, where 'Q' is a queen and '.' is empty.
List<List<String>> solveNQueens(int n) {
  if (n == 0) return [];
  List<List<String>> solutions = [];
  List<int> queens = List.filled(n, -1);
  Set<int> columns = {}, diag1 = {}, diag2 = {};

  void backtrack(int row) {
    if (row == n) {
      solutions.add(
        List.generate(n, (i) {
          String rowStr =
              List.generate(n, (j) => queens[i] == j ? 'Q' : '.').join();
          return rowStr;
        }),
      );
      return;
    }
    for (int col = 0; col < n; col++) {
      if (columns.contains(col) ||
          diag1.contains(row - col) ||
          diag2.contains(row + col)) {
        continue;
      }
      queens[row] = col;
      columns.add(col);
      diag1.add(row - col);
      diag2.add(row + col);
      backtrack(row + 1);
      columns.remove(col);
      diag1.remove(row - col);
      diag2.remove(row + col);
    }
  }

  backtrack(0);
  return solutions;
}
