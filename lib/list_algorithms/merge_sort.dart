/// merge_sort.dart
library;

/// 🧠 خوارزمية Merge Sort: تعتمد على مبدأ "التقسيم والدمج"
List<T> mergeSort<T extends Comparable>(List<T> list) {
  if (list.length <= 1) return list;

  int mid = list.length ~/ 2;
  var left = mergeSort(list.sublist(0, mid));
  var right = mergeSort(list.sublist(mid));

  return _merge(left, right);
}

/// 🔗 دمج قائمتين مرتبتين
List<T> _merge<T extends Comparable>(List<T> left, List<T> right) {
  final result = <T>[];
  int i = 0, j = 0;

  while (i < left.length && j < right.length) {
    if (left[i].compareTo(right[j]) <= 0) {
      result.add(left[i++]);
    } else {
      result.add(right[j++]);
    }
  }

  result.addAll(left.sublist(i));
  result.addAll(right.sublist(j));
  return result;
}
