enum SourceType{
  cache,
  remote
}

class PaginationResult<T> {
  final List<T> items;
  final String? nextPageToken;
  final PaginationMetadata? metadata;
  final bool hasMore;
  PaginationResult({
    required this.items,
      this.hasMore = true,
    required this.nextPageToken,
    this.metadata,
  });
  int get totalCount => items.length;
}
class PaginationMetadata {
  final SourceType sourceType; 
  final int totalRequested;
  final int totalReturned;

  PaginationMetadata({
    this.sourceType =  SourceType.remote,
    required this.totalRequested,
    required this.totalReturned,
  });
  bool get hasSkipped=> totalRequested> totalReturned;
  int get successRate => totalRequested == 0 ? 0 : (totalReturned * 100) ~/ totalRequested;

  
}