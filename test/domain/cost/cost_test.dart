import 'package:flutter_template/domain/cost/amount.dart';
import 'package:flutter_template/domain/cost/cost.dart';
import 'package:flutter_template/domain/cost/title.dart';
import 'package:flutter_template/domain/cost/size.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clock/clock.dart';

void main() {
  final dummyTitle = Title.of('dummy');
  final dummyAmount = Amount.of(0);

  group('of', () {
    test('should create a cost with specified values', () {
      var id = 'id';
      var title = Title.of('title');
      var amount = Amount.of(10);
      var size = Size.medium;
      var registeredAt = DateTime(2023);

      var cost = Cost.of(
        id: id,
        title: title,
        amount: amount,
        size: size,
        registeredAt: registeredAt,
      );

      expect(cost.id, id);
      expect(cost.title, title);
      expect(cost.amount, amount);
      expect(cost.registeredAt, registeredAt);
    });
  });

  group('initial', () {
    test('should create a cost with specified values', () {
      var title = Title.of('title');
      var amount = Amount.of(10);
      var size = Size.medium;
      final registeredAt = DateTime(2023, 8, 1);

      var cost = Cost.initial(
        title: title,
        amount: amount,
        size: size,
        registeredAt: registeredAt,
      );

      expect(cost.title, title);
      expect(cost.amount, amount);
      expect(cost.size, size);
      expect(cost.registeredAt, registeredAt);
    });

    test('should generate different id', () {
      var cost1 = Cost.initial(
        title: dummyTitle,
        amount: dummyAmount,
        size: Size.medium,
        registeredAt: DateTime(2023),
      );
      var cost2 = Cost.initial(
        title: dummyTitle,
        amount: dummyAmount,
        size: Size.medium,
        registeredAt: DateTime(2023),
      );

      expect(cost1.id, isNot(cost2.id));
    });
    test('should generate a cost at now', () {
      withClock(Clock.fixed(DateTime(2023, 8, 1)), () {
        final cost = Cost.initial(
          title: dummyTitle,
          amount: dummyAmount,
          size: Size.medium,
        );

        expect(cost.registeredAt, DateTime(2023, 8, 1));
      });
    });
  });
}
