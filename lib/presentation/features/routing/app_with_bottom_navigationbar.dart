import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/features/calendar/calendar_page.dart';
import 'package:flutter_template/presentation/features/cost_list_viewer/cost_list_viewer_page.dart';
import 'package:flutter_template/presentation/features/registration/registration_page.dart';
import 'package:flutter_template/presentation/features/routing/bottom_navigation_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppWithBottomNavigationbar extends HookConsumerWidget {
  const AppWithBottomNavigationbar({Key? key}) : super(key: key);

  static const _screens = [
    RegistrationPage(),
    CostListViewerPage(),
    CalendarPage()
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bottomNavigationViewModelProvider);
    final viewModel = ref.watch(bottomNavigationViewModelProvider.notifier);
    return Scaffold(
      body: _screens.elementAt(state.index),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Registration',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Costs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
        ],
        currentIndex: state.index,
        fixedColor: Theme.of(context).colorScheme.onBackground,
        onTap: viewModel.changeIndex,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
