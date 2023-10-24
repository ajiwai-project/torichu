import 'package:flutter_template/domain/cost/point.dart';
import 'package:flutter_template/domain/cost/tags.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_state.freezed.dart';

@freezed
class RegistartionState with _$RegistartionState {
  const factory RegistartionState(
      {@Default('') String title,
      @Default(0) int price,
      Point? point,
      required DateTime registeredAt,
      required Tags tags}) = _RegistrationState;
}
