import 'package:algorithms_core/compression/arithmetic.dart';

void main() {
  final a = Arithmetic();
  final src = 'ABRACADABRA'.codeUnits;
  final enc = a.encode(src);
  print('encoded length ${enc.length}');
}
