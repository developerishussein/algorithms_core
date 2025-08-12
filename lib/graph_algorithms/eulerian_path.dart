/// Eulerian Path and Circuit Finder for directed or undirected graphs.
///
/// This implementation is generic and works for any node type [T].
///
/// - Finds an Eulerian path or circuit if one exists.
/// - Returns a list of nodes representing the path/circuit, or null if none exists.
///
/// Time Complexity: O(E), where E is the number of edges.
///
/// Example:
/// ```dart
/// final graph = {
///   0: [1, 2],
///   1: [2],
///   2: [0, 1],
/// };
/// final path = findEulerianPath(graph);
/// print(path); // Eulerian path or circuit
/// ```
List<T>? findEulerianPath<T>(Map<T, List<T>> graph, {bool directed = false}) {
  // Count degrees
  final inDeg = <T, int>{};
  final outDeg = <T, int>{};
  for (var u in graph.keys) {
    outDeg[u] = graph[u]!.length;
    for (var v in graph[u]!) {
      inDeg[v] = (inDeg[v] ?? 0) + 1;
      if (!directed) {
        outDeg[v] = outDeg[v] ?? 0;
        inDeg[u] = inDeg[u] ?? 0;
      }
    }
  }
  // Find start node
  T? start;
  int plus1 = 0, minus1 = 0;
  for (var v in graph.keys) {
    final outD = outDeg[v] ?? 0, inD = inDeg[v] ?? 0;
    if (outD - inD == 1) {
      plus1++;
      start = v;
    } else if (inD - outD == 1) {
      minus1++;
    } else if (outD != inD) {
      return null;
    }
  }
  if ((directed && !(plus1 == 1 && minus1 == 1 || plus1 == 0 && minus1 == 0)) ||
      (!directed && !(plus1 == 0 && minus1 == 0))) {
    return null;
  }
  start ??= graph.keys.first;
  if (start == null) return null;
  // Hierholzer's algorithm
  final stack = <T>[start];
  final path = <T>[];
  final localGraph = <T, List<T>>{
    for (var u in graph.keys) u: List<T>.from(graph[u]!),
  };
  while (stack.isNotEmpty) {
    final u = stack.last;
    if (localGraph[u]!.isNotEmpty) {
      stack.add(localGraph[u]!.removeLast());
    } else {
      path.add(stack.removeLast());
    }
  }
  return path.reversed.toList();
}
