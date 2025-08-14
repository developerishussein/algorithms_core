import 'package:algorithms_core/ml_algorithms/lstm.dart';

void main() {
  final X = [
    [
      [0.1, 0.2],
      [0.2, 0.1],
    ],
  ];
  final y = [
    [1.0],
  ];
  final model = LSTM(hiddenSize: 8, epochs: 1);
  model.fit(X, y);
  print(model.predict(X));
}
