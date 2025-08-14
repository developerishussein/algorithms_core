import 'package:algorithms_core/algorithms_core.dart';

void main() {
  final head = LinkedListNode.fromList<int>([4, 2, 1, 3]);
  final sorted = mergeSortLinkedList(head);
  print('Sorted => ${LinkedListNode.toList(sorted)}');
}
