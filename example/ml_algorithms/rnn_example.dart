import 'package:algorithms_core/ml_algorithms/rnn.dart';

void main() {
  final X = [
    [
      [0.1, 0.0],
      [0.2, 0.1],
    ],
  ];
  final y = [
    [1.0],
  ];
  final model = RNN(hiddenSize: 4, epochs: 1);
  model.fit(X, y);
  print(model.predict(X));
}
