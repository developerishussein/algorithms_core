import 'package:test/test.dart';
import 'package:algorithms_core/set_algorithms/superset_check.dart';

void main() {
  test('isSuperset basic', () {
    expect(isSuperset({1, 2, 3}, {2, 3}), isTrue);
    expect(isSuperset({1, 2}, {2, 3}), isFalse);
    expect(isSuperset({1, 2, 3}, <int>{}), isTrue);
  });
}
