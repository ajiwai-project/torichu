import 'package:flutter_template/domain/cost/cost.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({@Default([]) List<Cost> costs}) = _HomeState;
}
