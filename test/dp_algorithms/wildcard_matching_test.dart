import 'package:test/test.dart';
import 'package:algorithms_core/algorithms_core.dart';

void main() {
  group('isWildcardMatch', () {
    test('example', () {
      expect(isWildcardMatch('aa', 'a*'), isTrue);
    });
  });
}
