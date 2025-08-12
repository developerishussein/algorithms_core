/// ➕ Path Sum in Matrix (DFS, Generic)
///
/// Returns true if there is a path from (0,0) to (m-1,n-1) with sum equal to [target].
/// Works for any numeric type [T extends num].
///
/// - Time Complexity: O(m * n)
/// - Space Complexity: O(m * n) (due to recursion stack)
///
/// Example:
/// ```dart
/// var matrix = [
///   [1, 2],
///   [3, 4],
/// ];
/// hasPathSum(matrix, 8); // true (1→2→4→1)
/// ```
bool hasPathSum<T extends num>(List<List<T>> matrix, T target) {
  final m = matrix.length, n = matrix.isNotEmpty ? matrix[0].length : 0;
  if (m == 0 || n == 0) return false;
  bool dfs(int r, int c, T sum) {
    if (r < 0 || r >= m || c < 0 || c >= n) return false;
    sum = (sum + matrix[r][c]) as T;
    if (r == m - 1 && c == n - 1) return sum == target;
    return dfs(r + 1, c, sum) || dfs(r, c + 1, sum);
  }

  return dfs(0, 0, (0 as T));
}
