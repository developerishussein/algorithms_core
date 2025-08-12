import 'package:test/test.dart';
import 'package:algorithms_core/string_algorithms/remove_consecutive_duplicates.dart';

void main() {
  test('removeConsecutiveDuplicates basic', () {
    expect(removeConsecutiveDuplicates('aabbcc'), equals('abc'));
    expect(removeConsecutiveDuplicates('a'), equals('a'));
    expect(removeConsecutiveDuplicates(''), equals(''));
  });
}
