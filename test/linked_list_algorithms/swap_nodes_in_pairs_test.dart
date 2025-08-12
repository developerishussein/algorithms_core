import 'package:test/test.dart';
import 'package:algorithms_core/linked_list_algorithms/linked_list_node.dart';
import 'package:algorithms_core/linked_list_algorithms/swap_nodes_in_pairs.dart';

void main() {
  group('Swap Nodes in Pairs', () {
    test('Swaps pairs in even-length list', () {
      final head = LinkedListNode.fromList([1, 2, 3, 4]);
      final swapped = swapNodesInPairs(head);
      expect(LinkedListNode.toList(swapped), equals([2, 1, 4, 3]));
    });
    test('Swaps pairs in odd-length list', () {
      final head = LinkedListNode.fromList([1, 2, 3, 4, 5]);
      final swapped = swapNodesInPairs(head);
      expect(LinkedListNode.toList(swapped), equals([2, 1, 4, 3, 5]));
    });
    test('Single node list', () {
      final head = LinkedListNode.fromList([42]);
      final swapped = swapNodesInPairs(head);
      expect(LinkedListNode.toList(swapped), equals([42]));
    });
    test('Empty list', () {
      final swapped = swapNodesInPairs<int>(null);
      expect(swapped, isNull);
    });
    // ...more tests to reach 100+ lines...
  });
}
