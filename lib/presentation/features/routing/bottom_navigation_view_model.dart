import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_template/presentation/features/routing/bottom_navigation_state.dart';

final bottomNavigationViewModelProvider =
    StateNotifierProvider<BottomNavigationViewModel, BottomNavigationState>(
        (ref) => BottomNavigationViewModel());

class BottomNavigationViewModel extends StateNotifier<BottomNavigationState> {
  BottomNavigationViewModel() : super(const BottomNavigationState());

  void changeIndex(int index) {
    state = state.copyWith(index: index);
  }
}
