import 'package:algorithms_core/numerical/bisection.dart';

void main() {
  final root = bisection((x) => x * x - 2, 0.0, 2.0);
  print('sqrt(2) ~ $root');
}
