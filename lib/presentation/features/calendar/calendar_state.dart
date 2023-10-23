import 'package:flutter_template/domain/cost/costs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_state.freezed.dart';

@freezed
class CalendarState with _$CalendarState {
  const factory CalendarState(
      {@Default({}) Map<DateTime, Costs> costsByDateTime,
      required DateTime focusedDay}) = _CalendarState;
}
