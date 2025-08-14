import 'package:algorithms_core/consensus_algorithms/fba.dart';
import 'package:test/test.dart';

void main() {
  group('FBA', () {
    test('quorum detection', () {
      final slices = {
        'A': [
          {'A', 'B'},
          {'A', 'C'},
        ],
        'B': [
          {'A', 'B'},
        ],
        'C': [
          {'A', 'C'},
        ],
      };
      final fba = FBA(
        slices.map(
          (k, v) => MapEntry(k, v.map((s) => Set<String>.from(s)).toList()),
        ),
      );
      expect(fba.isQuorum({'A', 'B'}), isTrue);
    });
  });
}
