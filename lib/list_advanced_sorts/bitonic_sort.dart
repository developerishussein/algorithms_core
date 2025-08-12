/// 🔀 Bitonic Sort (O(n log^2 n)), for n = 2^k
///
/// Sorts the list [arr] in-place using bitonic sort. Only for lengths that are powers of 2.
void bitonicSort<T extends Comparable>(List<T> arr, {bool ascending = true}) {
  void bitonicMerge(int low, int cnt, bool dir) {
    if (cnt > 1) {
      int k = cnt ~/ 2;
      for (int i = low; i < low + k; i++) {
        if ((dir && arr[i].compareTo(arr[i + k]) > 0) ||
            (!dir && arr[i].compareTo(arr[i + k]) < 0)) {
          final tmp = arr[i];
          arr[i] = arr[i + k];
          arr[i + k] = tmp;
        }
      }
      bitonicMerge(low, k, dir);
      bitonicMerge(low + k, k, dir);
    }
  }

  void bitonicSortRec(int low, int cnt, bool dir) {
    if (cnt > 1) {
      int k = cnt ~/ 2;
      bitonicSortRec(low, k, true);
      bitonicSortRec(low + k, k, false);
      bitonicMerge(low, cnt, dir);
    }
  }

  bitonicSortRec(0, arr.length, ascending);
}
