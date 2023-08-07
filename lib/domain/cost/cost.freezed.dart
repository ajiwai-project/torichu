// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cost.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Cost {
  String get id => throw _privateConstructorUsedError;
  Title get title => throw _privateConstructorUsedError;
  Amount get amount => throw _privateConstructorUsedError;
  Point get point => throw _privateConstructorUsedError;
  Category get category => throw _privateConstructorUsedError;
  DateTime get registeredAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CostCopyWith<Cost> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CostCopyWith<$Res> {
  factory $CostCopyWith(Cost value, $Res Function(Cost) then) =
      _$CostCopyWithImpl<$Res, Cost>;
  @useResult
  $Res call(
      {String id,
      Title title,
      Amount amount,
      Point point,
      Category category,
      DateTime registeredAt});

  $TitleCopyWith<$Res> get title;
  $AmountCopyWith<$Res> get amount;
}

/// @nodoc
class _$CostCopyWithImpl<$Res, $Val extends Cost>
    implements $CostCopyWith<$Res> {
  _$CostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? amount = null,
    Object? point = null,
    Object? category = null,
    Object? registeredAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as Title,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as Point,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      registeredAt: null == registeredAt
          ? _value.registeredAt
          : registeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TitleCopyWith<$Res> get title {
    return $TitleCopyWith<$Res>(_value.title, (value) {
      return _then(_value.copyWith(title: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res> get amount {
    return $AmountCopyWith<$Res>(_value.amount, (value) {
      return _then(_value.copyWith(amount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CostCopyWith<$Res> implements $CostCopyWith<$Res> {
  factory _$$_CostCopyWith(_$_Cost value, $Res Function(_$_Cost) then) =
      __$$_CostCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      Title title,
      Amount amount,
      Point point,
      Category category,
      DateTime registeredAt});

  @override
  $TitleCopyWith<$Res> get title;
  @override
  $AmountCopyWith<$Res> get amount;
}

/// @nodoc
class __$$_CostCopyWithImpl<$Res> extends _$CostCopyWithImpl<$Res, _$_Cost>
    implements _$$_CostCopyWith<$Res> {
  __$$_CostCopyWithImpl(_$_Cost _value, $Res Function(_$_Cost) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? amount = null,
    Object? point = null,
    Object? category = null,
    Object? registeredAt = null,
  }) {
    return _then(_$_Cost(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as Title,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as Point,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      registeredAt: null == registeredAt
          ? _value.registeredAt
          : registeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_Cost implements _Cost {
  _$_Cost(
      {required this.id,
      required this.title,
      required this.amount,
      required this.point,
      required this.category,
      required this.registeredAt});

  @override
  final String id;
  @override
  final Title title;
  @override
  final Amount amount;
  @override
  final Point point;
  @override
  final Category category;
  @override
  final DateTime registeredAt;

  @override
  String toString() {
    return 'Cost._(id: $id, title: $title, amount: $amount, point: $point, category: $category, registeredAt: $registeredAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Cost &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.registeredAt, registeredAt) ||
                other.registeredAt == registeredAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, amount, point, category, registeredAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CostCopyWith<_$_Cost> get copyWith =>
      __$$_CostCopyWithImpl<_$_Cost>(this, _$identity);
}

abstract class _Cost implements Cost {
  factory _Cost(
      {required final String id,
      required final Title title,
      required final Amount amount,
      required final Point point,
      required final Category category,
      required final DateTime registeredAt}) = _$_Cost;

  @override
  String get id;
  @override
  Title get title;
  @override
  Amount get amount;
  @override
  Point get point;
  @override
  Category get category;
  @override
  DateTime get registeredAt;
  @override
  @JsonKey(ignore: true)
  _$$_CostCopyWith<_$_Cost> get copyWith => throw _privateConstructorUsedError;
}
