import 'package:test/test.dart';
import 'package:algorithms_core/ml_algorithms/lstm.dart';

void main() {
  group('LSTM', () {
    test('predict shape', () {
      final X = [
        [
          [0.1, 0.0],
          [0.2, 0.1],
        ],
      ];
      final model = LSTM(inputSize: 2, hiddenSize: 5, readoutLayers: [1]);
      final out = model.predict(X);
      expect(out.length, equals(1));
      expect(out[0].length, equals(5));
    });
  });
}
