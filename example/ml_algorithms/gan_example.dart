import 'package:algorithms_core/ml_algorithms/gan.dart';

void main() {
  final model = GAN(latentDim: 16, epochs: 1);
  model.fit([]);
  print(model.generate(2));
}
