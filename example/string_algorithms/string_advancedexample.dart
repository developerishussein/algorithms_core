// import 'package:algorithms_core/string_algorithms/manacher_longest_palindrome.dart';
// import 'package:algorithms_core/string_algorithms/boyer_moore_search.dart';
// import 'package:algorithms_core/string_algorithms/z_algorithm.dart';
// import 'package:algorithms_core/string_algorithms/rolling_hash.dart';
// import 'package:algorithms_core/string_algorithms/longest_repeating_substring.dart';
// import 'package:algorithms_core/string_algorithms/remove_consecutive_duplicates.dart';
// import 'package:algorithms_core/string_algorithms/min_window_subsequence.dart';
// import 'package:algorithms_core/string_algorithms/atoi.dart';
// import 'package:algorithms_core/string_algorithms/integer_roman.dart';
// import 'package:algorithms_core/string_algorithms/string_permutations.dart';
import 'package:algorithms_core/algorithms_core.dart';

void main() {
  // Manacher's Algorithm
  print('Manacher: ${manacherLongestPalindrome('babad')}'); // 'bab' or 'aba'

  // Boyer-Moore Search
  print('Boyer-Moore: ${boyerMooreSearch('hello world', 'world')}'); // 6

  // Z-Algorithm
  print('Z-Algorithm: ${zAlgorithm('aabcaabxaaaz')}');

  // Rolling Hash (Rabin-Karp)
  print('Rolling Hash: ${rollingHashSearch('abracadabra', 'abra')}'); // [0, 7]

  // Longest Repeating Substring
  print(
    'Longest Repeating Substring: ${longestRepeatingSubstring('banana')}',
  ); // 'ana'

  // Remove Consecutive Duplicates
  print(
    'Remove Consecutive Duplicates: ${removeConsecutiveDuplicates('aabbcc')}',
  ); // 'abc'

  // Minimum Window Subsequence
  print(
    'Min Window Subsequence: ${minWindowSubsequence('abcdebdde', 'bde')}',
  ); // 'bcde'

  // String to Integer (Atoi)
  print('Atoi: ${atoi('   -42')}'); // -42

  // Integer to Roman / Roman to Integer
  print('Int to Roman: ${intToRoman(1994)}'); // 'MCMXCIV'
  print('Roman to Int: ${romanToInt('MCMXCIV')}'); // 1994

  // Generate All Permutations of a String
  print('String Permutations: ${stringPermutations('abc')}');
}
