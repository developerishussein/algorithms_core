import 'package:test/test.dart';
import 'package:algorithms_core/graph_algorithms/bridge_finding.dart';

void main() {
  group('Bridge Finding', () {
    test('Find bridges', () {
      final graph = <int, List<int>>{
        0: [1, 2],
        1: [0, 2],
        2: [0, 1, 3],
        3: [2],
      };
      final bridges = findBridges(graph);
      expect(bridges, contains([2, 3]));
    });
  });
}
