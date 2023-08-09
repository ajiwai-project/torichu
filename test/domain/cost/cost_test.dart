import 'package:flutter_template/domain/cost/amount.dart';
import 'package:flutter_template/domain/cost/category.dart';
import 'package:flutter_template/domain/cost/cost.dart';
import 'package:flutter_template/domain/cost/point.dart';
import 'package:flutter_template/domain/cost/title.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final dummyTitle = Title.of('dummy');
  final dummyAmount = Amount.of(0);

  group('initial', () {
    test('should generate different id', () {
      var cost1 = Cost.initial(
          title: dummyTitle,
          amount: dummyAmount,
          point: Point.one,
          category: Category.food);
      var cost2 = Cost.initial(
          title: dummyTitle,
          amount: dummyAmount,
          point: Point.one,
          category: Category.food);

      expect(cost1.id, isNot(cost2.id));
    });

    test('should set created at time to created at time', () {
      var cost1 = Cost.initial(
          title: dummyTitle,
          amount: dummyAmount,
          point: Point.one,
          category: Category.food);
      var cost2 = Cost.initial(
          title: dummyTitle,
          amount: dummyAmount,
          point: Point.one,
          category: Category.food);

      expect(cost1.registeredAt.isBefore(cost2.registeredAt), true);
    });
  });
}
