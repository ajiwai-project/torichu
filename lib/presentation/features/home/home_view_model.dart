import 'package:collection/collection.dart';
import 'package:flutter_template/domain/cost/cost_repository.dart';
import 'package:flutter_template/domain/cost/costs.dart';
import 'package:flutter_template/presentation/features/home/home_state.dart';
import 'package:flutter_template/infrastructure/local_storage/domain/cost/cost_db_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeViewModelProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, AsyncValue<HomeState>>(
        (ref) => HomeViewModel(ref.read(costRepositoryProvider)));

class HomeViewModel extends StateNotifier<AsyncValue<HomeState>> {
  final CostRepository _costRepository;
  HomeViewModel(this._costRepository) : super(const AsyncValue.loading());

  Future<void> load() async {
    try {
      final costs = await _costRepository.getAll();
      final sortedCosts = _sortByDateTimeInOrderDesc(costs);

      state = AsyncValue.data(HomeState(costs: sortedCosts));
    } on Exception catch (err, stack) {
      state = AsyncValue.error(err, stack);
    }
  }

  Costs _sortByDateTimeInOrderDesc(Costs costs) {
    return Costs(
        values: costs.values.sorted((a, b) {
      if (a.datetime == null || b.datetime == null) {
        return 0;
      }
      return b.datetime!.compareTo(a.datetime!);
    }).toList());
  }

  Future<void> remove(String id) async {
    try {
      await _costRepository.remove(id);
      await load();
    } on Exception catch (err, stack) {
      state = AsyncValue.error(err, stack);
    }
  }
}
