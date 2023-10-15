import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_template/presentation/features/routing/bottom_navigation_view_model.dart';

void main() {
  test('initial index is 0', () {
    final sut = BottomNavigationViewModel();
    expect(sut.debugState.index, 0);
  });

  test('change index', () {
    final sut = BottomNavigationViewModel();
    sut.changeIndex(1);
    expect(sut.debugState.index, 1);
  });
}
