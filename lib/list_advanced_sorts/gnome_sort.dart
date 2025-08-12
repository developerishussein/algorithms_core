/// 🦩 Gnome Sort (O(n^2) worst, O(n) best)
///
/// Sorts the list [arr] in-place using gnome sort.
void gnomeSort<T extends Comparable>(List<T> arr) {
  int n = arr.length;
  int i = 0;
  while (i < n) {
    if (i == 0 || arr[i - 1].compareTo(arr[i]) <= 0) {
      i++;
    } else {
      final tmp = arr[i];
      arr[i] = arr[i - 1];
      arr[i - 1] = tmp;
      i--;
    }
  }
}
