import 'package:algorithms_core/algorithms_core.dart';

void main() {
  final head = LinkedListNode.fromList<int>([1, 2, 3, 4, 5]);
  final reversed = reverseNodesInKGroup(head, 2);
  print('Reverse in k=2 => ${LinkedListNode.toList(reversed)}');
}
