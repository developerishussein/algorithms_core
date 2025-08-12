/// 🔢 Combinations (Backtracking)
///
/// Returns all possible combinations of k numbers out of 1..n.
List<List<int>> combine(int n, int k) {
  List<List<int>> result = [];
  void backtrack(int start, List<int> path) {
    if (path.length == k) {
      result.add(List<int>.from(path));
      return;
    }
    for (int i = start; i <= n; i++) {
      path.add(i);
      backtrack(i + 1, path);
      path.removeLast();
    }
  }

  backtrack(1, []);
  return result;
}
