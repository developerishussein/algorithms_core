import 'package:algorithms_core/compression/rle.dart';

void main() {
  final r = RLE();
  final src = [1, 1, 1, 2, 2, 3, 3, 3, 3];
  final enc = r.encode(src);
  final dec = r.decode(enc);
  print(dec);
}
