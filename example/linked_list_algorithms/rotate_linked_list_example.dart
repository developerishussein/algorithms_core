import 'package:algorithms_core/algorithms_core.dart';

void main() {
  final head = LinkedListNode.fromList<int>([1, 2, 3, 4, 5]);
  final rotated = rotateLinkedList(head, 2);
  print('Rotate by 2 => ${LinkedListNode.toList(rotated)}');
}
