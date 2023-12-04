import 'package:flutter_template/domain/cost/costs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_state.freezed.dart';

@freezed
class CalendarState with _$CalendarState {
  const factory CalendarState({Costs? costs, required DateTime focusedDay}) =
      _CalendarState;
}
