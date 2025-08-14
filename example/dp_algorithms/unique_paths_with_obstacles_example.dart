import 'package:algorithms_core/algorithms_core.dart';

void main() {
  final grid = [
    [0, 0, 0],
    [0, 1, 0],
    [0, 0, 0],
  ];
  print('Unique paths with obstacles => ${uniquePathsWithObstacles(grid)}');
}
