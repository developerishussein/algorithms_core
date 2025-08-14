import 'package:algorithms_core/consensus_algorithms/proof_of_elapsed_time.dart';
import 'package:test/test.dart';

void main() {
  group('PoET', () {
    test('winner returns node from list', () {
      final poet = PoET(seed: 1);
      final nodes = ['x', 'y', 'z'];
      final w = poet.winner(nodes);
      expect(nodes.contains(w), isTrue);
    });
  });
}
