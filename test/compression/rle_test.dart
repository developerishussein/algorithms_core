import 'package:test/test.dart';
import 'package:algorithms_core/compression/rle.dart';

void main() {
  test('RLE basic', () {
    final r = RLE();
    final src = [5, 5, 5, 5, 6, 6, 7];
    final enc = r.encode(src);
    final dec = r.decode(enc);
    expect(dec, equals(src));
  });
}
