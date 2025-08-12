import 'package:test/test.dart';
import 'package:algorithms_core/graph_algorithms/hamiltonian_path.dart';

void main() {
  group('Hamiltonian Path/Cycle', () {
    test('Find Hamiltonian cycle', () {
      final graph = <int, List<int>>{
        0: [1, 3],
        1: [0, 2, 3],
        2: [1, 3],
        3: [0, 1, 2],
      };
      final path = findHamiltonianPath(graph, cycle: true);
      expect(path, isNotNull);
      expect(path!.length, equals(4));
      expect(graph[path.first]!.contains(path.last), isTrue);
    });
    test('No Hamiltonian path', () {
      final graph = <int, List<int>>{
        0: [1],
        1: [0, 2],
        2: [1],
      };
      expect(findHamiltonianPath(graph), isNull);
    });
  });
}
