/// Most Recent Key Access (MRU Cache) implementation.
class MRUCache<K, V> {
  final int capacity;
  final _cache = <K, V>{};
  final _order = <K>[];

  MRUCache(this.capacity);

  V? get(K key) {
    if (!_cache.containsKey(key)) return null;
    _order.remove(key);
    _order.add(key);
    return _cache[key];
  }

  void put(K key, V value) {
    if (_cache.containsKey(key)) {
      _order.remove(key);
    } else if (_cache.length == capacity) {
      final oldest = _order.removeAt(0);
      _cache.remove(oldest);
    }
    _cache[key] = value;
    _order.add(key);
  }

  @override
  String toString() => _cache.toString();
}
