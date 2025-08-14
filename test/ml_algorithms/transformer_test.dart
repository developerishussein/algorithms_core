import 'package:test/test.dart';
import 'package:algorithms_core/ml_algorithms/transformer.dart';

void main() {
  group('Transformer', () {
    test('predict shape', () {
      final X = [
        [1, 2, 3],
      ];
      final model = Transformer(
        dModel: 16,
        heads: 2,
        vocabSize: 1000,
        headLayers: [2],
      );
      final out = model.predict(X);
      expect(out.length, equals(1));
      expect(out[0].length, equals(16));
    });
  });
}
