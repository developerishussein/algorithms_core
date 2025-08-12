/// 🥞 Pancake Sort (O(n^2))
///
/// Sorts the list [arr] in-place using pancake sort.
void pancakeSort<T extends Comparable>(List<T> arr) {
  int n = arr.length;
  void flip(int k) {
    int i = 0, j = k;
    while (i < j) {
      final tmp = arr[i];
      arr[i] = arr[j];
      arr[j] = tmp;
      i++;
      j--;
    }
  }

  for (int currSize = n; currSize > 1; currSize--) {
    int maxIdx = 0;
    for (int i = 1; i < currSize; i++) {
      if (arr[i].compareTo(arr[maxIdx]) > 0) maxIdx = i;
    }
    if (maxIdx != currSize - 1) {
      flip(maxIdx);
      flip(currSize - 1);
    }
  }
}
