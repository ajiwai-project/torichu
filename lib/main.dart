import 'package:flutter/material.dart';
import 'package:flutter_template/color_schemes.g.dart';
import 'package:flutter_template/presentation/features/calendar/calendar_page.dart';
import 'package:flutter_template/infrastructure/sqlite/database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  setupSqlite();
  runApp(ProviderScope(
      child: MaterialApp(
          theme: ThemeData(
              useMaterial3: true,
              colorScheme: darkColorScheme,
              textTheme: TextTheme(
                  headlineLarge: TextStyle(color: darkColorScheme.onBackground),
                  headlineMedium:
                      TextStyle(color: darkColorScheme.onBackground),
                  headlineSmall: TextStyle(color: darkColorScheme.onBackground),
                  bodyLarge: TextStyle(color: darkColorScheme.onBackground),
                  bodyMedium: TextStyle(color: darkColorScheme.onBackground),
                  bodySmall: TextStyle(color: darkColorScheme.onBackground))),
          home: const CalendarPage())));
}
