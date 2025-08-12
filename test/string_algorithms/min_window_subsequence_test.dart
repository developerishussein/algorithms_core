import 'package:test/test.dart';
import 'package:algorithms_core/string_algorithms/min_window_subsequence.dart';

void main() {
  test('minWindowSubsequence basic', () {
    expect(minWindowSubsequence('abcdebdde', 'bde'), equals('bcde'));
    expect(minWindowSubsequence('abc', 'ac'), equals('abc'));
    expect(minWindowSubsequence('abc', 'd'), equals(''));
  });
}
