import 'package:flutter_template/domain/saying/saying_repository.dart';
import 'package:flutter_template/infrastructure/local_storage/domain/saying/saying_memory_repository.dart';
import 'package:flutter_template/presentation/features/calendar/widgets/saying/saying_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sayingViewModelProvider =
    StateNotifierProvider.autoDispose<SayingViewModel, AsyncValue<SayingState>>(
        (ref) => SayingViewModel(ref.read(sayingRepositoryProvider)));

class SayingViewModel extends StateNotifier<AsyncValue<SayingState>> {
  final SayingRepository _sayingRepository;

  SayingViewModel(this._sayingRepository) : super(const AsyncValue.loading());

  Future<void> load() async {
    try {
      final saying = await _sayingRepository.choice();

      state = AsyncValue.data(SayingState(saying: saying));
    } on Exception catch (err, stack) {
      state = AsyncValue.error(err, stack);
    }
  }
}
