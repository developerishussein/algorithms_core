/// 🥔 Heap Sort (in-place, O(n log n))
///
/// Sorts the list [arr] in-place using heap sort.
void heapSort<T extends Comparable>(List<T> arr) {
  int n = arr.length;
  void heapify(int n, int i) {
    int largest = i;
    int l = 2 * i + 1;
    int r = 2 * i + 2;
    if (l < n && arr[l].compareTo(arr[largest]) > 0) largest = l;
    if (r < n && arr[r].compareTo(arr[largest]) > 0) largest = r;
    if (largest != i) {
      final tmp = arr[i];
      arr[i] = arr[largest];
      arr[largest] = tmp;
      heapify(n, largest);
    }
  }

  for (int i = n ~/ 2 - 1; i >= 0; i--) {
    heapify(n, i);
  }
  for (int i = n - 1; i > 0; i--) {
    final tmp = arr[0];
    arr[0] = arr[i];
    arr[i] = tmp;
    heapify(i, 0);
  }
}
