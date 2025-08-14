import 'package:test/test.dart';
import 'package:algorithms_core/ml_algorithms/rnn.dart';

void main() {
  group('RNN', () {
    test('predict shape', () {
      final X = [
        [
          [0.1, 0.0],
          [0.2, 0.1],
        ],
      ];
      final model = RNN(inputSize: 2, hiddenSize: 3, readoutLayers: [1]);
      final out = model.predict(X);
      expect(out.length, equals(1));
      expect(out[0].length, equals(3));
    });
  });
}
