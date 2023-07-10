import 'package:flutter_template/features/task_edit/task.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({@Default([]) List<Task> tasks}) = _HomeState;
}
