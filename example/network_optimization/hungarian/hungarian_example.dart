import 'package:algorithms_core/network_optimization/hungarian.dart';

void main() {
  final cost = [
    [4, 1, 3],
    [2, 0, 5],
    [3, 2, 2],
  ];
  final res = hungarian(cost);
  print('min cost = ${res[0]}, assignment=${res[1]}');
}
