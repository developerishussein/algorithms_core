import 'package:algorithms_core/algorithms_core.dart';

void main() {
  final head = LinkedListNode.fromList<int>([1, 4, 3, 2, 5, 2]);
  final partitioned = partitionList(head, 3);
  print('Partitioned around 3 => ${LinkedListNode.toList(partitioned)}');
}
