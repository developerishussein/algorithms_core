/// ➕ Combination Sum (Backtracking)
///
/// Returns all unique combinations in [candidates] where the numbers sum to [target].
/// Each number in [candidates] may be used unlimited times.
List<List<int>> combinationSum(List<int> candidates, int target) {
  List<List<int>> result = [];
  void backtrack(int start, int remain, List<int> path) {
    if (remain == 0) {
      result.add(List<int>.from(path));
      return;
    }
    for (int i = start; i < candidates.length; i++) {
      if (candidates[i] > remain) continue;
      path.add(candidates[i]);
      backtrack(i, remain - candidates[i], path);
      path.removeLast();
    }
  }

  backtrack(0, target, []);
  return result;
}
