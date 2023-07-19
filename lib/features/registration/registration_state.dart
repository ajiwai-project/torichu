import 'package:flutter_template/features/models/category.dart';
import 'package:flutter_template/features/models/point.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_state.freezed.dart';

@freezed
class RegistartionState with _$RegistartionState {
  const factory RegistartionState(
      {@Default('') String title,
      @Default(0) int price,
      Point? point,
      Category? category}) = _RegistrationState;
}
