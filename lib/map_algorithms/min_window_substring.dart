/// Minimum Window Substring (Map + Sliding Window)
String minWindowSubstring(String s, String t) {
  if (t.isEmpty || s.isEmpty) return '';
  final need = <String, int>{};
  for (final c in t.split('')) {
    need[c] = (need[c] ?? 0) + 1;
  }
  var have = 0, left = 0, minLen = s.length + 1, minStart = 0;
  final window = <String, int>{};
  for (var right = 0; right < s.length; right++) {
    final c = s[right];
    window[c] = (window[c] ?? 0) + 1;
    if (need.containsKey(c) && window[c] == need[c]) have++;
    while (have == need.length) {
      if (right - left + 1 < minLen) {
        minLen = right - left + 1;
        minStart = left;
      }
      final leftChar = s[left];
      window[leftChar] = window[leftChar]! - 1;
      if (need.containsKey(leftChar) && window[leftChar]! < need[leftChar]!) {
        have--;
      }
      left++;
    }
  }
  return minLen > s.length ? '' : s.substring(minStart, minStart + minLen);
}
