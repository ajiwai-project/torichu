// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegistartionState {
  String get title => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  Point? get point => throw _privateConstructorUsedError;
  Category? get category => throw _privateConstructorUsedError;
  Tags get tags => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegistartionStateCopyWith<RegistartionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistartionStateCopyWith<$Res> {
  factory $RegistartionStateCopyWith(
          RegistartionState value, $Res Function(RegistartionState) then) =
      _$RegistartionStateCopyWithImpl<$Res, RegistartionState>;
  @useResult
  $Res call(
      {String title, int price, Point? point, Category? category, Tags tags});

  $TagsCopyWith<$Res> get tags;
}

/// @nodoc
class _$RegistartionStateCopyWithImpl<$Res, $Val extends RegistartionState>
    implements $RegistartionStateCopyWith<$Res> {
  _$RegistartionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? price = null,
    Object? point = freezed,
    Object? category = freezed,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      point: freezed == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as Point?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as Tags,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TagsCopyWith<$Res> get tags {
    return $TagsCopyWith<$Res>(_value.tags, (value) {
      return _then(_value.copyWith(tags: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RegistrationStateCopyWith<$Res>
    implements $RegistartionStateCopyWith<$Res> {
  factory _$$_RegistrationStateCopyWith(_$_RegistrationState value,
          $Res Function(_$_RegistrationState) then) =
      __$$_RegistrationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title, int price, Point? point, Category? category, Tags tags});

  @override
  $TagsCopyWith<$Res> get tags;
}

/// @nodoc
class __$$_RegistrationStateCopyWithImpl<$Res>
    extends _$RegistartionStateCopyWithImpl<$Res, _$_RegistrationState>
    implements _$$_RegistrationStateCopyWith<$Res> {
  __$$_RegistrationStateCopyWithImpl(
      _$_RegistrationState _value, $Res Function(_$_RegistrationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? price = null,
    Object? point = freezed,
    Object? category = freezed,
    Object? tags = null,
  }) {
    return _then(_$_RegistrationState(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      point: freezed == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as Point?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as Tags,
    ));
  }
}

/// @nodoc

class _$_RegistrationState implements _RegistrationState {
  const _$_RegistrationState(
      {this.title = '',
      this.price = 0,
      this.point,
      this.category,
      required this.tags});

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final int price;
  @override
  final Point? point;
  @override
  final Category? category;
  @override
  final Tags tags;

  @override
  String toString() {
    return 'RegistartionState(title: $title, price: $price, point: $point, category: $category, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegistrationState &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.tags, tags) || other.tags == tags));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, price, point, category, tags);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegistrationStateCopyWith<_$_RegistrationState> get copyWith =>
      __$$_RegistrationStateCopyWithImpl<_$_RegistrationState>(
          this, _$identity);
}

abstract class _RegistrationState implements RegistartionState {
  const factory _RegistrationState(
      {final String title,
      final int price,
      final Point? point,
      final Category? category,
      required final Tags tags}) = _$_RegistrationState;

  @override
  String get title;
  @override
  int get price;
  @override
  Point? get point;
  @override
  Category? get category;
  @override
  Tags get tags;
  @override
  @JsonKey(ignore: true)
  _$$_RegistrationStateCopyWith<_$_RegistrationState> get copyWith =>
      throw _privateConstructorUsedError;
}
