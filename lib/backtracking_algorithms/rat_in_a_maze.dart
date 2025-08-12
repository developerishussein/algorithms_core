/// 🐀 Rat in a Maze (Backtracking)
///
/// Returns all possible paths for a rat to reach the bottom-right corner from the top-left in a grid.
/// 1 = open cell, 0 = blocked. Moves: D, L, R, U.
List<String> ratInMaze(List<List<int>> maze) {
  int n = maze.length;
  List<String> result = [];
  List<List<bool>> visited = List.generate(n, (_) => List.filled(n, false));
  void backtrack(int x, int y, String path) {
    if (x < 0 ||
        y < 0 ||
        x >= n ||
        y >= n ||
        maze[x][y] == 0 ||
        visited[x][y]) {
      return;
    }
    if (x == n - 1 && y == n - 1) {
      result.add(path);
      return;
    }
    visited[x][y] = true;
    backtrack(x + 1, y, '${path}D');
    backtrack(x, y - 1, '${path}L');
    backtrack(x, y + 1, '${path}R');
    backtrack(x - 1, y, '${path}U');
    visited[x][y] = false;
  }

  backtrack(0, 0, '');
  return result;
}
