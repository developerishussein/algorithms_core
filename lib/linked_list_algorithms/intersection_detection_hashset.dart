/// 🔗 Intersection Detection using HashSet
///
/// Detects the intersection node of two singly linked lists using a HashSet.
/// Returns the intersecting node or null if no intersection.
///
/// Time complexity: O(m + n)
/// Space complexity: O(m)
///
/// Example:
/// ```dart
/// final a = LinkedListNode.fromList([1,2,3]);
/// final b = LinkedListNode.fromList([4,5]);
/// b.next!.next = a.next; // intersection at node with value 2
/// final intersection = intersectionDetectionHashSet(a, b);
/// // intersection.value == 2
/// ```
library;

import 'linked_list_node.dart';
import 'dart:collection';

LinkedListNode<T>? intersectionDetectionHashSet<T>(
  LinkedListNode<T>? headA,
  LinkedListNode<T>? headB,
) {
  final visited = HashSet<LinkedListNode<T>>();
  var currA = headA;
  while (currA != null) {
    visited.add(currA);
    currA = currA.next;
  }
  var currB = headB;
  while (currB != null) {
    if (visited.contains(currB)) return currB;
    currB = currB.next;
  }
  return null;
}
