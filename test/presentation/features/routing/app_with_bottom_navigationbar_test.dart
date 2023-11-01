import 'package:flutter/material.dart';
import 'package:flutter_template/domain/cost/cost_repository.dart';
import 'package:flutter_template/domain/cost/costs.dart';
import 'package:flutter_template/infrastructure/local_storage/domain/cost/cost_db_repository.dart';
import 'package:flutter_template/presentation/features/registration/registration_page.dart';
import 'package:flutter_template/presentation/features/routing/app_with_bottom_navigationbar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'app_with_bottom_navigationbar_test.mocks.dart';

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
          home: AppWithBottomNavigationbar(),
        ),
      ),
    );
  }

  testWidgets('should registeration page when opening app', (tester) async {
    await render(tester);
    expect(find.byType(RegistrationPage), findsOneWidget);
  });

  testWidgets('should move page when tap tab', (tester) async {
    when(mockCostRepository.getAll())
        .thenAnswer((_) async => const Costs(values: []));
    await render(tester);
    await tester.tap(find.text('Registration'));
    await tester.pumpAndSettle();
    expect(find.byType(RegistrationPage), findsOneWidget);
  });
}
