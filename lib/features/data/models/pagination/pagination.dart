import 'package:equatable/equatable.dart';

class DataPage<T> extends Equatable {
  final int? count;
  final String? next;
  final String? previous;
  final List<T?>? results;

  DataPage({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory DataPage.fromJson(Map<String, dynamic> json, Function fromJson) {
    return DataPage<T>(
      results: json['results'] == null
          ? null
          : List<T>.from(
              (json['results'].map((itemsJson) => fromJson(itemsJson))),
            ),
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
    );
  }

  @override
  List<Object?> get props => [
        count,
        next,
        previous,
        results,
      ];

  @override
  String toString() {
    return 'DataPage{count: $count, next: $next, previous: $previous, results: $results}';
  }
}
