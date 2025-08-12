/// Computes the Z-array for pattern matching in string [s] (Z-Algorithm).
///
/// The Z-array at position i is the length of the longest substring starting at i that is also a prefix of [s].
///
/// Returns a list of Z-values for each position in [s].
///
/// Time Complexity: O(n), where n is the length of [s].
///
/// Example:
/// ```dart
/// print(zAlgorithm("aabcaabxaaaz")); // [0, 1, 0, 0, 3, 1, 0, 0, 2, 1, 0, 0]
/// ```
List<int> zAlgorithm(String s) {
  final n = s.length;
  final z = List<int>.filled(n, 0);
  int l = 0, r = 0;
  for (int i = 1; i < n; i++) {
    if (i <= r) z[i] = z[i - l].clamp(0, r - i + 1);
    while (i + z[i] < n && s[z[i]] == s[i + z[i]]) {
      z[i]++;
    }
    if (i + z[i] - 1 > r) {
      l = i;
      r = i + z[i] - 1;
    }
  }
  return z;
}
