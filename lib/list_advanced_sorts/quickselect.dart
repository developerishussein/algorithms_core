/// ⚡ Quickselect (k-th smallest, O(n) average)
///
/// Returns the k-th smallest element in [arr] (0-based index).
T quickselect<T extends Comparable>(List<T> arr, int k) {
  if (k < 0 || k >= arr.length) {
    throw ArgumentError('k is out of bounds');
  }
  int left = 0, right = arr.length - 1;
  while (left <= right) {
    int pivotIdx = left + (right - left) ~/ 2;
    T pivot = arr[pivotIdx];
    int i = left, j = right;
    while (i <= j) {
      while (arr[i].compareTo(pivot) < 0) {
        i++;
      }
      while (arr[j].compareTo(pivot) > 0) {
        j--;
      }
      if (i <= j) {
        final tmp = arr[i];
        arr[i] = arr[j];
        arr[j] = tmp;
        i++;
        j--;
      }
    }
    if (k <= j) {
      right = j;
    } else if (k >= i) {
      left = i;
    } else {
      return arr[k];
    }
  }
  return arr[k];
}
