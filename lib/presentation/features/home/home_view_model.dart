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

      state = AsyncValue.data(HomeState(costs: costs.sortByRegisteredAt(desc: true)));
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
}
