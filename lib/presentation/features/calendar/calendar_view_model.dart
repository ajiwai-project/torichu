import 'package:clock/clock.dart';
import 'package:flutter_template/domain/cost/cost_repository.dart';
import 'package:flutter_template/domain/cost/costs.dart';
import 'package:flutter_template/infrastructure/local_storage/domain/cost/cost_db_repository.dart';
import 'package:flutter_template/presentation/features/calendar/calendar_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final calendarViewModelProvider = StateNotifierProvider.autoDispose<
        CalendarViewModel, AsyncValue<CalendarState>>(
    (ref) => CalendarViewModel(ref.read(costRepositoryProvider)));

class CalendarViewModel extends StateNotifier<AsyncValue<CalendarState>> {
  final CostRepository _costRepository;

  CalendarViewModel(this._costRepository) : super(const AsyncValue.loading());

  Future<void> load() async {
    try {
      final costs = await _costRepository.getAll();
      final now = clock.now();
      state = AsyncValue.data(CalendarState(
          costsByDateTime: costs.costsGroupByDate,
          focusedDay: DateTime.utc(now.year, now.month, now.day)));
    } on Exception catch (err, stack) {
      state = AsyncValue.error(err, stack);
    }
  }

  Future<void> remove(String id) async {
    try {
      await _costRepository.remove(id);
      await load();
    } on Exception catch (err, stack) {
      state = AsyncValue.error(err, stack);
    }
  }

  void setFocusedDay(DateTime focusedDay) {
    state = state.whenData((value) => value.copyWith(focusedDay: focusedDay));
  }
}
