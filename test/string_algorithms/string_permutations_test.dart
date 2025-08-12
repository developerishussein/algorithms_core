import 'package:test/test.dart';
import 'package:algorithms_core/string_algorithms/string_permutations.dart';

void main() {
  test('stringPermutations basic', () {
    final perms = stringPermutations('abc');
    expect(
      perms.toSet(),
      containsAll({'abc', 'acb', 'bac', 'bca', 'cab', 'cba'}),
    );
    expect(stringPermutations('a'), equals(['a']));
  });
}
