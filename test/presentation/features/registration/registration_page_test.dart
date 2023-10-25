import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/domain/cost/cost.dart';
import 'package:flutter_template/domain/cost/cost_repository.dart';
import 'package:flutter_template/domain/cost/costs.dart';
import 'package:flutter_template/presentation/features/registration/registration_page.dart';
import 'package:flutter_template/infrastructure/local_storage/domain/cost/cost_db_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../domain/cost/cost_mather.dart';
import '../../../domain/cost/model_support.dart';
import 'registration_page_test.mocks.dart';

@GenerateMocks([CostRepository])
void main() {
  late MockCostRepository mockCostRepository;

  setUp(() {
    mockCostRepository = MockCostRepository();
  });

  render(tester) async {
    await tester.pumpWidget(ProviderScope(overrides: [
      costRepositoryProvider.overrideWith((ref) => mockCostRepository)
    ], child: const MaterialApp(home: RegistrationPage())));
  }

  inputForm(WidgetTester tester, Cost cost) async {
    final titleField = find.byKey(const Key('title-field'));
    await tester.enterText(titleField, cost.title.value);

    final priceField = find.byKey(const Key('price-field'));
    await tester.enterText(priceField, cost.amount.value.toString());

    final pointField = find.byKey(const Key('point-field'));
    await tester.tap(pointField);
    await tester.pumpAndSettle();
    final pointItem = find.text(cost.point.value.toString());
    await tester.tap(pointItem);
    await tester.pumpAndSettle();
  }

  testWidgets(
      'should save cost without registeration date when push submit button',
      (tester) async {
    final dummyCost = CostBuilder().build();
    await render(tester);
    when(mockCostRepository.getAll())
        .thenAnswer((_) async => Costs(values: [dummyCost]));
    await inputForm(tester, dummyCost);

    final submitButton = find.byKey(const Key('register-button'));
    await tester.tap(submitButton);
    await tester.pumpAndSettle();

    verify(mockCostRepository
            .save(argThat(matchingWithoutIdAndRegisteredAt(dummyCost))))
        .called(1);
  });

  testWidgets(
      'should save cost with registeration date when push submit button',
      (tester) async {
    withClock(Clock.fixed(DateTime(2023, 8, 31)), () async {
      final dummyCost =
          CostBuilder().setRegisteredAt(DateTime(2023, 8, 30)).build();
      await render(tester);
      when(mockCostRepository.getAll())
          .thenAnswer((_) async => Costs(values: [dummyCost]));
      await inputForm(tester, dummyCost);
      await tester.tap(find.byKey(const Key('registered-at-field')));
      await tester.pumpAndSettle();
      await tester.tap(find.text('30'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      final submitButton = find.byKey(const Key('register-button'));
      await tester.tap(submitButton);
      await tester.pumpAndSettle();

      verify(mockCostRepository.save(argThat(matchingWithoutId(dummyCost))))
          .called(1);
    });
  });
}
