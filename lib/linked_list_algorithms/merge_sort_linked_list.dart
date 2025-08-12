/// 🔄 Sort Linked List (Merge Sort)
///
/// Sorts a singly linked list using merge sort algorithm.
///
/// Time complexity: O(n log n)
/// Space complexity: O(log n) due to recursion
///
/// Example:
/// ```dart
/// final head = LinkedListNode.fromList([4,2,1,3]);
/// final sorted = mergeSortLinkedList(head);
/// // sorted: [1,2,3,4]
/// ```
library;

import 'linked_list_node.dart';

LinkedListNode<T>? mergeSortLinkedList<T extends Comparable>(
  LinkedListNode<T>? head,
) {
  if (head == null || head.next == null) return head;
  // Split list
  LinkedListNode<T>? slow = head, fast = head.next;
  while (fast != null && fast.next != null) {
    slow = slow!.next;
    fast = fast.next!.next;
  }
  final mid = slow!.next;
  slow.next = null;
  final left = mergeSortLinkedList(head);
  final right = mergeSortLinkedList(mid);
  return _merge(left, right);
}

LinkedListNode<T>? _merge<T extends Comparable>(
  LinkedListNode<T>? l1,
  LinkedListNode<T>? l2,
) {
  final dummy = LinkedListNode<T>(l1?.value ?? l2!.value);
  var tail = dummy;
  var a = l1, b = l2;
  while (a != null && b != null) {
    if (a.value.compareTo(b.value) <= 0) {
      tail.next = LinkedListNode<T>(a.value);
      a = a.next;
    } else {
      tail.next = LinkedListNode<T>(b.value);
      b = b.next;
    }
    tail = tail.next!;
  }
  tail.next = a ?? b;
  return dummy.next;
}
