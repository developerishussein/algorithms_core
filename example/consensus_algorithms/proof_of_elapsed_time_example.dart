import 'package:algorithms_core/consensus_algorithms/proof_of_elapsed_time.dart';

void main() {
  final poet = PoET(seed: 42);
  final nodes = ['n1', 'n2', 'n3'];
  print('winner=${poet.winner(nodes)}');
}
