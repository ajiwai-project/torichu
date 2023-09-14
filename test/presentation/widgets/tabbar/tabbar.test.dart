import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/features/cost_list_viewer/cost_list_viewer_page.dart';
import 'package:flutter_template/presentation/features/registration/registration_page.dart';
import 'package:flutter_template/presentation/widgets/tabbar/tabbar.dart';

void main() {
  render(tester) async {
    await tester.pumpWidget(ProviderScope(overrides: [
      costRepositoryProvider.overrideWith((ref) => mockCostRepository)
    ], child: const MaterialApp(home: BottomTabPage())));
  }

  testWidgets('should registeration page when opening app', (tester) async {
    await render(tester);
    expect(find.byType(RegisterationPage), findsOneWidget);
  });

  testWidgets('should move page when tap tab', (tester) async {
    await render(tester);
    await tester.tap(find.text('Costs'));
    await tester.pumpAndSettle();
    expect(find.byType(CostListViewerPage), findsOneWidget);
    await tester.tap(find.test('Registeration'));
    await tester.pumpAndSettle();
    expect(find.byType(RegisterationPage), findsOneWidget);
  });
}
