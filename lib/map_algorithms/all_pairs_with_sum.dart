/// Find All Pairs with Given Sum using HashMap approach.
List<List<int>> allPairsWithSum(List<int> nums, int target) {
  final seen = <int, int>{};
  final result = <List<int>>[];
  for (final num in nums) {
    final complement = target - num;
    if (seen.containsKey(complement)) {
      result.add([complement, num]);
    }
    seen[num] = 1;
  }
  return result;
}
