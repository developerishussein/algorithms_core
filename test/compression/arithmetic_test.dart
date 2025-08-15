import 'package:test/test.dart';
import 'package:algorithms_core/compression/arithmetic.dart';

void main() {
  test('Arithmetic basic encode (smoke)', () {
    final a = Arithmetic();
    final src = 'ABRACADABRA'.codeUnits;
    final enc = a.encode(src);
    expect(enc.isNotEmpty, isTrue);
  });
}
