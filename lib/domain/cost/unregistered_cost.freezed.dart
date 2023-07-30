// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unregistered_cost.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UnregisteredCost {
  String get title => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  Point get point => throw _privateConstructorUsedError;
  Category get category => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UnregisteredCostCopyWith<UnregisteredCost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnregisteredCostCopyWith<$Res> {
  factory $UnregisteredCostCopyWith(
          UnregisteredCost value, $Res Function(UnregisteredCost) then) =
      _$UnregisteredCostCopyWithImpl<$Res, UnregisteredCost>;
  @useResult
  $Res call({String title, int amount, Point point, Category category});
}

/// @nodoc
class _$UnregisteredCostCopyWithImpl<$Res, $Val extends UnregisteredCost>
    implements $UnregisteredCostCopyWith<$Res> {
  _$UnregisteredCostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? amount = null,
    Object? point = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as Point,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UnregisteredCostCopyWith<$Res>
    implements $UnregisteredCostCopyWith<$Res> {
  factory _$$_UnregisteredCostCopyWith(
          _$_UnregisteredCost value, $Res Function(_$_UnregisteredCost) then) =
      __$$_UnregisteredCostCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, int amount, Point point, Category category});
}

/// @nodoc
class __$$_UnregisteredCostCopyWithImpl<$Res>
    extends _$UnregisteredCostCopyWithImpl<$Res, _$_UnregisteredCost>
    implements _$$_UnregisteredCostCopyWith<$Res> {
  __$$_UnregisteredCostCopyWithImpl(
      _$_UnregisteredCost _value, $Res Function(_$_UnregisteredCost) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? amount = null,
    Object? point = null,
    Object? category = null,
  }) {
    return _then(_$_UnregisteredCost(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as Point,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
    ));
  }
}

/// @nodoc

class _$_UnregisteredCost implements _UnregisteredCost {
  const _$_UnregisteredCost(
      {required this.title,
      required this.amount,
      required this.point,
      required this.category});

  @override
  final String title;
  @override
  final int amount;
  @override
  final Point point;
  @override
  final Category category;

  @override
  String toString() {
    return 'UnregisteredCost(title: $title, amount: $amount, point: $point, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnregisteredCost &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, amount, point, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnregisteredCostCopyWith<_$_UnregisteredCost> get copyWith =>
      __$$_UnregisteredCostCopyWithImpl<_$_UnregisteredCost>(this, _$identity);
}

abstract class _UnregisteredCost implements UnregisteredCost {
  const factory _UnregisteredCost(
      {required final String title,
      required final int amount,
      required final Point point,
      required final Category category}) = _$_UnregisteredCost;

  @override
  String get title;
  @override
  int get amount;
  @override
  Point get point;
  @override
  Category get category;
  @override
  @JsonKey(ignore: true)
  _$$_UnregisteredCostCopyWith<_$_UnregisteredCost> get copyWith =>
      throw _privateConstructorUsedError;
}
