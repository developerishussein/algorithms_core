/// 🔢 Convert Binary Number in Linked List to Integer
///
/// Converts a binary number represented as a linked list to an integer.
/// The most significant bit comes first.
///
/// Time complexity: O(n)
/// Space complexity: O(1)
///
/// Example:
/// ```dart
/// final head = LinkedListNode.fromList([1,0,1]);
/// final value = convertBinaryLinkedListToInt(head);
/// // value: 5
/// ```
library;

import 'linked_list_node.dart';

int convertBinaryLinkedListToInt(LinkedListNode<int>? head) {
  int result = 0;
  var current = head;
  while (current != null) {
    result = (result << 1) | current.value;
    current = current.next;
  }
  return result;
}
