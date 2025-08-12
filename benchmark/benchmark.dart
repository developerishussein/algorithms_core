import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:algorithms_core/algorithms_core.dart';
import 'dart:io';

void main() {
  print('--- algorithms_core Benchmark Suite ---');
  print(
    'Each result is average time per operation (us/op) and memory usage (KB)',
  );
  print('');
  print('Dart version: ${Platform.version}');
  print(
    'Platform: ${Platform.operatingSystem} ${Platform.operatingSystemVersion}',
  );
  print('---\n');

  // List Algorithms
  runWithMemory(MaxSumSubarrayIntBenchmark());
  runWithMemory(MaxSumSubarrayDoubleBenchmark());
  runWithMemory(BubbleSortBenchmark());
  runWithMemory(QuickSortBenchmark());
  runWithMemory(MergeSortBenchmark());

  // Set Algorithms
  runWithMemory(HasDuplicatesBenchmark());

  // Map Algorithms
  runWithMemory(FrequencyCountBenchmark());

  // String Algorithms
  runWithMemory(ReverseStringBenchmark());

  // Graph Algorithms
  runWithMemory(DijkstraBenchmark());
  runWithMemory(BFSBenchmark());
  runWithMemory(DFSBenchmark());

  // Advanced Graph Algorithms
  runWithMemory(EdmondsKarpBenchmark());
  runWithMemory(DinicsAlgorithmBenchmark());
  runWithMemory(JohnsonsAlgorithmBenchmark());
  runWithMemory(StoerWagnerMinCutBenchmark());
}

void runWithMemory(BenchmarkBase benchmark) {
  // Warm up
  benchmark.warmup();
  // Take memory before
  final memBefore = ProcessInfo.currentRss;
  // Run benchmark
  final score = benchmark.measure();
  // Take memory after
  final memAfter = ProcessInfo.currentRss;
  final memUsageKb = ((memAfter - memBefore) / 1024).toStringAsFixed(2);
  print(
    '${benchmark.runtimeType.toString().padRight(30)} | ${benchmark.name.padRight(30)} | ${score.toStringAsFixed(2).padLeft(10)} us/op | ${memUsageKb.padLeft(8)} KB',
  );
}

// List Algorithms
class MaxSumSubarrayIntBenchmark extends BenchmarkBase {
  MaxSumSubarrayIntBenchmark() : super('maxSumSubarrayOfSizeK<int>');
  final list = List<int>.generate(1000, (i) => i % 100);
  @override
  void run() {
    maxSumSubarrayOfSizeK(list, 50);
  }
}

class MaxSumSubarrayDoubleBenchmark extends BenchmarkBase {
  MaxSumSubarrayDoubleBenchmark() : super('maxSumSubarrayOfSizeK<double>');
  final list = List<double>.generate(1000, (i) => (i % 100).toDouble());
  @override
  void run() {
    maxSumSubarrayOfSizeK(list, 50);
  }
}

class BubbleSortBenchmark extends BenchmarkBase {
  BubbleSortBenchmark() : super('bubbleSort');
  final list = List<int>.generate(500, (i) => 500 - i);
  @override
  void run() {
    final copy = List<int>.from(list);
    bubbleSort(copy);
  }
}

class QuickSortBenchmark extends BenchmarkBase {
  QuickSortBenchmark() : super('quickSort');
  final list = List<int>.generate(500, (i) => 500 - i);
  @override
  void run() {
    final copy = List<int>.from(list);
    quickSort(copy, 0, copy.length - 1);
  }
}

class MergeSortBenchmark extends BenchmarkBase {
  MergeSortBenchmark() : super('mergeSort');
  final list = List<int>.generate(500, (i) => 500 - i);
  @override
  void run() {
    mergeSort(list);
  }
}

// Set Algorithms
class HasDuplicatesBenchmark extends BenchmarkBase {
  HasDuplicatesBenchmark() : super('hasDuplicates');
  final list = List<int>.generate(1000, (i) => i % 500);
  @override
  void run() {
    hasDuplicates(list);
  }
}

// Map Algorithms
class FrequencyCountBenchmark extends BenchmarkBase {
  FrequencyCountBenchmark() : super('frequencyCount');
  final list = List<String>.generate(1000, (i) => 'item${i % 10}');
  @override
  void run() {
    frequencyCount(list);
  }
}

// String Algorithms
class ReverseStringBenchmark extends BenchmarkBase {
  ReverseStringBenchmark() : super('reverseString');
  final str = 'a' * 1000;
  @override
  void run() {
    reverseString(str);
  }
}

// Graph Algorithms
class DijkstraBenchmark extends BenchmarkBase {
  DijkstraBenchmark() : super('dijkstra');
  final Map<String, List<WeightedEdge<String>>> graph = {
    'A': [WeightedEdge('A', 'B', 1), WeightedEdge('A', 'C', 4)],
    'B': [WeightedEdge('B', 'C', 2), WeightedEdge('B', 'D', 5)],
    'C': [WeightedEdge('C', 'D', 1)],
    'D': [],
  };
  @override
  void run() {
    dijkstra(graph, 'A');
  }
}

class BFSBenchmark extends BenchmarkBase {
  BFSBenchmark() : super('bfs');
  final Map<String, List<String>> graph = {
    'A': ['B', 'C'],
    'B': ['D', 'E'],
    'C': ['F'],
    'D': [],
    'E': ['F'],
    'F': [],
  };
  @override
  void run() {
    bfs(graph, 'A');
  }
}

class DFSBenchmark extends BenchmarkBase {
  DFSBenchmark() : super('dfs');
  final Map<String, List<String>> graph = {
    'A': ['B', 'C'],
    'B': ['D', 'E'],
    'C': ['F'],
    'D': [],
    'E': ['F'],
    'F': [],
  };
  @override
  void run() {
    dfs(graph, 'A');
  }
}

// Advanced Graph Algorithms
class EdmondsKarpBenchmark extends BenchmarkBase {
  EdmondsKarpBenchmark() : super('edmondsKarp');
  final Map<String, Map<String, num>> graph = {
    'S': {'A': 10, 'C': 10},
    'A': {'B': 4, 'C': 2, 'D': 8},
    'B': {'D': 10},
    'C': {'D': 9},
    'D': {},
  };
  @override
  void run() {
    edmondsKarp(graph, 'S', 'D');
  }
}

class DinicsAlgorithmBenchmark extends BenchmarkBase {
  DinicsAlgorithmBenchmark() : super('dinicsAlgorithm');
  final Map<String, Map<String, num>> graph = {
    'S': {'A': 10, 'C': 10},
    'A': {'B': 4, 'C': 2, 'D': 8},
    'B': {'D': 10},
    'C': {'D': 9},
    'D': {},
  };
  @override
  void run() {
    dinicsAlgorithm(graph, 'S', 'D');
  }
}

class JohnsonsAlgorithmBenchmark extends BenchmarkBase {
  JohnsonsAlgorithmBenchmark() : super('johnsonsAlgorithm');
  final Map<String, Map<String, num>> graph = {
    'A': {'B': 2, 'C': 4},
    'B': {'C': 1, 'D': 7},
    'C': {'D': 3},
    'D': {'A': 5},
  };
  @override
  void run() {
    johnsonsAlgorithm(graph);
  }
}

class StoerWagnerMinCutBenchmark extends BenchmarkBase {
  StoerWagnerMinCutBenchmark() : super('stoerWagnerMinCut');
  final Map<int, Map<int, num>> graph = {
    0: {1: 3, 2: 1},
    1: {0: 3, 2: 3},
    2: {0: 1, 1: 3},
  };
  @override
  void run() {
    stoerWagnerMinCut(graph);
  }
}
