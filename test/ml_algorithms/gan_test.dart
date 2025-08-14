import 'package:test/test.dart';
import 'package:algorithms_core/ml_algorithms/gan.dart';

void main() {
  group('GAN', () {
    test('generate shape', () {
      final model = GAN(latentDim: 8);
      final out = model.generate(3);
      expect(out.length, equals(3));
      expect(out[0].length, equals(8));
    });
  });
}
