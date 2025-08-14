import 'package:algorithms_core/algorithms_core.dart';

void main() {
  final head = LinkedListNode.fromList<int>([1, 2, 3, 4]);
  final swapped = swapNodesInPairs(head);
  print('Swapped pairs => ${LinkedListNode.toList(swapped)}');
}
