import 'package:algorithms_core/algorithms_core.dart';

void main() {
  final X = [
    [1.0],
    [2.0],
    [3.0],
    [4.0],
  ];
  final y = [0, 0, 1, 1];
  print(knnPredict(X, y, [2.2], 3));
}
