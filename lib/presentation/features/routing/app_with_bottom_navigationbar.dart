import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/features/cost_list_viewer/cost_list_viewer_page.dart';
import 'package:flutter_template/presentation/features/registration/registration_page.dart';

class AppWithBottomNavigationbar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppWithBottomNavigationbarState();
  }
}

class _AppWithBottomNavigationbarState
    extends State<AppWithBottomNavigationbar> {
  static const _screens = [
    RegistrationPage(),
    CostListViewerPage(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Registration',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Costs',
          ),
        ],
        currentIndex: _currentIndex,
        fixedColor: Theme.of(context).colorScheme.onBackground,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _onItemTapped(int index) => setState(() => _currentIndex = index);
}
