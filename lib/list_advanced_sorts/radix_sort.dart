/// 🧮 Radix Sort (LSD, O(nk) for k digits)
///
/// Sorts the list [arr] of non-negative integers using radix sort.
void radixSort(List<int> arr) {
  if (arr.isEmpty) return;
  int maxNum = arr.reduce((a, b) => a > b ? a : b);
  for (int exp = 1; maxNum ~/ exp > 0; exp *= 10) {
    final output = List<int>.filled(arr.length, 0);
    final count = List<int>.filled(10, 0);
    for (final num in arr) {
      count[(num ~/ exp) % 10]++;
    }
    for (int i = 1; i < 10; i++) {
      count[i] += count[i - 1];
    }
    for (int i = arr.length - 1; i >= 0; i--) {
      int idx = (arr[i] ~/ exp) % 10;
      output[count[idx] - 1] = arr[i];
      count[idx]--;
    }
    for (int i = 0; i < arr.length; i++) {
      arr[i] = output[i];
    }
  }
}
