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
}
