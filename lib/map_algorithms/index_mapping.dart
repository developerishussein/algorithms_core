/// Index Mapping for Elements: returns a map from element to list of indices where it appears.
Map<T, List<int>> indexMapping<T>(List<T> list) {
  final map = <T, List<int>>{};
  for (var i = 0; i < list.length; i++) {
    map.putIfAbsent(list[i], () => []).add(i);
  }
  return map;
}
