import 'package:flutter_template/features/models/cost.dart';
import 'package:flutter_template/features/models/point.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const dummyTitle = 'dummy';
  const dummyAmount = 1;
  const dummyPoint = Point.one;
  const dummyCategory = '食費';

  String generateStrings(int num) {
    return Iterable<String>.generate(num, (_) => 'a').join('');
  }

  group('Constructor', () {
    test('should have the values', () {
      var title = 'title';
      var amount = 10;
      var point = Point.two;
      var category = '食費';
      var cost =
          Cost(title: title, amount: amount, point: point, category: category);

      expect(cost.title, title);
      expect(cost.amount, amount);
      expect(cost.point, point);
      expect(cost.category, category);
    });

    test('should throw when title exceeds 100 characters', () {
      var characters = generateStrings(101);

      expect(
          () => Cost(
              title: characters,
              amount: dummyAmount,
              point: dummyPoint,
              category: dummyCategory),
          throwsException);
    });

    test('should throw when amount exceeds 9999999', () {
      var invalidAmount = 9999999 + 1;
      expect(
          () => Cost(
              title: dummyTitle,
              amount: invalidAmount,
              point: dummyPoint,
              category: dummyCategory),
          throwsException);
    });

    test('should throw when category is invalid', () {
      expect(
          () => Cost(
              title: dummyTitle,
              amount: dummyAmount,
              point: dummyPoint,
              category: 'invalid'),
          throwsException);
    });
  });
}
