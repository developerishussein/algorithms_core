import 'package:algorithms_core/consensus_algorithms/pbft.dart';

void main() {
  final pbft = PBFT(4, 1);
  print('canCommit=${pbft.canCommit(2, 3)}');
}
