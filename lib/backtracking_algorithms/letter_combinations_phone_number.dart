/// ☎️ Letter Combinations of a Phone Number (Backtracking)
///
/// Returns all possible letter combinations that the number could represent.
List<String> letterCombinations(String digits) {
  if (digits.isEmpty) return [];
  const Map<String, String> phone = {
    '2': 'abc',
    '3': 'def',
    '4': 'ghi',
    '5': 'jkl',
    '6': 'mno',
    '7': 'pqrs',
    '8': 'tuv',
    '9': 'wxyz',
  };
  List<String> result = [];
  void backtrack(int idx, String path) {
    if (idx == digits.length) {
      result.add(path);
      return;
    }
    for (final ch in phone[digits[idx]]!.split('')) {
      backtrack(idx + 1, path + ch);
    }
  }

  backtrack(0, '');
  return result;
}
