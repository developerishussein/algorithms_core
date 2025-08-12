import 'package:test/test.dart';
import 'package:algorithms_core/set_algorithms/subset_check.dart';

void main() {
  test('isSubset basic', () {
    expect(isSubset({1, 2}, {1, 2, 3}), isTrue);
    expect(isSubset({1, 4}, {1, 2, 3}), isFalse);
    expect(isSubset(<int>{}, {1, 2, 3}), isTrue);
  });
}
