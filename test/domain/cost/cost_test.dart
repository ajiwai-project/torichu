import 'package:flutter_template/domain/cost/amount.dart';
import 'package:flutter_template/domain/cost/category.dart';
import 'package:flutter_template/domain/cost/cost.dart';
import 'package:flutter_template/domain/cost/point.dart';
import 'package:flutter_template/domain/cost/tag.dart';
import 'package:flutter_template/domain/cost/tags.dart' as my;
import 'package:flutter_template/domain/cost/title.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final dummyTitle = Title.of('dummy');
  final dummyAmount = Amount.of(0);

  group('of', () {
    test('should create a cost with specified values', () {
      var id = 'id';
      var title = Title.of('title');
      var amount = Amount.of(10);
      var point = Point.one;
      var registeredAt = DateTime(2023);
      var tags = my.Tags.of([Tag.of('tag')]);

      var cost = Cost.of(
          id: id,
          title: title,
          amount: amount,
          point: point,
          registeredAt: registeredAt,
          tags: tags);

      expect(cost.id, id);
      expect(cost.title, title);
      expect(cost.amount, amount);
      expect(cost.point, point);
      expect(cost.registeredAt, registeredAt);
      expect(cost.tags, tags);
    });
  });

  group('initial', () {
    final emptyTags = my.Tags.of([]);

    test('should create a cost with specified values', () {
      var title = Title.of('title');
      var amount = Amount.of(10);
      var point = Point.two;
      final registeredAt = DateTime(2023, 8, 1);
      var tags = my.Tags.of([Tag.of('tag')]);

      var cost = Cost.initial(
          title: title,
          amount: amount,
          point: point,
          registeredAt: registeredAt,
          tags: tags);

      expect(cost.title, title);
      expect(cost.amount, amount);
      expect(cost.point, point);
      expect(cost.registeredAt, registeredAt);
      expect(cost.tags, tags);
    });

    test('should generate different id', () {
      var cost1 = Cost.initial(
          title: dummyTitle,
          amount: dummyAmount,
          point: Point.one,
          registeredAt: DateTime(2023),
          tags: emptyTags);
      var cost2 = Cost.initial(
          title: dummyTitle,
          amount: dummyAmount,
          point: Point.one,
          registeredAt: DateTime(2023),
          tags: emptyTags);

      expect(cost1.id, isNot(cost2.id));
    });
  });
}
