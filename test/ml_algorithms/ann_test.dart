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
  });
}
