// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saying_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SayingState {
  Saying? get saying => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SayingStateCopyWith<SayingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SayingStateCopyWith<$Res> {
  factory $SayingStateCopyWith(
          SayingState value, $Res Function(SayingState) then) =
      _$SayingStateCopyWithImpl<$Res, SayingState>;
  @useResult
  $Res call({Saying? saying});

  $SayingCopyWith<$Res>? get saying;
}

/// @nodoc
class _$SayingStateCopyWithImpl<$Res, $Val extends SayingState>
    implements $SayingStateCopyWith<$Res> {
  _$SayingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saying = freezed,
  }) {
    return _then(_value.copyWith(
      saying: freezed == saying
          ? _value.saying
          : saying // ignore: cast_nullable_to_non_nullable
              as Saying?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SayingCopyWith<$Res>? get saying {
    if (_value.saying == null) {
      return null;
    }

    return $SayingCopyWith<$Res>(_value.saying!, (value) {
      return _then(_value.copyWith(saying: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SayingStateImplCopyWith<$Res>
    implements $SayingStateCopyWith<$Res> {
  factory _$$SayingStateImplCopyWith(
          _$SayingStateImpl value, $Res Function(_$SayingStateImpl) then) =
      __$$SayingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Saying? saying});

  @override
  $SayingCopyWith<$Res>? get saying;
}

/// @nodoc
class __$$SayingStateImplCopyWithImpl<$Res>
    extends _$SayingStateCopyWithImpl<$Res, _$SayingStateImpl>
    implements _$$SayingStateImplCopyWith<$Res> {
  __$$SayingStateImplCopyWithImpl(
      _$SayingStateImpl _value, $Res Function(_$SayingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saying = freezed,
  }) {
    return _then(_$SayingStateImpl(
      saying: freezed == saying
          ? _value.saying
          : saying // ignore: cast_nullable_to_non_nullable
              as Saying?,
    ));
  }
}

/// @nodoc

class _$SayingStateImpl implements _SayingState {
  const _$SayingStateImpl({this.saying});

  @override
  final Saying? saying;

  @override
  String toString() {
    return 'SayingState(saying: $saying)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SayingStateImpl &&
            (identical(other.saying, saying) || other.saying == saying));
  }

  @override
  int get hashCode => Object.hash(runtimeType, saying);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SayingStateImplCopyWith<_$SayingStateImpl> get copyWith =>
      __$$SayingStateImplCopyWithImpl<_$SayingStateImpl>(this, _$identity);
}

abstract class _SayingState implements SayingState {
  const factory _SayingState({final Saying? saying}) = _$SayingStateImpl;

  @override
  Saying? get saying;
  @override
  @JsonKey(ignore: true)
  _$$SayingStateImplCopyWith<_$SayingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
