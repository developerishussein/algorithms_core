import 'package:test/test.dart';
import 'package:algorithms_core/compression/bwt.dart';

void main() {
  test('BWT roundtrip', () {
    final src = 'banana'.codeUnits;
    final trans = bwtTransform(src);
    final inv = bwtInverse(trans);
    expect(String.fromCharCodes(inv), equals('banana'));
  });
}
