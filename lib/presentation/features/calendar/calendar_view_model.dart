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
      state = AsyncValue.data(
          CalendarState(pointByDateTime: costs.pointGroupByDate));
    } on Exception catch (err, stack) {
      state = AsyncValue.error(err, stack);
    }
  }
}
