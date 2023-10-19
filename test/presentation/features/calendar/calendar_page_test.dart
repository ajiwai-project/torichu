import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/domain/cost/cost_repository.dart';
import 'package:flutter_template/domain/cost/costs.dart';
import 'package:flutter_template/domain/cost/point.dart';
import 'package:flutter_template/infrastructure/local_storage/domain/cost/cost_db_repository.dart';
import 'package:flutter_template/presentation/features/calendar/calendar_page.dart';
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

  testWidgets('Sum of points should be shown in calendar', (tester) async {
    withClock(Clock.fixed(DateTime(2023, 10, 30)), () async {
      final dateTime = DateTime(2023, 10, 18);
      final cost1 =
          CostBuilder().setPoint(Point.one).setRegisteredAt(dateTime).build();
      final cost2 =
          CostBuilder().setPoint(Point.three).setRegisteredAt(dateTime).build();
      when(mockCostRepository.getAll())
          .thenAnswer((_) async => Costs(values: [cost1, cost2]));

      await render(tester);
      await tester.pumpAndSettle();

      expect(
          find.descendant(
              of: find.byKey(const Key('20231018-point')),
              matching: find.text('4')),
          findsOneWidget);
    });
  });

  group('Point should be shown', () {
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
              .setPoint(Point.one)
              .setRegisteredAt(dateTime)
              .build();
          when(mockCostRepository.getAll())
              .thenAnswer((_) async => Costs(values: [cost]));

          await render(tester);
          await tester.pumpAndSettle();

          expect(
              find.descendant(
                  of: find.byKey(Key('${dateFormat.format(dateTime)}-point')),
                  matching: find.text('1')),
              findsOneWidget);
        });
      });
    }
  });
}
