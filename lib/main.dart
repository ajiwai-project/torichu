import 'package:flutter/material.dart';
import 'package:flutter_template/features/home/home_page.dart';
import 'package:flutter_template/infrastructure/model/cost_dao_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(CostDaoModelAdapter());
  await Hive.openBox<CostDaoModel>('costBox');

  runApp(const ProviderScope(child: MaterialApp(home: HomePage())));
}
