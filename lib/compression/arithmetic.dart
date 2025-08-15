/// Simple arithmetic coder (order-0) for demonstration/testing
///
/// This implementation uses integer-range arithmetic coding with a
/// fixed-precision (32-bit) range. It's designed for correctness on
/// small inputs and clarity. For production you'd extend with adaptive
/// models and streaming support.
library;

class Arithmetic {
  // Encode using simple static frequencies for bytes present in data.
  List<int> encode(List<int> data) {
    if (data.isEmpty) return [];
    final freq = <int, int>{};
    for (var b in data) {
      freq[b] = (freq[b] ?? 0) + 1;
    }
    final syms = freq.keys.toList()..sort();
    final cum = <int>[]; // cumulative
    var total = 0;
    for (var s in syms) {
      cum.add(total);
      total += freq[s]!;
    }
    final m = 1 << 24; // precision
    BigInt low = BigInt.zero;
    BigInt high = BigInt.from(m) - BigInt.one;
    for (var b in data) {
      final idx = syms.indexOf(b);
      final symLow = BigInt.from(cum[idx]);
      final symHigh = BigInt.from(cum[idx] + freq[b]!);
      final range = high - low + BigInt.one;
      high = low + (range * symHigh ~/ BigInt.from(total)) - BigInt.one;
      low = low + (range * symLow ~/ BigInt.from(total));
    }
    // output low as bytes
    final bytes = <int>[];
    final val = low;
    var tmp = val;
    while (tmp > BigInt.zero) {
      bytes.add((tmp & BigInt.from(0xff)).toInt());
      tmp = tmp >> 8;
    }
    if (bytes.isEmpty) bytes.add(0);
    return bytes.reversed.toList();
  }

  // Decode with supplied symbol model (must be same as used in encode)
  List<int> decode(
    List<int> encoded,
    List<int> alphabet,
    List<int> freqs,
    int outLen,
  ) {
    if (encoded.isEmpty) return [];
    final m = 1 << 24;
    BigInt value = BigInt.zero;
    for (var b in encoded) {
      value = (value << 8) + BigInt.from(b);
    }
    final total = freqs.reduce((a, b) => a + b);
    BigInt low = BigInt.zero;
    BigInt high = BigInt.from(m) - BigInt.one;
    final res = <int>[];
    for (var i = 0; i < outLen; i++) {
      final range = high - low + BigInt.one;
      final scaled =
          ((value - low + BigInt.one) * BigInt.from(total) - BigInt.one) ~/
          range;
      // find symbol
      var acc = 0;
      var sym = 0;
      for (var j = 0; j < alphabet.length; j++) {
        if (acc + freqs[j] > scaled.toInt()) {
          sym = alphabet[j];
          break;
        }
        acc += freqs[j];
      }
      res.add(sym);
      final symLow = acc;
      final symHigh = acc + freqs[alphabet.indexOf(sym)];
      high =
          low +
          (range * BigInt.from(symHigh) ~/ BigInt.from(total)) -
          BigInt.one;
      low = low + (range * BigInt.from(symLow) ~/ BigInt.from(total));
    }
    return res;
  }
}
