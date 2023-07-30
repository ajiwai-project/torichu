import 'package:flutter_template/domain/cost/category.dart';
import 'package:flutter_template/domain/cost/cost.dart';
import 'package:flutter_template/domain/cost/point.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const dummyId = 'dummy';
  const dummyTitle = 'dummy';
  const dummyAmount = 1;
  const dummyPoint = Point.one;
  const dummyCategory = Category.food;
  var dummyRegisteredAt = DateTime(1900, 1, 1, 1);

  String generateStrings(int num) {
    return Iterable<String>.generate(num, (_) => 'a').join('');
  }

  group('Factory', () {
    test('should have the values', () {
      var id = 'id';
      var title = 'title';
      var amount = 10;
      var point = Point.two;
      var category = Category.food;
      var registeredAt = DateTime(2023, 7, 30, 12);
      var cost = Cost.of(
          id: id,
          title: title,
          amount: amount,
          point: point,
          category: category,
          registeredAt: registeredAt);

      expect(cost.id, id);
      expect(cost.title, title);
      expect(cost.amount, amount);
      expect(cost.point, point);
      expect(cost.category, category);
      expect(cost.registeredAt, registeredAt);
    });

    test('should throw when title exceeds 100 characters', () {
      var characters = generateStrings(101);

      expect(
          () => Cost.of(
              id: dummyId,
              title: characters,
              amount: dummyAmount,
              point: dummyPoint,
              category: dummyCategory,
              registeredAt: dummyRegisteredAt),
          throwsException);
    });

    test('should throw when amount exceeds 9999999', () {
      var invalidAmount = 9999999 + 1;
      expect(
          () => Cost.of(
              id: dummyId,
              title: dummyTitle,
              amount: invalidAmount,
              point: dummyPoint,
              category: dummyCategory,
              registeredAt: dummyRegisteredAt),
          throwsException);
    });
  });
}
