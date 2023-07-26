import 'package:flutter/material.dart';
import 'package:flutter_template/domain/cost/category.dart';
import 'package:flutter_template/domain/cost/cost.dart';
import 'package:flutter_template/domain/cost/cost_repository.dart';
import 'package:flutter_template/domain/cost/point.dart';
import 'package:flutter_template/presentation/features/registration/registration_page.dart';
import 'package:flutter_template/infrastructure/local_storage/domain/cost/cost_db_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'registration_page_test.mocks.dart';

@GenerateMocks([CostRepository])
void main() {
  late CostRepository mockCostRepository;

  setUp(() {
    mockCostRepository = MockCostRepository();
  });

  render(tester) async {
    await tester.pumpWidget(ProviderScope(overrides: [
      costRepositoryProvider.overrideWith((ref) => mockCostRepository)
    ], child: const MaterialApp(home: RegistrationPage())));
  }

  testWidgets('should save cost when push submit button', (tester) async {
    await render(tester);

    final titleField = find.byKey(const Key('title-field'));
    await tester.enterText(titleField, 'すき家の牛丼');

    final priceField = find.byKey(const Key('price-field'));
    await tester.enterText(priceField, '1000');

    final pointField = find.byKey(const Key('point-field'));
    await tester.tap(pointField);
    await tester.pumpAndSettle();
    final pointItem = find.text('1');
    await tester.tap(pointItem);
    await tester.pumpAndSettle();

    final categoryField = find.byKey(const Key('category-field'));
    await tester.tap(categoryField);
    await tester.pumpAndSettle();
    final categoryItem = find.text('食費');
    await tester.tap(categoryItem);
    await tester.pumpAndSettle();

    final submitButton = find.byKey(const Key('register-button'));
    await tester.tap(submitButton);
    await tester.pumpAndSettle();

    var cost = Cost.initial(
        title: 'すき家の牛丼',
        amount: 1000,
        point: Point.one,
        category: Category.food);
    verify(mockCostRepository.save(cost)).called(1);
  });
}
