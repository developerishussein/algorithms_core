import 'package:test/test.dart';
import 'package:algorithms_core/ml_algorithms/ppo.dart';

void main() {
  group('PPO', () {
    test('selectAction delegates', () {
      final p = PPO(
        nActions: 2,
        actorLayers: [3, 8, 2],
        criticLayers: [3, 8, 1],
        seed: 4,
      );
      final a = p.selectAction([0.0, 0.0, 0.0]);
      expect(a, inInclusiveRange(0, 1));
    });
  });
}
