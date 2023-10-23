// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CalendarState {
  Map<DateTime, Costs> get costsByDateTime =>
      throw _privateConstructorUsedError;
  DateTime get focusedDay => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarStateCopyWith<CalendarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarStateCopyWith<$Res> {
  factory $CalendarStateCopyWith(
          CalendarState value, $Res Function(CalendarState) then) =
      _$CalendarStateCopyWithImpl<$Res, CalendarState>;
  @useResult
  $Res call({Map<DateTime, Costs> costsByDateTime, DateTime focusedDay});
}

/// @nodoc
class _$CalendarStateCopyWithImpl<$Res, $Val extends CalendarState>
    implements $CalendarStateCopyWith<$Res> {
  _$CalendarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? costsByDateTime = null,
    Object? focusedDay = null,
  }) {
    return _then(_value.copyWith(
      costsByDateTime: null == costsByDateTime
          ? _value.costsByDateTime
          : costsByDateTime // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, Costs>,
      focusedDay: null == focusedDay
          ? _value.focusedDay
          : focusedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CalendarStateCopyWith<$Res>
    implements $CalendarStateCopyWith<$Res> {
  factory _$$_CalendarStateCopyWith(
          _$_CalendarState value, $Res Function(_$_CalendarState) then) =
      __$$_CalendarStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<DateTime, Costs> costsByDateTime, DateTime focusedDay});
}

/// @nodoc
class __$$_CalendarStateCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res, _$_CalendarState>
    implements _$$_CalendarStateCopyWith<$Res> {
  __$$_CalendarStateCopyWithImpl(
      _$_CalendarState _value, $Res Function(_$_CalendarState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? costsByDateTime = null,
    Object? focusedDay = null,
  }) {
    return _then(_$_CalendarState(
      costsByDateTime: null == costsByDateTime
          ? _value._costsByDateTime
          : costsByDateTime // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, Costs>,
      focusedDay: null == focusedDay
          ? _value.focusedDay
          : focusedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_CalendarState implements _CalendarState {
  const _$_CalendarState(
      {final Map<DateTime, Costs> costsByDateTime = const {},
      required this.focusedDay})
      : _costsByDateTime = costsByDateTime;

  final Map<DateTime, Costs> _costsByDateTime;
  @override
  @JsonKey()
  Map<DateTime, Costs> get costsByDateTime {
    if (_costsByDateTime is EqualUnmodifiableMapView) return _costsByDateTime;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_costsByDateTime);
  }

  @override
  final DateTime focusedDay;

  @override
  String toString() {
    return 'CalendarState(costsByDateTime: $costsByDateTime, focusedDay: $focusedDay)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CalendarState &&
            const DeepCollectionEquality()
                .equals(other._costsByDateTime, _costsByDateTime) &&
            (identical(other.focusedDay, focusedDay) ||
                other.focusedDay == focusedDay));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_costsByDateTime), focusedDay);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CalendarStateCopyWith<_$_CalendarState> get copyWith =>
      __$$_CalendarStateCopyWithImpl<_$_CalendarState>(this, _$identity);
}

abstract class _CalendarState implements CalendarState {
  const factory _CalendarState(
      {final Map<DateTime, Costs> costsByDateTime,
      required final DateTime focusedDay}) = _$_CalendarState;

  @override
  Map<DateTime, Costs> get costsByDateTime;
  @override
  DateTime get focusedDay;
  @override
  @JsonKey(ignore: true)
  _$$_CalendarStateCopyWith<_$_CalendarState> get copyWith =>
      throw _privateConstructorUsedError;
}
