import 'package:flutter_template/domain/cost/category.dart';
import 'package:flutter_template/domain/cost/costs.dart';
import 'package:flutter_template/domain/cost/point.dart';
import 'package:flutter_test/flutter_test.dart';

import 'model_support.dart';

void main() {
  group('AmountGroupByCategory', () {
    test('should return sum of amount for each category', () {
      var cost1 =
          CostBuilder().setAmount(500).setCategory(Category.food).build();
      var cost2 =
          CostBuilder().setAmount(300).setCategory(Category.food).build();
      var cost3 =
          CostBuilder().setAmount(300).setCategory(Category.hobbies).build();
      var cost4 = CostBuilder()
          .setAmount(700)
          .setCategory(Category.entertainment)
          .build();
      var costs = Costs(values: [cost1, cost2, cost3, cost4]);

      var actual = costs.amountGroupByCategory;

      var expected = {
        Category.food: 800,
        Category.hobbies: 300,
        Category.entertainment: 700
      };

      expect(actual, expected);
    });
  });

  group('PointGroupByCategory', () {
    test('should return sum of point for each category', () {
      var cost1 =
          CostBuilder().setPoint(Point.two).setCategory(Category.food).build();
      var cost2 =
          CostBuilder().setPoint(Point.five).setCategory(Category.food).build();
      var cost3 = CostBuilder()
          .setPoint(Point.one)
          .setCategory(Category.hobbies)
          .build();
      var cost4 = CostBuilder()
          .setPoint(Point.thirteen)
          .setCategory(Category.entertainment)
          .build();
      var costs = Costs(values: [cost1, cost2, cost3, cost4]);

      var actual = costs.pointGroupByCategory;

      var expected = {
        Category.food: 2 + 5,
        Category.hobbies: 1,
        Category.entertainment: 13
      };

      expect(actual, expected);
    });
  });

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

  group('CostsGroupByDate', () {
    test('should return costs for each day', () {
      var cost1 =
          CostBuilder().setRegisteredAt(DateTime(2023, 10, 10, 11)).build();
      var cost2 =
          CostBuilder().setRegisteredAt(DateTime(2023, 10, 10, 10)).build();
      var cost3 =
          CostBuilder().setRegisteredAt(DateTime(2023, 10, 11, 12)).build();
      var costs = Costs(values: [cost1, cost2, cost3]);

      var actual = costs.costsGroupByDate;

      var expected = {
        DateTime.utc(2023, 10, 10): Costs(values: [cost1, cost2]),
        DateTime.utc(2023, 10, 11): Costs(values: [cost3])
      };
      expect(actual, expected);
    });
  });
}
