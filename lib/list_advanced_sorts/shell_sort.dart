/// 🐚 Shell Sort (O(n^2) worst, O(n log n) best)
///
/// Sorts the list [arr] in-place using shell sort.
void shellSort<T extends Comparable>(List<T> arr) {
  int n = arr.length;
  for (int gap = n ~/ 2; gap > 0; gap ~/= 2) {
    for (int i = gap; i < n; i++) {
      T temp = arr[i];
      int j = i;
      while (j >= gap && arr[j - gap].compareTo(temp) > 0) {
        arr[j] = arr[j - gap];
        j -= gap;
      }
      arr[j] = temp;
    }
  }
}
