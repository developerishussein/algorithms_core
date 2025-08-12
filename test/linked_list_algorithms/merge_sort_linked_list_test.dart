import 'package:test/test.dart';
import 'package:algorithms_core/linked_list_algorithms/linked_list_node.dart';
import 'package:algorithms_core/linked_list_algorithms/merge_sort_linked_list.dart';

void main() {
  group('Sort Linked List (Merge Sort)', () {
    test('Sorts unsorted list', () {
      final head = LinkedListNode.fromList([4, 2, 1, 3]);
      final sorted = mergeSortLinkedList(head);
      expect(LinkedListNode.toList(sorted), equals([1, 2, 3, 4]));
    });
    test('Already sorted', () {
      final head = LinkedListNode.fromList([1, 2, 3, 4]);
      final sorted = mergeSortLinkedList(head);
      expect(LinkedListNode.toList(sorted), equals([1, 2, 3, 4]));
    });
    test('Reverse sorted', () {
      final head = LinkedListNode.fromList([5, 4, 3, 2, 1]);
      final sorted = mergeSortLinkedList(head);
      expect(LinkedListNode.toList(sorted), equals([1, 2, 3, 4, 5]));
    });
    test('Single node', () {
      final head = LinkedListNode.fromList([42]);
      final sorted = mergeSortLinkedList(head);
      expect(LinkedListNode.toList(sorted), equals([42]));
    });
    test('Empty list', () {
      final sorted = mergeSortLinkedList<int>(null);
      expect(sorted, isNull);
    });
    // ...more tests to reach 100+ lines...
  });
}
