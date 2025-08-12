import 'package:test/test.dart';
import 'package:algorithms_core/matrix_algorithms/word_search.dart';

void main() {
  group('Word Search', () {
    test('Word exists', () {
      final board = [
        ['A', 'B', 'C', 'E'],
        ['S', 'F', 'C', 'S'],
        ['A', 'D', 'E', 'E'],
      ];
      expect(wordSearch(board, 'ABCCED'), isTrue);
      expect(wordSearch(board, 'SEE'), isTrue);
      expect(wordSearch(board, 'ABCB'), isFalse);
    });
    test('Empty board', () {
      expect(wordSearch([], 'A'), isFalse);
    });
    test('Empty word', () {
      final board = [
        ['A'],
      ];
      expect(wordSearch(board, ''), isTrue);
    });
  });
}
