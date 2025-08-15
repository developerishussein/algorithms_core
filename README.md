## 🧠 algorithms core

![Temporary Logo](https://k.top4top.io/p_3514x9kqz1.png)

> A comprehensive, fast, and extensible algorithms library for Dart. Includes classic and modern techniques for lists, sets, maps, strings, and graphs — built with clean APIs and strong generics.

---

- Actively maintained with ambitious roadmap (1,000+ algorithms planned)
- Type-safe generics across the library
- Readable code with clear documentation and tests

Environment: Dart SDK ≥ 3.7.2 (see `pubspec.yaml`).

---

## 📦 Install  algorithms core

Use in your Dart or Flutter project.

### Dart

```bash
dart pub add algorithms_core
```

### Flutter 

```bash
flutter pub add algorithms_core
```

---

## 🚀 Quick start  algorithm

```dart
import 'package:algorithms_core/algorithms_core.dart';
import 'package:algorithms_core/graph_algorithms/weighted_edge.dart';

void main() {
  // List: binary search and sorting
  final idx = binarySearch<int>([1, 3, 5, 7, 9], 7);
  final sorted = mergeSort<int>([5, 2, 4, 6, 1, 3]);

  // String: algorithms
  final isPal = isPalindrome('A man a plan a canal Panama');
  final lcp = longestCommonPrefix(['flower', 'flow', 'flight']);

  // Graph: Dijkstra over weighted edges
  final graph = <String, List<WeightedEdge<String>>>{
    'A': [WeightedEdge('A', 'B', 1), WeightedEdge('A', 'C', 4)],
    'B': [WeightedEdge('B', 'C', 2)],
    'C': [],
  };
  final dist = dijkstra(graph, 'A');

  // Tree: binary tree operations
  final root = BinaryTreeNode<int>(10);
  root.left = BinaryTreeNode<int>(5);
  root.right = BinaryTreeNode<int>(15);
  final inorder = inorderTraversal(root);
  final isValid = validateBST(root);

  // Linked List: basic operations
  final list = LinkedListNode.fromList<int>([1, 2, 3, 4, 5]);
  final reversed = reverseLinkedList(list);
  final hasCycle = detectCycle(list);

  print([idx, sorted, isPal, lcp, dist, inorder, isValid, reversed, hasCycle]);
}
```

For a full tour, see `example/algorithms_core_example.dart`, `example/tree_algorithms_example.dart`, and `example/linked_list_algorithms_example.dart`.

---

## 🧩 Algorithms included

### List algorithms
- binary_search, linear_search
- merge_sort, quick_sort, bubble_sort, insertion_sort, selection_sort
- counting_sort (non-negative ints)
- reverse_list, find_max_min, find_duplicates, remove_duplicates
- kadanes_algorithm
- max_sum_subarray_of_size_k, min_sum, average_subarray, prefix_sum, two_sum_sorted
- rotate_array_right

### Set algorithms
- has_duplicates, has_two_sum, has_unique_window
- disjoint_set (Union-Find), find_intersection, set_difference, is_frequency_unique

### Map algorithms
- frequency_count, most_frequent_element, top_k_frequent
- group_by_key, first_non_repeated_element
- anagram_checker (generic list-based)
- two_sum (indices), lru_cache, length_of_longest_substring

### String algorithms
- reverse_string, palindrome_checker, anagram_checker
- brute_force_search, kmp_search, rabin_karp_search
- longest_common_prefix, longest_palindromic_substring
- edit_distance, string_compression, count_vowels_consonants

### Graph algorithms (new)
- bfs, dfs, topological_sort
- connected_components, cycle_detection (directed/undirected), bipartite_graph
- shortest_path (unweighted BFS), weighted_edge (utility)
- dijkstra, bellman_ford, floyd_warshall
- mst_kruskal, mst_prim
- kosaraju_scc, articulation_points, union_find (typedef)

### Tree algorithms (new)
- binary_tree_node (generic tree node)
- tree_traversals (inorder, preorder, postorder)
- level_order_traversal (BFS)
- tree_depth (height calculation)
- invert_tree (mirror tree)
- lowest_common_ancestor (LCA)
- validate_bst (BST validation)
- tree_diameter (longest path)
- balanced_tree_check (height-balanced check)
- tree_serialization (serialize/deserialize)
- zigzag_traversal (alternating level order)

### Linked List algorithms (new)
- linked_list_node (generic singly linked list node)
- doubly_linked_list_node (generic doubly linked list node)
- insert_delete_at_position (insert/delete at specific positions)
- reverse_linked_list (iterative, recursive, group reverse, reverse between)
- detect_cycle (Floyd's cycle detection algorithm)
- merge_sorted_lists (merge two sorted linked lists)
- remove_nth_from_end (remove nth node from end)
- palindrome_linked_list (check if linked list is palindrome)
- intersection_of_lists (find intersection point of two lists)

Each function includes Dartdoc with usage and time/space complexity.

---

## 📚 Usage notes

- Import everything via `package:algorithms_core/algorithms_core.dart`.
- Sorting/searching functions use `T extends Comparable` where appropriate.
- Weighted graph utilities use `WeightedEdge<T>`.
- Algorithms are pure and side-effect free unless documented otherwise.

---

## 🧪 Running tests

```bash
dart test
```

All tests pass in the repository (see `test/`).

---
## Key Algorithms

 Algorithm                      |Description
------------------------------|----------------------------------------------------------
 binary_search                | Fast and efficient binary search on a sorted list.
merge_sort                    | Stable sorting algorithm with excellent performance.
quick_sort                    | Fast sorting algorithm with good average-case performance.
kadanes_algorithm             | Finds the maximum sum of a contiguous subarray.
dijkstra                      | Finds the shortest path in a weighted directed graph.
bellman_ford                  | Shortest path algorithm that handles negative weights and detects negative cycles.
floyd_warshall                | Finds shortest paths between all pairs of nodes in a graph.
bfs (Breadth-First Search)    | Graph traversal method for connectivity and shortest unweighted paths.
dfs (Depth-First Search)      | Graph traversal method for cycle detection, classification, and orderings.
topological_sort              | Orders nodes in a directed acyclic graph (DAG).
disjoint_set (Union-Find)     | Data structure for managing disjoint sets and connectivity.
kmp_search (Knuth-Morris-Pratt) | Efficient substring search using prefix tables.
rabin_karp_search             | Substring search algorithm based on hashing.
longest_common_prefix         | Finds the longest common prefix among a list of strings.
lowest_common_ancestor (LCA)  | Finds the lowest common ancestor node in a tree.
validate_bst                  | Validates whether a binary tree is a binary search tree.
reverse_linked_list           | Reverses a singly or doubly linked list.
detect_cycle (Floyd’s Cycle Detection) | Detects cycles in a linked list.
mst_kruskal                   | Constructs a minimum spanning tree using Kruskal's algorithm.
mst_prim                      | Constructs a minimum spanning tree using Prim's algorithm.

---

## 🤝 Contributing

Contributions are welcome!
- Add new algorithms or optimize existing ones
- Improve docs and examples
- Increase test coverage

Open a PR with a brief description and test cases.

---

## 🗺️ Roadmap (short-term)
- Expand graph algorithms (SPFA, Johnson, Edmonds-Karp, Dinic)
- Add tree/heap/DP/geometry modules
- Benchmarks and performance docs

---

## 📄 License

MIT. See `LICENSE`.
