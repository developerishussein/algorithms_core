import 'package:algorithms_core/algorithms_core.dart';

void main() {
  final X = [
    [1.0],
    [2.0],
    [3.0],
    [4.0],
  ];
  final y = [1.0, 2.0, 3.0, 4.0];
  final gb = GradientBoostingRegressor(nEstimators: 10, learningRate: 0.1);
  gb.fit(X, y);
  print(gb.predictOne([2.5]));
}
