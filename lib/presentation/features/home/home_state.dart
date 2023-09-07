import 'package:flutter_template/domain/cost/costs.dart';
import 'package:flutter_template/domain/saying/saying.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState(
      {@Default(Costs(values: [])) Costs costs,
      @Default(Saying(value: '', author: '')) Saying saying}) = _HomeState;
}
