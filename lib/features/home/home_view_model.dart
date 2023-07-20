import 'package:flutter_template/features/home/home_state.dart';
import 'package:flutter_template/infrastructure/repository/cost_db_repository.dart';
import 'package:flutter_template/infrastructure/repository/cost_repository.dart';
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
      state = AsyncValue.data(HomeState(costs: costs));
    } on Exception catch (err, stack) {
      state = AsyncValue.error(err, stack);
    }
  }
}
