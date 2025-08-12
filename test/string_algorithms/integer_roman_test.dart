import 'package:test/test.dart';
import 'package:algorithms_core/string_algorithms/integer_roman.dart';

void main() {
  test('intToRoman and romanToInt', () {
    expect(intToRoman(1994), equals('MCMXCIV'));
    expect(romanToInt('MCMXCIV'), equals(1994));
    expect(intToRoman(58), equals('LVIII'));
    expect(romanToInt('LVIII'), equals(58));
  });
}
