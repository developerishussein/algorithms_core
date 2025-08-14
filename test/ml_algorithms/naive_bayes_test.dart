import 'package:test/test.dart';
import 'package:algorithms_core/algorithms_core.dart';

void main() {
  group('GaussianNB', () {
    test('basic fit/predict', () {
      final X = [
        [1.0],
        [1.1],
        [3.0],
        [3.1],
      ];
      final y = [0, 0, 1, 1];
      final gnb = GaussianNB();
      gnb.fit(X, y);
      expect(gnb.predict([1.05]), equals(0));
    });
  });
}
