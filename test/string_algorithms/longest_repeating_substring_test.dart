import 'package:test/test.dart';
import 'package:algorithms_core/string_algorithms/longest_repeating_substring.dart';

void main() {
  test('longestRepeatingSubstring basic', () {
    expect(longestRepeatingSubstring('banana'), equals('ana'));
    expect(longestRepeatingSubstring('abcd'), equals(''));
  });
}
