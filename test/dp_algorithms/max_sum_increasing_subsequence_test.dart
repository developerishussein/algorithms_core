import 'package:test/test.dart';
import 'package:algorithms_core/algorithms_core.dart';

void main() {
  group('maxSumIncreasingSubsequence', () {
    test('example', () {
      expect(
        maxSumIncreasingSubsequence([1, 101, 2, 3, 100, 4, 5]),
        equals(106),
      );
    });
  });
}
