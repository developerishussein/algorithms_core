/// 🏝️ Island Count (DFS)
///
/// Returns the number of islands (connected groups of '1's) in the grid using DFS.
int numIslandsDFS(List<List<String>> grid) {
  final m = grid.length, n = grid.isNotEmpty ? grid[0].length : 0;
  int count = 0;
  void dfs(int r, int c) {
    if (r < 0 || r >= m || c < 0 || c >= n || grid[r][c] != '1') return;
    grid[r][c] = '0';
    dfs(r + 1, c);
    dfs(r - 1, c);
    dfs(r, c + 1);
    dfs(r, c - 1);
  }

  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      if (grid[i][j] == '1') {
        count++;
        dfs(i, j);
      }
    }
  }
  return count;
}
