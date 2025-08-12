/// 🔄 Swap Nodes in Pairs
///
/// Swaps every two adjacent nodes in a singly linked list.
///
/// Time complexity: O(n)
/// Space complexity: O(1)
///
/// Example:
/// ```dart
/// final head = LinkedListNode.fromList([1,2,3,4]);
/// final swapped = swapNodesInPairs(head);
/// // swapped: [2,1,4,3]
/// ```
library;

import 'linked_list_node.dart';

LinkedListNode<T>? swapNodesInPairs<T>(LinkedListNode<T>? head) {
  final dummy = LinkedListNode<T>(head?.value as T);
  dummy.next = head;
  LinkedListNode<T>? prev = dummy;
  while (prev!.next != null && prev.next!.next != null) {
    final first = prev.next;
    final second = prev.next!.next;
    first!.next = second!.next;
    second.next = first;
    prev.next = second;
    prev = first;
  }
  return dummy.next;
}
