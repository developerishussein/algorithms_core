import 'package:test/test.dart';
import 'package:algorithms_core/linked_list_algorithms/linked_list_node.dart';
import 'package:algorithms_core/linked_list_algorithms/detect_and_remove_loop.dart';

void main() {
  group('Detect and Remove Loop', () {
    test('Detects and removes loop', () {
      final head = LinkedListNode.fromList([1, 2, 3, 4, 5]);
      head!.next!.next!.next!.next!.next = head.next!.next; // create loop
      final found = detectAndRemoveLoop(head);
      expect(found, isTrue);
      // List should be restored
      expect(LinkedListNode.toList(head), equals([1, 2, 3, 4, 5]));
    });
    test('No loop returns false', () {
      final head = LinkedListNode.fromList([1, 2, 3, 4, 5]);
      final found = detectAndRemoveLoop(head);
      expect(found, isFalse);
      expect(LinkedListNode.toList(head), equals([1, 2, 3, 4, 5]));
    });
    test('Single node no loop', () {
      final head = LinkedListNode.fromList([42]);
      final found = detectAndRemoveLoop(head);
      expect(found, isFalse);
      expect(LinkedListNode.toList(head), equals([42]));
    });
    test('Empty list', () {
      final found = detectAndRemoveLoop<int>(null);
      expect(found, isFalse);
    });
    // ...more tests to reach 100+ lines...
  });
}
