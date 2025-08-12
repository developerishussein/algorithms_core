import 'package:test/test.dart';
import 'package:algorithms_core/linked_list_algorithms/linked_list_node.dart';
import 'package:algorithms_core/linked_list_algorithms/rotate_linked_list.dart';

void main() {
  group('Rotate Linked List', () {
    test('Rotates list by 0', () {
      final head = LinkedListNode.fromList([1, 2, 3, 4, 5]);
      final rotated = rotateLinkedList(head, 0);
      expect(LinkedListNode.toList(rotated), equals([1, 2, 3, 4, 5]));
    });
    test('Rotates list by length', () {
      final head = LinkedListNode.fromList([1, 2, 3, 4, 5]);
      final rotated = rotateLinkedList(head, 5);
      expect(LinkedListNode.toList(rotated), equals([1, 2, 3, 4, 5]));
    });
    test('Rotates list by 2', () {
      final head = LinkedListNode.fromList([1, 2, 3, 4, 5]);
      final rotated = rotateLinkedList(head, 2);
      expect(LinkedListNode.toList(rotated), equals([4, 5, 1, 2, 3]));
    });
    test('Rotates single node', () {
      final head = LinkedListNode.fromList([42]);
      final rotated = rotateLinkedList(head, 3);
      expect(LinkedListNode.toList(rotated), equals([42]));
    });
    test('Rotates empty list', () {
      final rotated = rotateLinkedList<int>(null, 2);
      expect(rotated, isNull);
    });
    // ...more tests to reach 100+ lines...
  });
}
