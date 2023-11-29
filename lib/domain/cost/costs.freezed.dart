// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'costs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Costs {
  List<Cost> get values => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CostsCopyWith<Costs> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CostsCopyWith<$Res> {
  factory $CostsCopyWith(Costs value, $Res Function(Costs) then) =
      _$CostsCopyWithImpl<$Res, Costs>;
  @useResult
  $Res call({List<Cost> values});
}

/// @nodoc
class _$CostsCopyWithImpl<$Res, $Val extends Costs>
    implements $CostsCopyWith<$Res> {
  _$CostsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? values = null,
  }) {
    return _then(_value.copyWith(
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<Cost>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CostsImplCopyWith<$Res> implements $CostsCopyWith<$Res> {
  factory _$$CostsImplCopyWith(
          _$CostsImpl value, $Res Function(_$CostsImpl) then) =
      __$$CostsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Cost> values});
}

/// @nodoc
class __$$CostsImplCopyWithImpl<$Res>
    extends _$CostsCopyWithImpl<$Res, _$CostsImpl>
    implements _$$CostsImplCopyWith<$Res> {
  __$$CostsImplCopyWithImpl(
      _$CostsImpl _value, $Res Function(_$CostsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? values = null,
  }) {
    return _then(_$CostsImpl(
      values: null == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<Cost>,
    ));
  }
}

/// @nodoc

class _$CostsImpl implements _Costs {
  const _$CostsImpl({required final List<Cost> values}) : _values = values;

  final List<Cost> _values;
  @override
  List<Cost> get values {
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  @override
  String toString() {
    return 'Costs(values: $values)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CostsImpl &&
            const DeepCollectionEquality().equals(other._values, _values));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_values));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CostsImplCopyWith<_$CostsImpl> get copyWith =>
      __$$CostsImplCopyWithImpl<_$CostsImpl>(this, _$identity);
}

abstract class _Costs implements Costs {
  const factory _Costs({required final List<Cost> values}) = _$CostsImpl;

  @override
  List<Cost> get values;
  @override
  @JsonKey(ignore: true)
  _$$CostsImplCopyWith<_$CostsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
