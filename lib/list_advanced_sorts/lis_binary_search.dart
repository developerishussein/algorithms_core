/// 📈 Longest Increasing Subsequence (O(n log n), Binary Search)
///
/// Returns the length of the longest strictly increasing subsequence in [nums].
int lisBinarySearch(List<int> nums) {
  if (nums.isEmpty) return 0;
  final List<int> tails = [];
  for (final num in nums) {
    int left = 0, right = tails.length;
    while (left < right) {
      int mid = (left + right) >> 1;
      if (tails[mid] < num) {
        left = mid + 1;
      } else {
        right = mid;
      }
    }
    if (left == tails.length) {
      tails.add(num);
    } else {
      tails[left] = num;
    }
  }
  return tails.length;
}
