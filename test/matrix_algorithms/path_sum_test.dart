import 'package:test/test.dart';
import 'package:algorithms_core/matrix_algorithms/path_sum.dart';

void main() {
  group('Path Sum in Matrix', () {
    test('Path exists', () {
      final matrix = [
        [5, 4, 2],
        [1, 9, 1],
        [1, 1, 1],
      ];
      expect(hasPathSum(matrix, 14), isTrue); // 5->4->2->1->1->1
    });
    test('No path', () {
      final matrix = [
        [1, 2],
        [3, 4],
      ];
      expect(hasPathSum(matrix, 100), isFalse);
    });
    test('Empty matrix', () {
      expect(hasPathSum(<List<int>>[], 0), isFalse);
    });
  });
}
