import 'package:test/test.dart';
import 'package:algorithms_core/algorithms_core.dart';

void main() {
  group('XGBoostLikeRegressor', () {
    test('fit predict basic', () {
      final X = [
        [1.0],
        [2.0],
        [3.0],
        [4.0],
      ];
      final y = [1.0, 2.0, 3.0, 4.0];
      final xg = XGBoostLikeRegressor(nEstimators: 5, learningRate: 0.1);
      xg.fit(X, y);
      final p = xg.predictOne([2.5]);
      expect(p, isA<double>());
    });
  });
}
