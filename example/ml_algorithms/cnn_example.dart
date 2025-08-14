import 'package:algorithms_core/ml_algorithms/cnn.dart';

void main() {
  // dummy single-channel 3x3 images
  final X = [
    [
      [
        [0.0],
        [1.0],
        [0.0],
      ],
      [
        [0.0],
        [1.0],
        [0.0],
      ],
      [
        [0.0],
        [1.0],
        [0.0],
      ],
    ],
  ];
  final y = [
    [1.0],
  ];
  final model = CNN(filters: [8, 16], epochs: 1);
  model.fit(X, y);
  print(model.predict(X));
}
