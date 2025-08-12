/// Group Anagrams: groups words that are anagrams of each other.
List<List<String>> groupAnagrams(List<String> words) {
  final map = <String, List<String>>{};
  for (final word in words) {
    final key = (word.split('')..sort()).join();
    map.putIfAbsent(key, () => []).add(word);
  }
  return map.values.toList();
}
