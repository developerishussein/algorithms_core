/// 🪣 Bucket Sort (O(n + k), for uniformly distributed data)
///
/// Sorts the list [arr] using bucket sort. Only for non-negative doubles.
void bucketSort(List<double> arr) {
  if (arr.isEmpty) return;
  final n = arr.length;
  final minValue = arr.reduce((a, b) => a < b ? a : b);
  final maxValue = arr.reduce((a, b) => a > b ? a : b);
  final bucketCount = n;
  final buckets = List.generate(bucketCount, (_) => <double>[]);
  final range = (maxValue - minValue) / bucketCount;
  for (final value in arr) {
    int idx = ((value - minValue) / (range == 0 ? 1 : range)).floor();
    if (idx == bucketCount) idx--;
    buckets[idx].add(value);
  }
  int k = 0;
  for (final bucket in buckets) {
    bucket.sort();
    for (final value in bucket) {
      arr[k++] = value;
    }
  }
}
