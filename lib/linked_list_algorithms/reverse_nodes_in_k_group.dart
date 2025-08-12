/// 🔄 Reverse Nodes in K-Group
///
/// Reverses nodes of a linked list in groups of k.
///
/// Time complexity: O(n)
/// Space complexity: O(1)
///
/// Example:
/// ```dart
/// final head = LinkedListNode.fromList([1,2,3,4,5]);
/// final reversed = reverseNodesInKGroup(head, 2);
/// // reversed: [2,1,4,3,5]
/// ```
library;

import 'linked_list_node.dart';

LinkedListNode<T>? reverseNodesInKGroup<T>(LinkedListNode<T>? head, int k) {
  if (head == null || k <= 1) return head;
  final dummy = LinkedListNode<T>(head.value);
  dummy.next = head;
  LinkedListNode<T>? prevGroupEnd = dummy;
  while (true) {
    LinkedListNode<T>? kth = prevGroupEnd;
    for (int i = 0; i < k && kth != null; i++) {
      kth = kth.next;
    }
    if (kth == null) break;
    LinkedListNode<T>? groupStart = prevGroupEnd!.next;
    LinkedListNode<T>? nextGroupStart = kth.next;
    // Reverse group
    LinkedListNode<T>? prev = nextGroupStart;
    LinkedListNode<T>? curr = groupStart;
    while (curr != nextGroupStart) {
      final tmp = curr!.next;
      curr.next = prev;
      prev = curr;
      curr = tmp;
    }
    prevGroupEnd.next = kth;
    prevGroupEnd = groupStart;
  }
  return dummy.next;
}
