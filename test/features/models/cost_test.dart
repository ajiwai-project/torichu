import 'package:flutter_template/features/models/cost.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const dummyTitle = 'dummy';
  const dummyAmount = 1;
  const dummyPoint = 1;
  const dummyCategory = '食費';

  String generateStrings(int num) {
    return Iterable<String>.generate(num, (_) => 'a').join('');
  }

  group('Constructor', () {
    test('should have the values', () {
      var title = 'title';
      var amount = 10;
      var point = 1;
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

    final nonFibonacciBolow55 = [
      4,
      6,
      7,
      9,
      11,
      12,
      14,
      15,
      16,
      17,
      18,
      19,
      20,
      22,
      23,
      24,
      25,
      16,
      27,
      28,
      29,
      30,
      31,
      32,
      33,
      36,
      37,
      38,
      39,
      40,
      41,
      42,
      43,
      44,
      45,
      46,
      47,
      48,
      49,
      50,
      51,
      52,
      53,
      54
    ];

    for (final point in nonFibonacciBolow55) {
      test('should throw when point is not Fibonacci number below 55', () {
        expect(
            () => Cost(
                title: dummyTitle,
                amount: dummyAmount,
                point: point,
                category: dummyCategory),
            throwsException);
      });
    }

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
