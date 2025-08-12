import 'package:test/test.dart';
import 'package:algorithms_core/backtracking_algorithms/n_queens.dart';

void main() {
  group('N-Queens', () {
    test('n = 1', () {
      expect(
        solveNQueens(1),
        equals([
          ['Q'],
        ]),
      );
    });
    test('n = 4', () {
      final solutions = solveNQueens(4);
      expect(solutions.length, equals(2));
      expect(
        solutions,
        containsAll([
          ['.Q..', '...Q', 'Q...', '..Q.'],
          ['..Q.', 'Q...', '...Q', '.Q..'],
        ]),
      );
    });
    test('n = 0', () {
      expect(solveNQueens(0), equals([]));
    });
  });
}
