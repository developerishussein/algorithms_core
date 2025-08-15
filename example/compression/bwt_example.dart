import 'package:algorithms_core/compression/bwt.dart';

void main() {
  final src = 'banana'.codeUnits;
  final trans = bwtTransform(src);
  final inv = bwtInverse(trans);
  print(String.fromCharCodes(inv));
}
