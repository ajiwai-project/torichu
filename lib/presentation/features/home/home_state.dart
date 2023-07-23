import 'package:flutter_template/domain/cost/costs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({@Default(Costs(values: [])) Costs costs}) = _HomeState;
}
