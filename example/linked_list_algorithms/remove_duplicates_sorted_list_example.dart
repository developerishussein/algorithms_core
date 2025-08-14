import 'package:algorithms_core/algorithms_core.dart';

void main() {
  final head = LinkedListNode.fromList<int>([1, 1, 2, 3, 3]);
  final deduped = removeDuplicatesSortedList(head);
  print('Deduped => ${LinkedListNode.toList(deduped)}');
}
