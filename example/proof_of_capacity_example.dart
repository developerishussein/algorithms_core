import 'package:algorithms_core/consensus_algorithms/proof_of_capacity.dart';

void main() {
  final plots = [Plot('alice', 1024, 10), Plot('bob', 2048, 20)];
  final poc = ProofOfCapacity(plots);
  print('best=${poc.bestResponder(123)}');
}
