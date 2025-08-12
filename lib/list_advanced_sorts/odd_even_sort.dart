/// 🟣 Odd-Even Sort (Brick Sort, O(n^2) worst)
///
/// Sorts the list [arr] in-place using odd-even sort.
void oddEvenSort<T extends Comparable>(List<T> arr) {
  int n = arr.length;
  bool sorted = false;
  while (!sorted) {
    sorted = true;
    for (int i = 1; i < n - 1; i += 2) {
      if (arr[i].compareTo(arr[i + 1]) > 0) {
        final tmp = arr[i];
        arr[i] = arr[i + 1];
        arr[i + 1] = tmp;
        sorted = false;
      }
    }
    for (int i = 0; i < n - 1; i += 2) {
      if (arr[i].compareTo(arr[i + 1]) > 0) {
        final tmp = arr[i];
        arr[i] = arr[i + 1];
        arr[i + 1] = tmp;
        sorted = false;
      }
    }
  }
}
