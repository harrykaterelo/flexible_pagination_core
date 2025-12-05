abstract class PaginationOptions {
  final String? continuationToken;
  final int limit;
  final bool refresh;
  
  const PaginationOptions({this.continuationToken,this.refresh=false, this.limit = 20});
  PaginationOptions copyWith({
    String? continuationToken,
    int? limit,
    bool? delToken,
    bool? refresh,
  });
}