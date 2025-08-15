import 'package:algorithms_core/network_optimization/edmonds_blossom.dart';

void main() {
  final g = [
    [1, 2],
    [0, 2],
    [0, 1, 3],
    [2],
  ];
  final match = edmondsBlossom(4, g);
  print('matching=$match');
}
