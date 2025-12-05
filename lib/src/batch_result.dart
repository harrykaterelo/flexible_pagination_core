
class BatchResult<T> {
  final Map<String,T> items;
  final Map<String,BatchError> failures;

  BatchResult({
    required this.items,
    required this.failures,
  });
  List<T> getSortedItemsList(int Function(T a, T b) compare) {
    final itemList = items.values.toList();
    itemList.sort(compare);
    return itemList;
  }
  T ? get(String id) => items[id];
  int get totalCount => items.length + failures.length;
  bool get isSuccess => failures.isEmpty;
  int get successesCount => items.length;
  int get failuresCount => failures.length;
  bool get hasFailures => failures.isNotEmpty;
  int get successRate=> items.length + failures.length == 0 ? 0 : (items.length * 100) ~/ (items.length + failures.length);
}
class BatchError {
  final String message;
  final Exception cause;
  final BatchErrorType type;
  final String id;
  BatchError({
    required this.id,
    required this.message,
    required this.cause,
    required this.type,
  });
  
}
enum BatchErrorType {
  notFound,
  permissionDenied,
  network,
  unknown,
  timeout,
  notFoundinCache
  
}