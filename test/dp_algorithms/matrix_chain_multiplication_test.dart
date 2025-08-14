import 'package:test/test.dart';
import 'package:algorithms_core/algorithms_core.dart';

void main() {
  group('matrixChainOrder', () {
    test('example', () {
      final dims = [40, 20, 30, 10, 30];
      expect(matrixChainOrder(dims), equals(26000));
    });

    test('two matrices', () {
      expect(matrixChainOrder([10, 20, 30]), equals(6000));
    });
  });
}
