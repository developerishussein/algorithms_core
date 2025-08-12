/// 💹 Maximum Product Subarray (O(n))
///
/// Returns the maximum product of a contiguous subarray in [nums].
double maxProductSubarray(List<double> nums) {
  if (nums.isEmpty) throw ArgumentError('Input list cannot be empty.');
  double maxProd = nums[0], minProd = nums[0], result = nums[0];
  for (int i = 1; i < nums.length; i++) {
    double tempMax = maxProd;
    maxProd = [
      nums[i],
      maxProd * nums[i],
      minProd * nums[i],
    ].reduce((a, b) => a > b ? a : b);
    minProd = [
      nums[i],
      tempMax * nums[i],
      minProd * nums[i],
    ].reduce((a, b) => a < b ? a : b);
    result = result > maxProd ? result : maxProd;
  }
  return result;
}
