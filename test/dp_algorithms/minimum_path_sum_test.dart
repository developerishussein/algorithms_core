import 'package:algorithms_core/algorithms_core.dart';
import 'package:test/test.dart';

void main() {
  group('Minimum Path Sum', () {
    test('standard grid', () {
      final grid = [
        [1, 3, 1],
        [1, 5, 1],
        [4, 2, 1],
      ];
      expect(minimumPathSum(grid), equals(7));
    });
    test('single cell', () {
      expect(
        minimumPathSum([
          [5],
        ]),
        equals(5),
      );
    });
    test('non-rectangular throws', () {
      expect(() => minPathSum([]), throwsArgumentError);
    });
  });
}
