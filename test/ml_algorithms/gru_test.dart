import 'package:test/test.dart';
import 'package:algorithms_core/ml_algorithms/gru.dart';

void main() {
  group('GRU', () {
    test('predict shape', () {
      final X = [
        [
          [0.1, 0.0],
          [0.2, 0.1],
        ],
      ];
      final model = GRU(inputSize: 2, hiddenSize: 4, readoutLayers: [4]);
      final out = model.predict(X);
      expect(out.length, equals(1));
      expect(out[0].length, equals(4));
    });
  });
}
