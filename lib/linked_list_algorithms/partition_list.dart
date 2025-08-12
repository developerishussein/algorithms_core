/// 🔄 Partition Linked List
///
/// Partitions a linked list around a value x, such that all nodes less than x come before nodes greater than or equal to x.
///
/// Time complexity: O(n)
/// Space complexity: O(1)
///
/// Example:
/// ```dart
/// final head = LinkedListNode.fromList([1,4,3,2,5,2]);
/// final partitioned = partitionList(head, 3);
/// // partitioned: [1,2,2,4,3,5]
/// ```
library;

import 'linked_list_node.dart';

LinkedListNode<T>? partitionList<T extends Comparable>(
  LinkedListNode<T>? head,
  T x,
) {
  final beforeHead = LinkedListNode<T>(x);
  final afterHead = LinkedListNode<T>(x);
  var before = beforeHead;
  var after = afterHead;
  var current = head;
  while (current != null) {
    if (current.value.compareTo(x) < 0) {
      before.next = LinkedListNode<T>(current.value);
      before = before.next!;
    } else {
      after.next = LinkedListNode<T>(current.value);
      after = after.next!;
    }
    current = current.next;
  }
  before.next = afterHead.next;
  return beforeHead.next;
}
