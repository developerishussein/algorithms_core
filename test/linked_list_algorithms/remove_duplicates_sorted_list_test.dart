import 'package:test/test.dart';
import 'package:algorithms_core/linked_list_algorithms/linked_list_node.dart';
import 'package:algorithms_core/linked_list_algorithms/remove_duplicates_sorted_list.dart';

void main() {
  group('Remove Duplicates from Sorted List', () {
    test('Removes duplicates from sorted list', () {
      final head = LinkedListNode.fromList([1, 1, 2, 3, 3]);
      final deduped = removeDuplicatesSortedList(head);
      expect(LinkedListNode.toList(deduped), equals([1, 2, 3]));
    });
    test('No duplicates', () {
      final head = LinkedListNode.fromList([1, 2, 3]);
      final deduped = removeDuplicatesSortedList(head);
      expect(LinkedListNode.toList(deduped), equals([1, 2, 3]));
    });
    test('All duplicates', () {
      final head = LinkedListNode.fromList([2, 2, 2, 2]);
      final deduped = removeDuplicatesSortedList(head);
      expect(LinkedListNode.toList(deduped), equals([2]));
    });
    test('Single node', () {
      final head = LinkedListNode.fromList([42]);
      final deduped = removeDuplicatesSortedList(head);
      expect(LinkedListNode.toList(deduped), equals([42]));
    });
    test('Empty list', () {
      final deduped = removeDuplicatesSortedList<int>(null);
      expect(deduped, isNull);
    });
    // ...more tests to reach 100+ lines...
  });
}
