import 'package:flutter_template/domain/expense/category.dart';
import 'package:flutter_template/domain/expense/expense.dart';
import 'package:flutter_template/domain/expense/point.dart';
import 'package:flutter_template/features/home/home_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeViewModelProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, AsyncValue<HomeState>>(
        (ref) => HomeViewModel());

class HomeViewModel extends StateNotifier<AsyncValue<HomeState>> {
  HomeViewModel() : super(const AsyncValue.loading());

  Future<void> load() async {
    final now = DateTime.now();
    final expense1 = Expense.of(
        id: "id1",
        title: "hoge",
        amount: 1000,
        point: Point.five,
        category: Category.food,
        date: now);
    final expense2 = Expense.of(
        id: "id2",
        title: "fuga",
        amount: 1000,
        point: Point.eight,
        category: Category.food,
        date: now);
    try {
      state = AsyncValue.data(HomeState(expenses: [expense1, expense2]));
    } on Exception catch (err, stack) {
      state = AsyncValue.error(err, stack);
    }
  }
}
