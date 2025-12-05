import 'package:flexible_pagination_core/src/pagination_options.dart';
import 'package:flexible_pagination_core/src/pagination_result.dart';

abstract class PaginationUsecase<T,P extends PaginationUsecaseParams> {

  Future<PaginationResult<T>> call(
    
    P params);
}
abstract class PaginationUsecaseParams<T extends PaginationOptions> {
  final T options;
  const PaginationUsecaseParams({required this.options});

  PaginationUsecaseParams<T> copyWith({
    T? options,
  });
  
}