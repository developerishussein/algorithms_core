import 'package:test/test.dart';
import 'package:algorithms_core/algorithms_core.dart';

void main() {
  group('GradientBoostingClassifier', () {
    test('basic fit/predict', () {
      final X = [
        [1.0],
        [2.0],
        [3.0],
        [4.0],
      ];
      final y = [0, 0, 1, 1];
      final gbc = GradientBoostingClassifier(nEstimators: 5, learningRate: 0.1);
      gbc.fit(X, y);
      final p = gbc.predict([2.5]);
      expect(p, anyOf([0, 1]));
    });
  });
}
