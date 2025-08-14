import 'package:test/test.dart';
import 'package:algorithms_core/ml_algorithms/cnn.dart';

void main() {
  group('CNN', () {
    test('predict shape', () {
      final X = [
        [
          [
            [0.0],
            [0.0],
          ],
          [
            [0.0],
            [0.0],
          ],
        ],
      ];
      final model = CNN(height: 2, width: 2, channels: 1, headLayers: [1]);
      final out = model.predict(X);
      expect(out.length, equals(1));
      expect(out[0].length, equals(1));
    });
  });
}
