import 'package:test/test.dart';
import 'package:algorithms_core/algorithms_core.dart';

void main() {
  group('cherryPickup', () {
    test('small grid', () {
      final grid = [
        [0, 1, -1],
        [1, 0, -1],
        [1, 1, 1],
      ];
      expect(cherryPickup(grid), greaterThanOrEqualTo(0));
    });
  });
}
