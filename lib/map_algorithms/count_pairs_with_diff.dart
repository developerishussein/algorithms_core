/// Counting Pairs with Specific Difference.
int countPairsWithDiff(List<int> nums, int diff) {
  final set = nums.toSet();
  var count = 0;
  for (final num in set) {
    if (set.contains(num + diff)) count++;
  }
  return count;
}
