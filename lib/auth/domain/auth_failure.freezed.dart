// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? error) server,
    required TResult Function() storage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? error)? server,
    TResult? Function()? storage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? error)? server,
    TResult Function()? storage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Server value) server,
    required TResult Function(Storage value) storage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Server value)? server,
    TResult? Function(Storage value)? storage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Server value)? server,
    TResult Function(Storage value)? storage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthFailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
          AuthFailure value, $Res Function(AuthFailure) then) =
      _$AuthFailureCopyWithImpl<$Res, AuthFailure>;
}

/// @nodoc
class _$AuthFailureCopyWithImpl<$Res, $Val extends AuthFailure>
    implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ServerCopyWith<$Res> {
  factory _$$ServerCopyWith(_$Server value, $Res Function(_$Server) then) =
      __$$ServerCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$ServerCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$Server>
    implements _$$ServerCopyWith<$Res> {
  __$$ServerCopyWithImpl(_$Server _value, $Res Function(_$Server) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$Server(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$Server implements Server {
  const _$Server({this.error});

  @override
  final String? error;

  @override
  String toString() {
    return 'AuthFailure.server(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Server &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerCopyWith<_$Server> get copyWith =>
      __$$ServerCopyWithImpl<_$Server>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? error) server,
    required TResult Function() storage,
  }) {
    return server(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? error)? server,
    TResult? Function()? storage,
  }) {
    return server?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? error)? server,
    TResult Function()? storage,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Server value) server,
    required TResult Function(Storage value) storage,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Server value)? server,
    TResult? Function(Storage value)? storage,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Server value)? server,
    TResult Function(Storage value)? storage,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class Server implements AuthFailure {
  const factory Server({final String? error}) = _$Server;

  String? get error;
  @JsonKey(ignore: true)
  _$$ServerCopyWith<_$Server> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StorageCopyWith<$Res> {
  factory _$$StorageCopyWith(_$Storage value, $Res Function(_$Storage) then) =
      __$$StorageCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StorageCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$Storage>
    implements _$$StorageCopyWith<$Res> {
  __$$StorageCopyWithImpl(_$Storage _value, $Res Function(_$Storage) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Storage implements Storage {
  const _$Storage();

  @override
  String toString() {
    return 'AuthFailure.storage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Storage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? error) server,
    required TResult Function() storage,
  }) {
    return storage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? error)? server,
    TResult? Function()? storage,
  }) {
    return storage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? error)? server,
    TResult Function()? storage,
    required TResult orElse(),
  }) {
    if (storage != null) {
      return storage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Server value) server,
    required TResult Function(Storage value) storage,
  }) {
    return storage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Server value)? server,
    TResult? Function(Storage value)? storage,
  }) {
    return storage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Server value)? server,
    TResult Function(Storage value)? storage,
    required TResult orElse(),
  }) {
    if (storage != null) {
      return storage(this);
    }
    return orElse();
  }
}

abstract class Storage implements AuthFailure {
  const factory Storage() = _$Storage;
}
