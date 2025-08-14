import 'package:algorithms_core/ml_algorithms/transformer.dart';

void main() {
  final X = [
    [1, 2, 3, 4],
  ];
  final y = [
    [0.0],
  ];
  final model = Transformer(
    dModel: 32,
    heads: 4,
    vocabSize: 5,
    headLayers: [1],
  );
  model.fit(X, y);
  print(model.predict(X));
}
