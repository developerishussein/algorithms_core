/// 🔄 Detect and Remove Loop in Linked List
///
/// Detects a loop in a singly linked list and removes it if present.
/// Returns true if a loop was found and removed, false otherwise.
///
/// Time complexity: O(n)
/// Space complexity: O(1)
///
/// Example:
/// ```dart
/// final head = LinkedListNode.fromList([1,2,3,4,5]);
/// head!.next!.next!.next!.next!.next = head.next!.next; // create loop
/// final found = detectAndRemoveLoop(head);
/// // found == true, loop removed
/// ```
library;

import 'linked_list_node.dart';

bool detectAndRemoveLoop<T>(LinkedListNode<T>? head) {
  if (head == null) return false;
  LinkedListNode<T>? slow = head, fast = head;
  // Detect loop
  while (fast != null && fast.next != null) {
    slow = slow!.next;
    fast = fast.next!.next;
    if (slow == fast) break;
  }
  if (fast == null || fast.next == null) return false;
  // Find loop start
  slow = head;
  while (slow != fast) {
    slow = slow!.next;
    fast = fast!.next;
  }
  // Remove loop
  while (fast!.next != slow) {
    fast = fast.next;
  }
  fast.next = null;
  return true;
}
