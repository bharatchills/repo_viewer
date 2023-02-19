import 'package:freezed_annotation/freezed_annotation.dart';

part 'fresh.freezed.dart';

@freezed
class Fresh<T> with _$Fresh {
  const factory Fresh({
    required T entity,
    required bool isFresh,
    bool? isNextPageAvailabel,
  }) = _Fresh;

  factory Fresh.yes(
    T entity, {
    bool? isNextPageAvailabel,
  }) =>
      Fresh(
        entity: entity,
        isFresh: true,
        isNextPageAvailabel: isNextPageAvailabel,
      );

  factory Fresh.no(
    T entity, {
    bool? isNextPageAvailabel,
  }) =>
      Fresh(
        entity: entity,
        isFresh: true,
        isNextPageAvailabel: isNextPageAvailabel,
      );
}
