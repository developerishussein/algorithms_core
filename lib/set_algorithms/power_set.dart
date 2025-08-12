/// Generates the power set (all subsets) of the input set.
///
/// This function returns a set containing all possible subsets of the input set [input].
///
/// Time Complexity: O(2^n), where n is the size of the input set.
/// Space Complexity: O(2^n)
///
/// Example:
/// ```dart
/// Set<Set<int>> result = powerSet({1, 2});
/// print(result); // Outputs: {{}, {1}, {2}, {1, 2}}
/// ```
Set<Set<T>> powerSet<T>(Set<T> input) {
  final list = input.toList();
  final result = <Set<T>>[<T>{}];
  for (var element in list) {
    final newSubsets = <Set<T>>[];
    for (final subset in result) {
      newSubsets.add({...subset, element});
    }
    result.addAll(newSubsets);
  }
  // Ensure the empty set is the first element
  result.removeWhere((s) => s.isEmpty);
  result.insert(0, <T>{});
  return result.toSet();
}
