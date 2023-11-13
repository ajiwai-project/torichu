import 'package:clock/clock.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/domain/cost/cost_repository.dart';
import 'package:flutter_template/domain/cost/costs.dart';
import 'package:flutter_template/domain/cost/size.dart';
import 'package:flutter_template/infrastructure/sqlite/domain/cost/cost_db_repository.dart';
import 'package:flutter_template/presentation/features/calendar/calendar_page.dart';
import 'package:flutter_template/presentation/widgets/cost_list/cost_list_item.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../domain/cost/model_support.dart';
import 'calendar_page_test.mocks.dart';

@GenerateMocks([CostRepository])
void main() {
  late MockCostRepository mockCostRepository;

  setUp(() {
    mockCostRepository = MockCostRepository();
  });

  render(tester) async {
    await tester.pumpWidget(ProviderScope(overrides: [
      costRepositoryProvider.overrideWith((ref) => mockCostRepository)
    ], child: const MaterialApp(home: CalendarPage())));
  }

  testWidgets('Sum of sizes should be shown in calendar', (tester) async {
    withClock(Clock.fixed(DateTime(2023, 10, 30)), () async {
      final dateTime = DateTime(2023, 10, 18);
      final cost1 =
          CostBuilder().setSize(Size.small).setRegisteredAt(dateTime).build();
      final cost2 =
          CostBuilder().setSize(Size.large).setRegisteredAt(dateTime).build();
      when(mockCostRepository.getAll())
          .thenAnswer((_) async => Costs(values: [cost1, cost2]));

      await render(tester);
      await tester.pumpAndSettle();

      expect(
          find.descendant(
              of: find.byKey(const Key('20231018-size')),
              matching: find.text('4')),
          findsOneWidget);
    });
  });

  group('Size should be shown', () {
    final dateFormat = DateFormat('yyyyMMdd');
    final testCases = [
      {
        'description': 'when today has cost',
        'dateTime': DateTime(2023, 10, 30),
      },
      {
        'description': 'when past day has cost',
        'dateTime': DateTime(2023, 10, 29),
      }
    ];

    for (final testCase in testCases) {
      testWidgets(testCase['description'] as String, (tester) async {
        withClock(Clock.fixed(DateTime(2023, 10, 30)), () async {
          final dateTime = testCase['dateTime'] as DateTime;
          final cost = CostBuilder()
              .setSize(Size.small)
              .setRegisteredAt(dateTime)
              .build();
          when(mockCostRepository.getAll())
              .thenAnswer((_) async => Costs(values: [cost]));

          await render(tester);
          await tester.pumpAndSettle();

          expect(
              find.descendant(
                  of: find.byKey(Key('${dateFormat.format(dateTime)}-size')),
                  matching: find.text("1")),
              findsOneWidget);
        });
      });
    }
  });

  testWidgets(
      'Costs of today should be shown on the bottom of calendar at first',
      (tester) async {
    final today = DateTime(2023, 10, 10);
    withClock(Clock.fixed(today), () async {
      final cost1 =
          CostBuilder().setTitle('title 1').setRegisteredAt(today).build();
      final cost2 =
          CostBuilder().setTitle('title 2').setRegisteredAt(today).build();
      when(mockCostRepository.getAll())
          .thenAnswer((_) async => Costs(values: [cost1, cost2]));

      await render(tester);
      await tester.pumpAndSettle();

      expect(find.byType(CostListItem), findsNWidgets(2));
    });
  });

  testWidgets('Costs of tapped day should be shown', (tester) async {
    final today = DateTime(2023, 10, 10);
    withClock(Clock.fixed(today), () async {
      final todayCost =
          CostBuilder().setTitle('title 1').setRegisteredAt(today).build();
      final yesterdayCost1 = CostBuilder()
          .setTitle('title 2')
          .setRegisteredAt(today.add(const Duration(days: -1)))
          .build();
      final yesterdayCost2 = CostBuilder()
          .setTitle('title 3')
          .setRegisteredAt(today.add(const Duration(days: -1)))
          .build();
      when(mockCostRepository.getAll()).thenAnswer((_) async =>
          Costs(values: [todayCost, yesterdayCost1, yesterdayCost2]));

      await render(tester);
      await tester.pumpAndSettle();

      expect(find.byType(CostListItem), findsOneWidget);

      await tester.tap(find.text('9'));
      await tester.pumpAndSettle();

      expect(find.byType(CostListItem), findsNWidgets(2));
    });
  });

  testWidgets('支出を左から右方向にスワイプすると支出が削除されること android', (tester) async {
    final today = DateTime(2023, 10, 10);
    withClock(Clock.fixed(today), () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;

      final cost = CostBuilder().setId('cost').setRegisteredAt(today).build();
      var callCount = 0;
      when(mockCostRepository.getAll()).thenAnswer((_) async => [
            Costs(values: [cost]),
            const Costs(values: [])
          ][callCount++]);
      await render(tester);
      await tester.pumpAndSettle();

      await tester.drag(find.byType(Dismissible), const Offset(500, 0));
      await tester.pumpAndSettle();

      verify(mockCostRepository.remove('cost')).called(1);
      expect(find.byType(CostListItem), findsNothing);
      debugDefaultTargetPlatformOverride = null;
    });
  });

  testWidgets('支出を右から左方向へスワイプすると支出が削除されること ios', (tester) async {
    final today = DateTime(2023, 10, 10);

    withClock(Clock.fixed(today), () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

      final cost = CostBuilder().setId('cost').setRegisteredAt(today).build();
      var callCount = 0;
      when(mockCostRepository.getAll()).thenAnswer((_) async => [
            Costs(values: [cost]),
            const Costs(values: [])
          ][callCount++]);
      await render(tester);
      await tester.pumpAndSettle();

      await tester.drag(find.byType(Dismissible), const Offset(-500, 0));
      await tester.pumpAndSettle();

      verify(mockCostRepository.remove('cost')).called(1);
      expect(find.byType(CostListItem), findsNothing);
      debugDefaultTargetPlatformOverride = null;
    });
  });
}
