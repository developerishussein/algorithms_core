import 'package:test/test.dart';
import 'package:algorithms_core/string_algorithms/rolling_hash.dart';

void main() {
  test('rollingHashSearch basic', () {
    expect(rollingHashSearch('abracadabra', 'abra'), equals([0, 7]));
    expect(rollingHashSearch('abc', 'd'), isEmpty);
  });
}
