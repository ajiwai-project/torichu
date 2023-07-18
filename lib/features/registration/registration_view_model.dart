import 'package:flutter_template/features/models/category.dart';
import 'package:flutter_template/features/models/cost.dart';
import 'package:flutter_template/features/models/point.dart';
import 'package:flutter_template/features/registration/registration_state.dart';
import 'package:flutter_template/infrastructure/repository/cost_db_repository.dart';
import 'package:flutter_template/infrastructure/repository/cost_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final registrationViewModelProvider =
    StateNotifierProvider<RegistrationViewModel, RegistartionState>(
        (ref) => RegistrationViewModel(ref.read(costRepositoryProvider)));

class RegistrationViewModel extends StateNotifier<RegistartionState> {
  final CostRepository _costRepository;

  RegistrationViewModel(this._costRepository)
      : super(const RegistartionState());

  Future<void> register() async {
    if (state.point == null || state.category == null) {
      return;
    }

    await _costRepository.save(Cost.of(
        title: state.title,
        amount: state.price,
        point: state.point!,
        category: state.category!));
  }

  void setTitle(String value) {
    state = state.copyWith(title: value);
  }

  void setPoint(Point value) {
    state = state.copyWith(point: value);
  }

  void setPrice(int value) {
    state = state.copyWith(price: value);
  }

  void setCategory(Category value) {
    state = state.copyWith(category: value);
  }
}
