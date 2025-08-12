/// 🕳️ Pigeonhole Sort (O(n + Range))
///
/// Sorts the list [arr] of integers using pigeonhole sort.
void pigeonholeSort(List<int> arr) {
  if (arr.isEmpty) return;
  int minVal = arr.reduce((a, b) => a < b ? a : b);
  int maxVal = arr.reduce((a, b) => a > b ? a : b);
  int size = maxVal - minVal + 1;
  final holes = List<List<int>>.generate(size, (_) => []);
  for (final num in arr) {
    holes[num - minVal].add(num);
  }
  int idx = 0;
  for (final hole in holes) {
    for (final num in hole) {
      arr[idx++] = num;
    }
  }
}
