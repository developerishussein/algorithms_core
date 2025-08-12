/// 🔄 Cycle Sort (O(n^2), in-place, minimum writes)
///
/// Sorts the list [arr] in-place using cycle sort.
void cycleSort<T extends Comparable>(List<T> arr) {
  int n = arr.length;
  for (int cycleStart = 0; cycleStart < n - 1; cycleStart++) {
    T item = arr[cycleStart];
    int pos = cycleStart;
    for (int i = cycleStart + 1; i < n; i++) {
      if (arr[i].compareTo(item) < 0) pos++;
    }
    if (pos == cycleStart) continue;
    while (item.compareTo(arr[pos]) == 0) {
      pos++;
    }
    if (pos != cycleStart) {
      final tmp = arr[pos];
      arr[pos] = item;
      item = tmp;
    }
    while (pos != cycleStart) {
      pos = cycleStart;
      for (int i = cycleStart + 1; i < n; i++) {
        if (arr[i].compareTo(item) < 0) pos++;
      }
      while (item.compareTo(arr[pos]) == 0) {
        pos++;
      }
      if (item != arr[pos]) {
        final tmp = arr[pos];
        arr[pos] = item;
        item = tmp;
      }
    }
  }
}
