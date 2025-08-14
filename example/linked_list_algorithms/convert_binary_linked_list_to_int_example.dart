import 'package:algorithms_core/algorithms_core.dart';

void main() {
  final head = LinkedListNode.fromList([1, 0, 1]);
  final value = convertBinaryLinkedListToInt(head);
  print('Binary [1,0,1] => $value');
}
