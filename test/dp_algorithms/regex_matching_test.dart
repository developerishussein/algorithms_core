import 'package:test/test.dart';
import 'package:algorithms_core/algorithms_core.dart';

void main() {
  group('isRegexMatch', () {
    test('example', () {
      expect(isRegexMatch('aab', 'c*a*b'), isTrue);
    });
  });
}
