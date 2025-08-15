import 'package:algorithms_core/compression/huffman.dart';

void main() {
  final h = Huffman();
  final data = 'this is an example of a huffman tree'.codeUnits;
  final packed = h.encodeBytes(data);
  final decoded = h.decodeToString(packed);
  print('decoded -> $decoded');
}
