import 'package:flutter_template/domain/cost/cost_repository.dart';
import 'package:flutter_template/domain/cost/costs.dart';
import 'package:flutter_template/domain/saying/saying_repository.dart';
import 'package:flutter_template/infrastructure/local_storage/domain/saying/saying_memory_repository.dart';
import 'package:flutter_template/presentation/features/cost_list_viewer/cost_list_viewer_state.dart';
import 'package:flutter_template/infrastructure/local_storage/domain/cost/cost_db_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeViewModelProvider =
    StateNotifierProvider.autoDispose<CostListViewerViewModel, AsyncValue<CostListViewerState>>(
        (ref) => CostListViewerViewModel(ref.read(costRepositoryProvider),
            ref.read(sayingRepositoryProvider)));

class CostListViewerViewModel extends StateNotifier<AsyncValue<CostListViewerState>> {
  final CostRepository _costRepository;
  final SayingRepository _sayingRepository;

  CostListViewerViewModel(this._costRepository, this._sayingRepository)
      : super(const AsyncValue.loading());

  Future<void> load() async {
    try {
      final costs = await _costRepository.getAll();
      final saying = await _sayingRepository.choice();

      state = AsyncValue.data(CostListViewerState(
          costs: costs.sortByRegisteredAt(desc: true), saying: saying));
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
