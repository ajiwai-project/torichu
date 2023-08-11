import 'package:flutter_template/domain/cost/amount.dart';
import 'package:flutter_template/domain/cost/category.dart';
import 'package:flutter_template/domain/cost/cost.dart';
import 'package:flutter_template/domain/cost/point.dart';
import 'package:flutter_template/domain/tag/tag.dart';
import 'package:flutter_template/domain/tag/tags.dart';
import 'package:flutter_template/domain/cost/title.dart';

class CostBuilder {
  String id = 'dummy';
  String title = 'dummy';
  int amount = 0;
  Point point = Point.one;
  Category category = Category.food;
  DateTime registeredAt = DateTime(1900);
  Tags tags = Tags.of([]);

  CostBuilder setId(String id) {
    this.id = id;
    return this;
  }

  CostBuilder setTitle(String title) {
    this.title = title;
    return this;
  }

  CostBuilder setAmount(int amount) {
    this.amount = amount;
    return this;
  }

  CostBuilder setPoint(Point point) {
    this.point = point;
    return this;
  }

  CostBuilder setCategory(Category category) {
    this.category = category;
    return this;
  }

  CostBuilder setRegisteredAt(DateTime registeredAt) {
    this.registeredAt = registeredAt;
    return this;
  }

  CostBuilder addTag(Tag tag) {
    tags = Tags.of([...tags.value, tag]);
    return this;
  }

  Cost build() {
    return Cost.of(
        id: id,
        title: Title.of(title),
        amount: Amount.of(amount),
        point: point,
        category: category,
        registeredAt: registeredAt,
        tags: tags);
  }
}
