// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cost_list_viewer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CostListViewerState {
  Costs get costs => throw _privateConstructorUsedError;
  Saying get saying => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CostListViewerStateCopyWith<CostListViewerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CostListViewerStateCopyWith<$Res> {
  factory $CostListViewerStateCopyWith(
          CostListViewerState value, $Res Function(CostListViewerState) then) =
      _$CostListViewerStateCopyWithImpl<$Res, CostListViewerState>;
  @useResult
  $Res call({Costs costs, Saying saying});

  $CostsCopyWith<$Res> get costs;
  $SayingCopyWith<$Res> get saying;
}

/// @nodoc
class _$CostListViewerStateCopyWithImpl<$Res, $Val extends CostListViewerState>
    implements $CostListViewerStateCopyWith<$Res> {
  _$CostListViewerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? costs = null,
    Object? saying = null,
  }) {
    return _then(_value.copyWith(
      costs: null == costs
          ? _value.costs
          : costs // ignore: cast_nullable_to_non_nullable
              as Costs,
      saying: null == saying
          ? _value.saying
          : saying // ignore: cast_nullable_to_non_nullable
              as Saying,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CostsCopyWith<$Res> get costs {
    return $CostsCopyWith<$Res>(_value.costs, (value) {
      return _then(_value.copyWith(costs: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SayingCopyWith<$Res> get saying {
    return $SayingCopyWith<$Res>(_value.saying, (value) {
      return _then(_value.copyWith(saying: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CostListViewerStateCopyWith<$Res>
    implements $CostListViewerStateCopyWith<$Res> {
  factory _$$_CostListViewerStateCopyWith(_$_CostListViewerState value,
          $Res Function(_$_CostListViewerState) then) =
      __$$_CostListViewerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Costs costs, Saying saying});

  @override
  $CostsCopyWith<$Res> get costs;
  @override
  $SayingCopyWith<$Res> get saying;
}

/// @nodoc
class __$$_CostListViewerStateCopyWithImpl<$Res>
    extends _$CostListViewerStateCopyWithImpl<$Res, _$_CostListViewerState>
    implements _$$_CostListViewerStateCopyWith<$Res> {
  __$$_CostListViewerStateCopyWithImpl(_$_CostListViewerState _value,
      $Res Function(_$_CostListViewerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? costs = null,
    Object? saying = null,
  }) {
    return _then(_$_CostListViewerState(
      costs: null == costs
          ? _value.costs
          : costs // ignore: cast_nullable_to_non_nullable
              as Costs,
      saying: null == saying
          ? _value.saying
          : saying // ignore: cast_nullable_to_non_nullable
              as Saying,
    ));
  }
}

/// @nodoc

class _$_CostListViewerState implements _CostListViewerState {
  const _$_CostListViewerState(
      {this.costs = const Costs(values: []),
      this.saying = const Saying(value: '', author: '')});

  @override
  @JsonKey()
  final Costs costs;
  @override
  @JsonKey()
  final Saying saying;

  @override
  String toString() {
    return 'CostListViewerState(costs: $costs, saying: $saying)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CostListViewerState &&
            (identical(other.costs, costs) || other.costs == costs) &&
            (identical(other.saying, saying) || other.saying == saying));
  }

  @override
  int get hashCode => Object.hash(runtimeType, costs, saying);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CostListViewerStateCopyWith<_$_CostListViewerState> get copyWith =>
      __$$_CostListViewerStateCopyWithImpl<_$_CostListViewerState>(
          this, _$identity);
}

abstract class _CostListViewerState implements CostListViewerState {
  const factory _CostListViewerState({final Costs costs, final Saying saying}) =
      _$_CostListViewerState;

  @override
  Costs get costs;
  @override
  Saying get saying;
  @override
  @JsonKey(ignore: true)
  _$$_CostListViewerStateCopyWith<_$_CostListViewerState> get copyWith =>
      throw _privateConstructorUsedError;
}
