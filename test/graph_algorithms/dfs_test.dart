import 'package:test/test.dart';
import 'package:algorithms_core/graph_algorithms/dfs.dart';

void main() {
  test('DFS traversal order', () {
    final graph = <String, List<String>>{
      'A': ['B', 'C'],
      'B': ['D', 'E'],
      'C': ['F'],
      'D': [],
      'E': ['F'],
      'F': [],
    };
    expect(dfs(graph, 'A'), equals(['A', 'B', 'D', 'E', 'F', 'C']));
  });
}
