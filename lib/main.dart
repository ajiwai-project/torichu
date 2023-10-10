import 'package:flutter/material.dart';
import 'package:flutter_template/color_schemes.g.dart';
import 'package:flutter_template/infrastructure/local_storage/domain/cost/cost_dao_model.dart';
import 'package:flutter_template/infrastructure/local_storage/domain/cost/cost_type_adapter.dart';
import 'package:flutter_template/infrastructure/local_storage/domain/cost/tag_dao_model.dart';
import 'package:flutter_template/presentation/features/routing/app_with_bottom_navigationbar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  await Hive.initFlutter("Spender");

  Hive.registerAdapter(CostDaoModelAdapter());
  Hive.registerAdapter(TagDaoModelAdapter());
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
          home: const AppWithBottomNavigationbar())));
}
