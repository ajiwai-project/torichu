import 'package:flutter_template/features/models/cost.dart';
import 'package:flutter_template/infrastructure/repository/cost_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegistrationViewModel extends StateNotifier<AsyncValue<void>> {
  final CostRepository _costRepository;

  RegistrationViewModel(this._costRepository)
      : super(const AsyncValue.loading());

  Future<void> register(Cost cost) async {
    await _costRepository.save(cost);
  }
}
