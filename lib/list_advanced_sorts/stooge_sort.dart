/// 🧙 Stooge Sort (O(n^{2.7095}))
///
/// Sorts the list [arr] in-place using stooge sort.
void stoogeSort<T extends Comparable>(List<T> arr, [int i = 0, int? j]) {
  j ??= arr.length - 1;
  if (i >= j) return;
  if (arr[i].compareTo(arr[j]) > 0) {
    final tmp = arr[i];
    arr[i] = arr[j];
    arr[j] = tmp;
  }
  if (j - i + 1 > 2) {
    int t = ((j - i + 1) ~/ 3);
    stoogeSort(arr, i, j - t);
    stoogeSort(arr, i + t, j);
    stoogeSort(arr, i, j - t);
  }
}
