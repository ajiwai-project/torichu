import 'package:flutter_template/domain/cost/costs.dart';
import 'package:flutter_test/flutter_test.dart';

import 'model_support.dart';

void main() {
  group('SortByRegisteredAt', () {
    test('should sort in descending order when desc is true', () {
      var cost1 =
          CostBuilder().setRegisteredAt(DateTime(2023, 7, 30, 11)).build();
      var cost2 =
          CostBuilder().setRegisteredAt(DateTime(2023, 7, 30, 10)).build();
      var cost3 =
          CostBuilder().setRegisteredAt(DateTime(2023, 7, 30, 12)).build();
      var costs = Costs(values: [cost1, cost2, cost3]);

      var actual = costs.sortByRegisteredAt(desc: true);

      var expected = Costs(values: [cost3, cost1, cost2]);
      expect(actual, expected);
    });

    test('should sort in ascending order when desc is false', () {
      var cost1 =
          CostBuilder().setRegisteredAt(DateTime(2023, 7, 30, 11)).build();
      var cost2 =
          CostBuilder().setRegisteredAt(DateTime(2023, 7, 30, 10)).build();
      var cost3 =
          CostBuilder().setRegisteredAt(DateTime(2023, 7, 30, 12)).build();
      var costs = Costs(values: [cost1, cost2, cost3]);

      var actual = costs.sortByRegisteredAt(desc: false);

      var expected = Costs(values: [cost2, cost1, cost3]);
      expect(actual, expected);
    });
  });

  group('IsEmpty', () {
    test('should be true when values is empty', () {
      var costs = const Costs(values: []);

      expect(costs.isEmpty, true);
    });

    test('should be false when values is not empty', () {
      var cost = CostBuilder().build();
      var costs = Costs(values: [cost]);

      expect(costs.isEmpty, false);
    });
  });
}
