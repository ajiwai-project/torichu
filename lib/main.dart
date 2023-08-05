import 'package:flutter/material.dart';
import 'package:flutter_template/color_schemes.g.dart';
import 'package:flutter_template/presentation/features/home/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'infrastructure/local_storage/domain/cost/cost_dao_model.dart';

void main() async {
  await Hive.initFlutter("Spender");

  Hive.registerAdapter(CostDaoModelAdapter());
  await Hive.openBox<CostDaoModel>('costBox');

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
          home: const HomePage())));
}
