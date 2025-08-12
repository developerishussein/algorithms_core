import 'package:test/test.dart';
import 'package:algorithms_core/graph_algorithms/shortest_path.dart';

void main() {
  test('Unweighted shortest path using BFS', () {
    final graph = <String, List<String>>{
      'A': ['B', 'C'],
      'B': ['D', 'E'],
      'C': ['F'],
      'D': [],
      'E': ['F'],
      'F': [],
    };
    expect(shortestPathUnweighted(graph, 'A', 'F'), equals(['A', 'C', 'F']));
  });
}
