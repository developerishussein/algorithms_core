/// Merge Two Maps with Conflict Resolution.
/// If a key exists in both, [conflict] is called with (key, aValue, bValue).
Map<K, V> mergeMaps<K, V>(
  Map<K, V> a,
  Map<K, V> b,
  V Function(K, V, V) conflict,
) {
  final result = Map<K, V>.from(a);
  b.forEach((k, v) {
    if (result.containsKey(k)) {
      result[k] = conflict(k, result[k] as V, v);
    } else {
      result[k] = v;
    }
  });
  return result;
}
