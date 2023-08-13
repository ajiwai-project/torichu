import 'package:flutter_template/domain/cost/amount.dart';
import 'package:flutter_template/domain/cost/category.dart';
import 'package:flutter_template/domain/cost/cost.dart';
import 'package:flutter_template/domain/cost/cost_repository.dart';
import 'package:flutter_template/domain/cost/point.dart';
import 'package:flutter_template/domain/cost/title.dart';
import 'package:flutter_template/domain/cost/tag.dart';
import 'package:flutter_template/domain/cost/tags.dart';
import 'package:flutter_template/presentation/features/registration/registration_state.dart';
import 'package:flutter_template/infrastructure/local_storage/domain/cost/cost_db_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final registrationViewModelProvider =
    StateNotifierProvider<RegistrationViewModel, RegistartionState>(
        (ref) => RegistrationViewModel(ref.read(costRepositoryProvider)));

class RegistrationViewModel extends StateNotifier<RegistartionState> {
  final CostRepository _costRepository;

  RegistrationViewModel(this._costRepository)
      : super(RegistartionState(tags: Tags.empty()));

  Future<void> register() async {
    if (state.point == null || state.category == null) {
      return;
    }

    await _costRepository.save(Cost.initial(
        title: Title.of(state.title),
        amount: Amount.of(state.price),
        point: state.point!,
        category: state.category!,
        tags: state.tags));
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

  void addTag(Tag tag) {
    try {
      state = state.copyWith(tags: state.tags.add(tag));
    } catch (e) {
      // TODO: 画面側になんらかの表示を出すようにする
    }
  }

  void removeTag(Tag tag) {
    state = state.copyWith(tags: state.tags.remove(tag));
  }
}
