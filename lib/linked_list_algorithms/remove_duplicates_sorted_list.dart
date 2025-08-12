/// 🔄 Remove Duplicates from Sorted Linked List
///
/// Removes all duplicates from a sorted singly linked list in-place.
///
/// Time complexity: O(n)
/// Space complexity: O(1)
///
/// Example:
/// ```dart
/// final head = LinkedListNode.fromList([1,1,2,3,3]);
/// final deduped = removeDuplicatesSortedList(head);
/// // deduped: [1,2,3]
/// ```
library;

import 'linked_list_node.dart';

LinkedListNode<T>? removeDuplicatesSortedList<T>(LinkedListNode<T>? head) {
  var current = head;
  while (current != null && current.next != null) {
    if (current.value == current.next!.value) {
      current.next = current.next!.next;
    } else {
      current = current.next;
    }
  }
  return head;
}
