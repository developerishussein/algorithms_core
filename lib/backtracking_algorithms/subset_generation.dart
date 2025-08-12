/// 🔢 Subset Generation (Backtracking)
///
/// Returns all possible subsets (the power set) of the given list [nums].
List<List<T>> subsets<T>(List<T> nums) {
  List<List<T>> result = [];
  void backtrack(int start, List<T> path) {
    result.add(List<T>.from(path));
    for (int i = start; i < nums.length; i++) {
      path.add(nums[i]);
      backtrack(i + 1, path);
      path.removeLast();
    }
  }

  backtrack(0, []);
  return result;
}
