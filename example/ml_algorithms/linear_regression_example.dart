import 'package:algorithms_core/algorithms_core.dart';

void main() {
  final X = [
    [1.0],
    [2.0],
    [3.0],
  ];
  final y = [3.0, 5.0, 7.0]; // y = 1 + 2*x
  final coeffs = linearRegressionFit(X, y);
  print(coeffs); // approx [1.0, 2.0]
  print(linearRegressionPredict(coeffs, [4.0])); // ~9.0
}
