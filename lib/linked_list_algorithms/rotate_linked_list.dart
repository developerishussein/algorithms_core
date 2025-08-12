/// 🔄 Rotate Linked List
///
/// Rotates a singly linked list to the right by k places.
///
/// Time complexity: O(n)
/// Space complexity: O(1)
///
/// Example:
/// ```dart
/// final head = LinkedListNode.fromList([1,2,3,4,5]);
/// final rotated = rotateLinkedList(head, 2);
/// // rotated: [4,5,1,2,3]
/// ```
library;

import 'linked_list_node.dart';

LinkedListNode<T>? rotateLinkedList<T>(LinkedListNode<T>? head, int k) {
  if (head == null || head.next == null || k == 0) return head;
  // Compute the length and get the tail
  int length = 1;
  LinkedListNode<T>? tail = head;
  while (tail!.next != null) {
    tail = tail.next;
    length++;
  }
  k = k % length;
  if (k == 0) return head;
  // Make it circular
  tail.next = head;
  // Find new tail: (length - k - 1)th node
  LinkedListNode<T>? newTail = head;
  for (int i = 0; i < length - k - 1; i++) {
    newTail = newTail!.next;
  }
  LinkedListNode<T>? newHead = newTail!.next;
  newTail.next = null;
  return newHead;
}
