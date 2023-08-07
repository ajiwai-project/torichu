import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/domain/cost/costs.dart';
import 'package:flutter_template/domain/cost/point.dart';
import 'package:flutter_template/presentation/features/home/widgets/summary.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../domain/cost/model_support.dart';

void main() {
  group('Summary', () {
    render(tester, costs) async {
      await tester
          .pumpWidget(MaterialApp(home: Scaffold(body: Summary(costs: costs))));
    }

    testWidgets('should display one pie chart at first', (tester) async {
      var cost = CostBuilder().build();
      var costs = Costs(values: [cost]);
      await render(tester, costs);

      expect(find.byType(PieChart), findsOneWidget);
    });

    testWidgets('should show sum of expenses', (tester) async {
      var cost1 = CostBuilder().setAmount(380).setTitle('すき家').build();
      var cost2 = CostBuilder().setAmount(8800).setTitle('美容室').build();
      var costs = Costs(values: [cost1, cost2]);
      await render(tester, costs);
      await tester.tap(find.text('Total Amount'));
      await tester.pumpAndSettle();

      // Sum of expenses is 380 + 8800
      expect(find.text('￥9,180'), findsOneWidget);
    });

    testWidgets('should show sum of points', (tester) async {
      var cost1 = CostBuilder().setPoint(Point.three).setTitle('すき家').build();
      var cost2 = CostBuilder().setPoint(Point.eight).setTitle('美容室').build();
      var costs = Costs(values: [cost1, cost2]);
      await render(tester, costs);

      // Sum of points is 3 + 8
      expect(find.text('11'), findsOneWidget);
    });
  });
}
