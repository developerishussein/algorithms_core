import 'package:test/test.dart';
import 'package:algorithms_core/algorithms_core.dart';

void main() {
  group('LightGBMLikeRegressor', () {
    test('fit predict basic', () {
      final X = [
        [1.0],
        [2.0],
        [3.0],
        [4.0],
      ];
      final y = [1.0, 2.0, 3.0, 4.0];
      final lgb = LightGBMLikeRegressor(nEstimators: 5, learningRate: 0.1);
      lgb.fit(X, y);
      final p = lgb.predictOne([2.5]);
      expect(p, isA<double>());
    });
  });
}
