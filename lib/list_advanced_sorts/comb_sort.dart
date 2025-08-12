/// 🐓 Comb Sort (O(n^2) worst, O(n log n) best)
///
/// Sorts the list [arr] in-place using comb sort.
void combSort<T extends Comparable>(List<T> arr) {
  int n = arr.length;
  int gap = n;
  bool swapped = true;
  double shrink = 1.3;
  while (gap > 1 || swapped) {
    gap = (gap ~/ shrink).toInt();
    if (gap < 1) gap = 1;
    swapped = false;
    for (int i = 0; i + gap < n; i++) {
      if (arr[i].compareTo(arr[i + gap]) > 0) {
        final tmp = arr[i];
        arr[i] = arr[i + gap];
        arr[i + gap] = tmp;
        swapped = true;
      }
    }
  }
}
