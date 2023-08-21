// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saying.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Saying {
  String get value => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SayingCopyWith<Saying> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SayingCopyWith<$Res> {
  factory $SayingCopyWith(Saying value, $Res Function(Saying) then) =
      _$SayingCopyWithImpl<$Res, Saying>;
  @useResult
  $Res call({String value, String author});
}

/// @nodoc
class _$SayingCopyWithImpl<$Res, $Val extends Saying>
    implements $SayingCopyWith<$Res> {
  _$SayingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? author = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SayingCopyWith<$Res> implements $SayingCopyWith<$Res> {
  factory _$$_SayingCopyWith(_$_Saying value, $Res Function(_$_Saying) then) =
      __$$_SayingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, String author});
}

/// @nodoc
class __$$_SayingCopyWithImpl<$Res>
    extends _$SayingCopyWithImpl<$Res, _$_Saying>
    implements _$$_SayingCopyWith<$Res> {
  __$$_SayingCopyWithImpl(_$_Saying _value, $Res Function(_$_Saying) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? author = null,
  }) {
    return _then(_$_Saying(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Saying implements _Saying {
  const _$_Saying({required this.value, required this.author});

  @override
  final String value;
  @override
  final String author;

  @override
  String toString() {
    return 'Saying(value: $value, author: $author)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Saying &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.author, author) || other.author == author));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, author);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SayingCopyWith<_$_Saying> get copyWith =>
      __$$_SayingCopyWithImpl<_$_Saying>(this, _$identity);
}

abstract class _Saying implements Saying {
  const factory _Saying(
      {required final String value, required final String author}) = _$_Saying;

  @override
  String get value;
  @override
  String get author;
  @override
  @JsonKey(ignore: true)
  _$$_SayingCopyWith<_$_Saying> get copyWith =>
      throw _privateConstructorUsedError;
}
