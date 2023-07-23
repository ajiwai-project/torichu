import 'package:flutter/material.dart';
import 'package:flutter_template/domain/cost/category.dart';
import 'package:flutter_template/domain/cost/cost.dart';
import 'package:flutter_template/domain/cost/cost_repository.dart';
import 'package:flutter_template/domain/cost/costs.dart';
import 'package:flutter_template/domain/cost/point.dart';
import 'package:flutter_template/infrastructure/local_storage/domain/cost/cost_db_repository.dart';
import 'package:flutter_template/presentation/features/home/home_page.dart';
import 'package:flutter_template/presentation/features/home/widgets/cost_list_item.dart';
import 'package:flutter_template/presentation/features/registration/registration_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_page_test.mocks.dart';

@GenerateMocks([CostRepository])
void main() {
  late CostRepository mockCostRepository;

  setUp(() {
    mockCostRepository = MockCostRepository();
  });

  render(tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          costRepositoryProvider.overrideWith((_) => mockCostRepository),
        ],
        child: const MaterialApp(
          home: HomePage(),
        ),
      ),
    );
  }

  testWidgets('Should show cost items', (tester) async {
    const cost = Cost(
      title: 'title',
      amount: 100,
      point: Point.one,
      category: Category.food,
    );
    when(mockCostRepository.getAll()).thenAnswer((_) async => const Costs(values: [cost]));
    await render(tester);
    await tester.pumpAndSettle();

    expect(find.byType(CostListItem), findsOneWidget);
  });

  testWidgets('should move to registration page when floading button is pushed',
      (tester) async {
    when(mockCostRepository.getAll()).thenAnswer((_) async => const Costs(values: []));
    await render(tester);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(find.byType(RegistrationPage), findsOneWidget);
  });
}
