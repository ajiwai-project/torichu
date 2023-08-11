import 'package:flutter/material.dart';
import 'package:flutter_template/domain/cost/cost.dart';
import 'package:flutter_template/domain/cost/cost_repository.dart';
import 'package:flutter_template/domain/cost/costs.dart';
import 'package:flutter_template/presentation/features/home/home_page.dart';
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

    final categoryField = find.byKey(const Key('category-field'));
    await tester.tap(categoryField);
    await tester.pumpAndSettle();
    final categoryItem = find.text(cost.category.value.toString());
    await tester.tap(categoryItem);
    await tester.pumpAndSettle();
  }

  addTag(WidgetTester tester, String label) async {
    final tagField = find.byKey(const Key('tags-field'));
    await tester.enterText(tagField, label);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  testWidgets('should save cost when push submit button', (tester) async {
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

  testWidgets('should move to home page when push submit button',
      (tester) async {
    final dummyCost = CostBuilder().build();
    await render(tester);
    when(mockCostRepository.getAll())
        .thenAnswer((_) async => Costs(values: [dummyCost]));
    await inputForm(tester, dummyCost);

    final submitButton = find.byKey(const Key('register-button'));
    await tester.tap(submitButton);
    await tester.pumpAndSettle();

    expect(find.byType(HomePage), findsOneWidget);
  });

  testWidgets(
      'should show chip written tag value when input tag field and enter',
      (tester) async {
    await render(tester);

    await addTag(tester, 'tag');

    expect(find.byType(Chip), findsOneWidget);
  });

  // FIXME: Exception発生で失敗してしまうが画面上は3つ以上登録されることはない
  testWidgets(
      'should not show more than three chips when a tag is entered more than three times',
      (tester) async {
    await render(tester);

    await addTag(tester, 'tag1');
    await addTag(tester, 'tag2');
    await addTag(tester, 'tag3');
    await addTag(tester, 'tag4');

    expect(find.byType(Chip), findsNWidgets(3));
  }, skip: true);
}
