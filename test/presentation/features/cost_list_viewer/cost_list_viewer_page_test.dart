import 'package:flutter/material.dart';
import 'package:flutter_template/domain/cost/cost_repository.dart';
import 'package:flutter_template/domain/cost/costs.dart';
import 'package:flutter_template/domain/cost/tag.dart';
import 'package:flutter_template/infrastructure/local_storage/domain/cost/cost_db_repository.dart';
import 'package:flutter_template/presentation/features/cost_list_viewer/cost_list_viewer_page.dart';
import 'package:flutter_template/presentation/features/cost_list_viewer/widgets/cost_list_item.dart';
import 'package:flutter_template/presentation/features/cost_list_viewer/widgets/summary.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;

import '../../../domain/cost/model_support.dart';
import 'cost_list_viewer_page_test.mocks.dart';

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
          home: CostListViewerPage(),
        ),
      ),
    );
  }

  testWidgets('Should show cost items', (tester) async {
    final cost = CostBuilder().build();
    when(mockCostRepository.getAll())
        .thenAnswer((_) async => Costs(values: [cost]));
    await render(tester);
    await tester.pumpAndSettle();

    expect(find.byType(CostListItem), findsOneWidget);
  });

  testWidgets('支出を左から右方向へスワイプすると支出が削除されること android', (tester) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    final cost = CostBuilder().build();
    var callCount = 0;
    when(mockCostRepository.getAll()).thenAnswer((_) async => [
          Costs(values: [cost]),
          const Costs(values: [])
        ][callCount++]);
    await render(tester);
    await tester.pumpAndSettle();

    await tester.drag(find.byType(Dismissible), const Offset(500, 0));
    await tester.pumpAndSettle();

    expect(find.byType(CostListItem), findsNothing);
    debugDefaultTargetPlatformOverride = null;
  });

  testWidgets('支出を右から左方向へスワイプすると支出が削除されること ios', (tester) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    final cost = CostBuilder().build();
    var callCount = 0;
    when(mockCostRepository.getAll()).thenAnswer((_) async => [
          Costs(values: [cost]),
          const Costs(values: [])
        ][callCount++]);
    await render(tester);
    await tester.pumpAndSettle();

    await tester.drag(find.byType(Dismissible), const Offset(-500, 0));
    await tester.pumpAndSettle();

    expect(find.byType(CostListItem), findsNothing);
    debugDefaultTargetPlatformOverride = null;
  });

  testWidgets('should not show summy when number of costs is zero',
      (tester) async {
    when(mockCostRepository.getAll())
        .thenAnswer((_) async => const Costs(values: []));

    await render(tester);
    await tester.pumpAndSettle();

    expect(find.byType(Summary), findsNothing);
  });

  testWidgets('should show all tags', (tester) async {
    var tag1 = Tag.of('tag1');
    var tag2 = Tag.of('tag2');
    var cost = CostBuilder().addTag(tag1).addTag(tag2).build();
    when(mockCostRepository.getAll())
        .thenAnswer((_) async => Costs(values: [cost]));

    await render(tester);
    await tester.pumpAndSettle();

    expect(find.text('#tag1'), findsOneWidget);
    expect(find.text('#tag2'), findsOneWidget);
  });
}
