import 'package:test/test.dart';
import 'package:algorithms_core/ml_algorithms/ann.dart';

void main() {
  group('ANN', () {
    test('predict shape', () {
      final X = [
        [0.0, 1.0],
        [1.0, 0.0],
      ];
      final model = ANN(layers: [2, 3, 1]);
      final out = model.predict(X);
      expect(out.length, equals(2));
      expect(out[0].length, equals(1));
    });

    test('training reduces loss on tiny dataset', () {
      // simple regression: y = x0 + x1
      final X = [
        [0.0, 0.0],
        [0.0, 1.0],
        [1.0, 0.0],
        [1.0, 1.0],
      ];
      final Y = [
        [0.0],
        [1.0],
        [1.0],
        [2.0],
      ];

      final model = ANN(layers: [2, 4, 1], epochs: 200, lr: 0.05, seed: 42);
      final before = model.predict(X);
      double mseBefore = 0.0;
      for (var i = 0; i < before.length; i++) {
        final d = before[i][0] - Y[i][0];
        mseBefore += d * d;
      }
      mseBefore /= before.length;

      model.fit(X, Y);
      expect(model.lastLoss, isNotNull);
      expect(model.lastLoss!, lessThan(mseBefore));
    });
  });
}
