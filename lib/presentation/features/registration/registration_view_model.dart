import 'package:flutter_template/domain/cost/amount.dart';
import 'package:flutter_template/domain/cost/cost.dart';
import 'package:flutter_template/domain/cost/cost_repository.dart';
import 'package:flutter_template/domain/cost/point.dart';
import 'package:flutter_template/domain/cost/size.dart';
import 'package:flutter_template/domain/cost/title.dart';
import 'package:flutter_template/presentation/features/registration/registration_state.dart';
import 'package:flutter_template/infrastructure/local_storage/domain/cost/cost_db_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final registrationViewModelProvider =
    StateNotifierProvider<RegistrationViewModel, RegistartionState>(
        (ref) => RegistrationViewModel(ref.read(costRepositoryProvider)));

class RegistrationViewModel extends StateNotifier<RegistartionState> {
  final CostRepository _costRepository;

  RegistrationViewModel(this._costRepository)
      : super(const RegistartionState());

  Future<void> register() async {
    if (state.point == null || state.size == null) {
      return;
    }

    await _costRepository.save(Cost.initial(
      title: Title.of(state.title),
      amount: Amount.of(state.price),
      point: state.point!,
      size: state.size!,
    ));
  }

  void setTitle(String value) {
    state = state.copyWith(title: value);
  }

  void setPoint(Point value) {
    state = state.copyWith(point: value);
  }

  void setSize(Size value) {
    state = state.copyWith(size: value);
  }

  void setPrice(int value) {
    state = state.copyWith(price: value);
  }
}
