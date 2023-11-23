import 'package:flutter/material.dart';
import 'package:flutter_template/domain/cost/cost.dart';
import 'package:flutter_template/domain/cost/cost_repository.dart';
import 'package:flutter_template/domain/cost/costs.dart';
import 'package:flutter_template/domain/cost/size.dart';
import 'package:flutter_template/presentation/features/calendar/widgets/registration/registration_form.dart';
import 'package:flutter_template/infrastructure/sqlite/domain/cost/cost_db_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../domain/cost/cost_mather.dart';
import '../../../../../domain/cost/model_support.dart';
import 'registration_form_test.mocks.dart';

@GenerateMocks([CostRepository])
void main() {
  late MockCostRepository mockCostRepository;

  setUp(() {
    mockCostRepository = MockCostRepository();
  });

  renderWithHandler(WidgetTester tester, Function? handleOnSuccess) async {
    await tester.pumpWidget(ProviderScope(overrides: [
      costRepositoryProvider.overrideWith((ref) => mockCostRepository)
    ], child: MaterialApp(home: RegistrationForm(onSuccess: handleOnSuccess))));
  }

  render(WidgetTester tester) async {
    await renderWithHandler(tester, null);
  }

  inputForm(WidgetTester tester, Cost cost) async {
    final titleField = find.byKey(const Key('title-field'));
    await tester.enterText(titleField, cost.title.value);

    final priceField = find.byKey(const Key('price-field'));
    await tester.enterText(priceField, cost.amount.value.toString());

    final sizeField = find.byKey(const Key('size-field'));
    await tester.tap(sizeField);
    await tester.pumpAndSettle();
    final sizeItem = find.text(cost.size.upperCase());
    await tester.tap(sizeItem);
    await tester.pumpAndSettle();
  }

  testWidgets('should save cost when push submit button', (tester) async {
    final dummyCost = CostBuilder().build();
    await render(tester);
    await inputForm(tester, dummyCost);

    final submitButton = find.byKey(const Key('register-button'));
    await tester.tap(submitButton);
    await tester.pumpAndSettle();

    verify(mockCostRepository
            .save(argThat(matchingWithoutIdAndRegisteredAt(dummyCost))))
        .called(1);
  });

  testWidgets('should called success handler when register new data',
      (tester) async {
    final dummyCost = CostBuilder().build();
    when(mockCostRepository.getAll())
        .thenAnswer((_) async => Costs(values: [dummyCost]));
    await renderWithHandler(tester, () => mockCostRepository.getAll());
    await inputForm(tester, dummyCost);

    final submitButton = find.byKey(const Key('register-button'));
    await tester.tap(submitButton);
    await tester.pumpAndSettle();

    verify(mockCostRepository.getAll()).called(1);
  });
}
