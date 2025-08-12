/// Invert Map: swaps keys and values. If duplicate values exist, later keys overwrite earlier ones.
Map<V, K> invertMap<K, V>(Map<K, V> map) {
  final result = <V, K>{};
  map.forEach((k, v) => result[v] = k);
  return result;
}
