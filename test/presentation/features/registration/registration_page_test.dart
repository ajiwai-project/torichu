import 'package:flutter/material.dart';
import 'package:flutter_template/domain/cost/category.dart';
import 'package:flutter_template/domain/cost/cost.dart';
import 'package:flutter_template/domain/cost/cost_repository.dart';
import 'package:flutter_template/domain/cost/costs.dart';
import 'package:flutter_template/domain/cost/point.dart';
import 'package:flutter_template/presentation/features/home/home_page.dart';
import 'package:flutter_template/presentation/features/registration/registration_page.dart';
import 'package:flutter_template/infrastructure/local_storage/domain/cost/cost_db_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../domain/cost/cost_mather.dart';
import 'registration_page_test.mocks.dart';

@GenerateMocks([CostRepository])
void main() {
  late MockCostRepository mockCostRepository;

  const dummyCost = Cost(
      id: "id1",
      title: 'すき家の牛丼',
      amount: 1000,
      point: Point.one,
      category: Category.food);
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
    await tester.enterText(titleField, cost.title);

    final priceField = find.byKey(const Key('price-field'));
    await tester.enterText(priceField, cost.amount.toString());

    final pointField = find.byKey(const Key('point-field'));
    await tester.tap(pointField);
    await tester.pumpAndSettle();
    final pointItem = find.text(cost.point.value.toString());
    await tester.tap(pointItem);
    await tester.pumpAndSettle();

    final categoryField = find.byKey(const Key('category-field'));
    await tester.tap(categoryField);
    await tester.pumpAndSettle();
    final categoryItem = find.text(cost.category.value.toString());
    await tester.tap(categoryItem);
    await tester.pumpAndSettle();
  }

  testWidgets('should save cost when push submit button', (tester) async {
    await render(tester);
    when(mockCostRepository.getAll())
        .thenAnswer((_) async => const Costs(values: [dummyCost]));
    await inputForm(tester, dummyCost);

    final submitButton = find.byKey(const Key('register-button'));
    await tester.tap(submitButton);
    await tester.pumpAndSettle();

    final costWithoutId = Cost.initial(
        title: 'すき家の牛丼',
        amount: 1000,
        point: Point.one,
        category: Category.food);
    verify(mockCostRepository
            .save(argThat(CostMatcherWithoutId(costWithoutId))))
        .called(1);
  });

  testWidgets('should move to home page when push submit button',
      (tester) async {
    await render(tester);
    when(mockCostRepository.getAll())
        .thenAnswer((_) async => const Costs(values: [dummyCost]));
    await inputForm(tester, dummyCost);

    final submitButton = find.byKey(const Key('register-button'));
    await tester.tap(submitButton);
    await tester.pumpAndSettle();

    expect(find.byType(HomePage), findsOneWidget);
  });
}
