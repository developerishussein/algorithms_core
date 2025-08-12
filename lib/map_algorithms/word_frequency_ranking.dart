/// Word Frequency Ranking: returns a list of words sorted by frequency (desc), then lexicographically.
List<String> wordFrequencyRanking(String text) {
  final freq = <String, int>{};
  for (final word in text.split(RegExp(r'\W+'))) {
    if (word.isEmpty) continue;
    freq[word] = (freq[word] ?? 0) + 1;
  }
  final words = freq.keys.toList();
  words.sort(
    (a, b) =>
        freq[b] != freq[a] ? freq[b]!.compareTo(freq[a]!) : a.compareTo(b),
  );
  return words;
}
