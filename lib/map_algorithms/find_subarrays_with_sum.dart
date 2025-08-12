/// Find Subarrays with Given Sum using HashMap (prefix sum approach).
List<List<int>> findSubarraysWithSum(List<int> nums, int target) {
  final result = <List<int>>[];
  final sumToIndices = <int, List<int>>{
    0: [-1],
  };
  var sum = 0;
  for (var i = 0; i < nums.length; i++) {
    sum += nums[i];
    final rem = sum - target;
    if (sumToIndices.containsKey(rem)) {
      for (final start in sumToIndices[rem]!) {
        result.add([start + 1, i]);
      }
    }
    sumToIndices.putIfAbsent(sum, () => []).add(i);
  }
  return result;
}
