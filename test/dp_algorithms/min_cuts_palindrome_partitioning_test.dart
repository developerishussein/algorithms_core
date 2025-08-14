import 'package:test/test.dart';
import 'package:algorithms_core/algorithms_core.dart';

void main() {
  group('minCutsPalindromePartition', () {
    test('aab', () {
      expect(minCutsPalindromePartition('aab'), equals(1));
    });
  });
}
